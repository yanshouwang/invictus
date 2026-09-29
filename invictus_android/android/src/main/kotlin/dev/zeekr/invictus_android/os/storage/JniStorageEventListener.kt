package dev.zeekr.invictus_android.os.storage

import android.content.Context


internal interface JniStorageEventListener {
    fun onUsbMassStorageConnectionChanged(connected: Boolean)
    fun onStorageStateChanged(path: String?, oldState: String, newState: String)
    fun onVolumeStateChanged(vol: VolumeInfo, oldState: Int, newState: Int)
    fun onVolumeRecordChanged(rec: VolumeRecord)
    fun onVolumeForgotten(fsUuid: String)
    fun onDiskScanned(disk: DiskInfo, volumeCount: Int)
    fun onDiskDestroyed(disk: DiskInfo)
}

internal class JniStorageEventListenerImpl(
    context: Context, val listener: JniStorageEventListener
) : StorageEventListener(context) {
    override fun onUsbMassStorageConnectionChanged(connected: Boolean) {
        listener.onUsbMassStorageConnectionChanged(connected)
    }

    override fun onStorageStateChanged(path: String?, oldState: String, newState: String) {
        listener.onStorageStateChanged(path, oldState, newState)
    }

    override fun onVolumeStateChanged(vol: VolumeInfo, oldState: Int, newState: Int) {
        listener.onVolumeStateChanged(vol, oldState, newState)
    }

    override fun onVolumeRecordChanged(rec: VolumeRecord) {
        listener.onVolumeRecordChanged(rec)
    }

    override fun onVolumeForgotten(fsUuid: String) {
        listener.onVolumeForgotten(fsUuid)
    }

    override fun onDiskScanned(disk: DiskInfo, volumeCount: Int) {
        listener.onDiskScanned(disk, volumeCount)
    }

    override fun onDiskDestroyed(disk: DiskInfo) {
        listener.onDiskDestroyed(disk)
    }
}