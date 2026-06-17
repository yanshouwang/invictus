package dev.zeekr.invictus_android.os.storage

import android.content.Context
import net.bytebuddy.ByteBuddy
import net.bytebuddy.android.AndroidClassLoadingStrategy
import net.bytebuddy.description.method.MethodDescription
import net.bytebuddy.implementation.InvocationHandlerAdapter
import net.bytebuddy.matcher.ElementMatchers

abstract class InvictusStorageEventListener {
    companion object {
        val clazz: Class<*> get() = Class.forName("android.os.storage.StorageEventListener")
    }

    val obj: Any

    constructor(context: Context) {
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
                    val vol = InvictusVolumeInfo(args[0])
                    val oldState = args[1] as Int
                    val newState = args[2] as Int
                    this.onVolumeStateChanged(vol, oldState, newState)
                }

                "onVolumeRecordChanged" -> {
                    val rec = InvictusVolumeRecord(args[0])
                    this.onVolumeRecordChanged(rec)
                }

                "onVolumeForgotten" -> {
                    val fsUuid = args[0] as String
                    this.onVolumeForgotten(fsUuid)
                }

                "onDiskScanned" -> {
                    val disk = InvictusDiskInfo(args[0])
                    val volumeCount = args[1] as Int
                    this.onDiskScanned(disk, volumeCount)
                }

                "onDiskDestroyed" -> {
                    val disk = InvictusDiskInfo(args[0])
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
    abstract fun onVolumeStateChanged(vol: InvictusVolumeInfo, oldState: Int, newState: Int)
    abstract fun onVolumeRecordChanged(rec: InvictusVolumeRecord)
    abstract fun onVolumeForgotten(fsUuid: String)
    abstract fun onDiskScanned(disk: InvictusDiskInfo, volumeCount: Int)
    abstract fun onDiskDestroyed(disk: InvictusDiskInfo)
}

interface JniInvictusStorageEventListener {
    fun onUsbMassStorageConnectionChanged(connected: Boolean)
    fun onStorageStateChanged(path: String?, oldState: String, newState: String)
    fun onVolumeStateChanged(vol: InvictusVolumeInfo, oldState: Int, newState: Int)
    fun onVolumeRecordChanged(rec: InvictusVolumeRecord)
    fun onVolumeForgotten(fsUuid: String)
    fun onDiskScanned(disk: InvictusDiskInfo, volumeCount: Int)
    fun onDiskDestroyed(disk: InvictusDiskInfo)
}

class JniInvictusStorageEventListenerImpl(
    context: Context, val listener: JniInvictusStorageEventListener
) : InvictusStorageEventListener(context) {
    override fun onUsbMassStorageConnectionChanged(connected: Boolean) {
        listener.onUsbMassStorageConnectionChanged(connected)
    }

    override fun onStorageStateChanged(path: String?, oldState: String, newState: String) {
        listener.onStorageStateChanged(path, oldState, newState)
    }

    override fun onVolumeStateChanged(vol: InvictusVolumeInfo, oldState: Int, newState: Int) {
        listener.onVolumeStateChanged(vol, oldState, newState)
    }

    override fun onVolumeRecordChanged(rec: InvictusVolumeRecord) {
        listener.onVolumeRecordChanged(rec)
    }

    override fun onVolumeForgotten(fsUuid: String) {
        listener.onVolumeForgotten(fsUuid)
    }

    override fun onDiskScanned(disk: InvictusDiskInfo, volumeCount: Int) {
        listener.onDiskScanned(disk, volumeCount)
    }

    override fun onDiskDestroyed(disk: InvictusDiskInfo) {
        listener.onDiskDestroyed(disk)
    }
}