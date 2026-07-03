package dev.zeekr.invictus_android.os.storage

import android.content.Context
import android.os.storage.StorageVolume

internal class JniStorageManagerCompat {
    internal interface JniStorageVolumeCallbackCompat {
        fun onStateChanged(volume: StorageVolume)
    }

    internal class JniStorageVolumeCallbackCompatImpl(
        context: Context, val callback: JniStorageVolumeCallbackCompat
    ) : StorageManagerCompat.StorageVolumeCallbackCompat(context) {
        override fun onStateChanged(volume: StorageVolume) {
            callback.onStateChanged(volume)
        }
    }
}