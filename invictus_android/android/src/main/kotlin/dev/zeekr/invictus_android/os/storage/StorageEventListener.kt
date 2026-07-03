package dev.zeekr.invictus_android.os.storage

import android.content.Context
import dev.zeekr.invictus_android.InvictusObject
import net.bytebuddy.ByteBuddy
import net.bytebuddy.android.AndroidClassLoadingStrategy
import net.bytebuddy.description.method.MethodDescription
import net.bytebuddy.implementation.InvocationHandlerAdapter
import net.bytebuddy.matcher.ElementMatchers

abstract class StorageEventListener(context: Context) : InvictusObject() {
    companion object {
        internal val clazz: Class<*> get() = Class.forName("android.os.storage.StorageEventListener")
    }

    final override val obj: Any

    init {
        val matcher = ElementMatchers.any<MethodDescription>()
        val implementation = InvocationHandlerAdapter.of { _, method, args ->
            when (method.name) {
                "onUsbMassStorageConnectionChanged" -> {
                    val connected = args[0] as Boolean
                    this.onUsbMassStorageConnectionChanged(connected)
                }

                "onStorageStateChanged" -> {
                    val path = args[0] as String?
                    val oldState = args[1] as String
                    val newState = args[2] as String
                    this.onStorageStateChanged(path, oldState, newState)
                }

                "onVolumeStateChanged" -> {
                    val vol = VolumeInfo(args[0])
                    val oldState = args[1] as Int
                    val newState = args[2] as Int
                    this.onVolumeStateChanged(vol, oldState, newState)
                }

                "onVolumeRecordChanged" -> {
                    val rec = VolumeRecord(args[0])
                    this.onVolumeRecordChanged(rec)
                }

                "onVolumeForgotten" -> {
                    val fsUuid = args[0] as String
                    this.onVolumeForgotten(fsUuid)
                }

                "onDiskScanned" -> {
                    val disk = DiskInfo(args[0])
                    val volumeCount = args[1] as Int
                    this.onDiskScanned(disk, volumeCount)
                }

                "onDiskDestroyed" -> {
                    val disk = DiskInfo(args[0])
                    this.onDiskDestroyed(disk)
                }
            }
        }
        val privateDirectory = context.getDir("generated", Context.MODE_PRIVATE)
        val classLoadingStrategy = AndroidClassLoadingStrategy.Wrapping(privateDirectory)
        this.obj = ByteBuddy().subclass(clazz).method(matcher).intercept(implementation).make()
            .load(clazz.classLoader, classLoadingStrategy).loaded.getConstructor().newInstance()
    }

    abstract fun onUsbMassStorageConnectionChanged(connected: Boolean)
    abstract fun onStorageStateChanged(path: String?, oldState: String, newState: String)
    abstract fun onVolumeStateChanged(vol: VolumeInfo, oldState: Int, newState: Int)
    abstract fun onVolumeRecordChanged(rec: VolumeRecord)
    abstract fun onVolumeForgotten(fsUuid: String)
    abstract fun onDiskScanned(disk: DiskInfo, volumeCount: Int)
    abstract fun onDiskDestroyed(disk: DiskInfo)
}
