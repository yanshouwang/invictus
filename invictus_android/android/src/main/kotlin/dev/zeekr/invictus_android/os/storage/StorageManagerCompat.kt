package dev.zeekr.invictus_android.os.storage

import android.content.Context
import android.os.Build
import android.os.storage.StorageManager
import android.os.storage.StorageVolume
import dev.zeekr.invictus_android.InvictusObject
import net.bytebuddy.ByteBuddy
import net.bytebuddy.android.AndroidClassLoadingStrategy
import net.bytebuddy.description.method.MethodDescription
import net.bytebuddy.implementation.InvocationHandlerAdapter
import net.bytebuddy.matcher.ElementMatchers
import java.util.concurrent.Executor

object StorageManagerCompat {
    abstract class StorageVolumeCallbackCompat : InvictusObject {
        companion object {
            internal val clazz: Class<*>
                get() = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) StorageManager.StorageVolumeCallback::class.java
                else Class.forName("android.os.storage.StorageManager\$StorageVolumeCallback")
        }

        final override val obj: Any

        constructor(context: Context) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                this.obj = object : StorageManager.StorageVolumeCallback() {
                    override fun onStateChanged(volume: StorageVolume) {
                        super.onStateChanged(volume)
                        this@StorageVolumeCallbackCompat.onStateChanged(volume)
                    }
                }
            } else {
                val matcher = ElementMatchers.named<MethodDescription>("onStateChanged")
                val implementation = InvocationHandlerAdapter.of { _, _, args ->
                    val volume = args[0] as StorageVolume
                    this.onStateChanged(volume)
                }
                val privateDirectory = context.getDir("generated", Context.MODE_PRIVATE)
                val classLoadingStrategy = AndroidClassLoadingStrategy.Wrapping(privateDirectory)
                this.obj =
                    ByteBuddy().subclass(clazz).method(matcher).intercept(implementation).make()
                        .load(clazz.classLoader, classLoadingStrategy).loaded.getConstructor()
                        .newInstance()
            }
        }

        abstract fun onStateChanged(volume: StorageVolume)
    }

    fun registerStorageVolumeCallback(
        thiz: StorageManager, executor: Executor, callback: StorageVolumeCallbackCompat
    ) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            thiz.registerStorageVolumeCallback(
                executor, callback.obj as StorageManager.StorageVolumeCallback
            )
        } else {
            StorageManager::class.java.getMethod(
                "registerStorageVolumeCallback",
                Executor::class.java,
                StorageVolumeCallbackCompat.clazz
            ).invoke(thiz, executor, callback.obj)
        }
    }

    fun unregisterStorageVolumeCallback(
        thiz: StorageManager, callback: StorageVolumeCallbackCompat
    ) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            thiz.unregisterStorageVolumeCallback(callback.obj as StorageManager.StorageVolumeCallback)
        } else {
            StorageManager::class.java.getMethod(
                "unregisterStorageVolumeCallback", StorageVolumeCallbackCompat.clazz
            ).invoke(thiz, callback.obj)
        }
    }

    fun getVolumes(thiz: StorageManager): List<VolumeInfo> {
        val objs = StorageManager::class.java.getMethod("getVolumes").invoke(thiz) as List<*>
        return objs.filterNotNull().map { obj -> VolumeInfo(obj) }
    }

    fun registerListener(thiz: StorageManager, listener: StorageEventListener) {
        StorageManager::class.java.getMethod("registerListener", StorageEventListener.clazz)
            .invoke(thiz, listener.obj)
    }

    fun unregisterListener(thiz: StorageManager, listener: StorageEventListener) {
        StorageManager::class.java.getMethod("unregisterListener", StorageEventListener.clazz)
            .invoke(thiz, listener.obj)
    }

    fun findVolumeById(thiz: StorageManager, id: String): VolumeInfo? {
        val obj = StorageManager::class.java.getMethod("findVolumeById", String::class.java)
            .invoke(thiz, id)
        return if (obj == null) null
        else VolumeInfo(obj)
    }

    fun mount(thiz: StorageManager, volId: String) {
        StorageManager::class.java.getMethod("mount", String::class.java).invoke(thiz, volId)
    }

    fun unmount(thiz: StorageManager, volId: String) {
        StorageManager::class.java.getMethod("unmount", String::class.java).invoke(thiz, volId)
    }

    fun format(thiz: StorageManager, volId: String) {
        StorageManager::class.java.getMethod("format", String::class.java).invoke(thiz, volId)
    }
}
