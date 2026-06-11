package dev.zeekr.invictus_android.os.storage

import android.content.Context
import android.os.storage.StorageManager
import android.os.storage.StorageVolume
import net.bytebuddy.ByteBuddy
import net.bytebuddy.android.AndroidClassLoadingStrategy
import net.bytebuddy.description.method.MethodDescription
import net.bytebuddy.implementation.InvocationHandlerAdapter
import net.bytebuddy.matcher.ElementMatchers
import java.util.concurrent.Executor

class InvictusStorageManager(val obj: StorageManager) {
    abstract class InvictusStorageVolumeCallback {
        companion object {
            val clazz: Class<*> get() = Class.forName("android.os.storage.StorageManager\$StorageVolumeCallback")
        }

        val obj: Any

        constructor(context: Context) {
            val matcher = ElementMatchers.named<MethodDescription>("onStateChanged")
            val implementation = InvocationHandlerAdapter.of { _, _, args ->
                val volume = args[0] as StorageVolume
                onStateChanged(volume)
            }
            val privateDirectory = context.getDir("generated", Context.MODE_PRIVATE)
            val classLoadingStrategy = AndroidClassLoadingStrategy.Wrapping(privateDirectory)
            this.obj = ByteBuddy().subclass(clazz).method(matcher).intercept(implementation).make()
                .load(clazz.classLoader, classLoadingStrategy).loaded.getConstructor().newInstance()
        }

        abstract fun onStateChanged(volume: StorageVolume)
    }

    interface JniInvictusStorageVolumeCallback {
        fun onStateChanged(volume: StorageVolume)
    }

    class JniInvictusStorageVolumeCallbackImpl(
        context: Context, val callback: JniInvictusStorageVolumeCallback
    ) : InvictusStorageVolumeCallback(context) {
        override fun onStateChanged(volume: StorageVolume) {
            callback.onStateChanged(volume)
        }
    }

    companion object {
        val clazz: Class<*> get() = StorageManager::class.java
    }

    fun registerListener(listener: InvictusStorageEventListener) {
        clazz.getMethod("registerListener", InvictusStorageEventListener.clazz)
            .invoke(this.obj, listener.obj)
    }

    fun unregisterListener(listener: InvictusStorageEventListener) {
        clazz.getMethod("unregisterListener", InvictusStorageEventListener.clazz)
            .invoke(this.obj, listener.obj)
    }

    fun registerStorageVolumeCallback(executor: Executor, callback: InvictusStorageVolumeCallback) {
        clazz.getMethod(
            "registerStorageVolumeCallback",
            Executor::class.java,
            InvictusStorageVolumeCallback.clazz
        ).invoke(this.obj, executor, callback.obj)
    }

    fun unregisterStorageVolumeCallback(callback: InvictusStorageVolumeCallback) {
        clazz.getMethod("registerStorageVolumeCallback", InvictusStorageVolumeCallback.clazz)
            .invoke(this.obj, callback.obj)
    }

    fun mount(volId: String) {
        clazz.getMethod("mount", String::class.java).invoke(this.obj, volId)
    }

    fun unmount(volId: String) {
        clazz.getMethod("unmount", String::class.java).invoke(this.obj, volId)
    }

    fun format(volId: String) {
        clazz.getMethod("format", String::class.java).invoke(this.obj, volId)
    }
}
