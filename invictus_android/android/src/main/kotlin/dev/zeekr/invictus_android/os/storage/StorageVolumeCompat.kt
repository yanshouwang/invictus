package dev.zeekr.invictus_android.os.storage

import android.os.storage.StorageVolume

object StorageVolumeCompat {
    fun getId(thiz: StorageVolume): String {
        return StorageVolume::class.java.getMethod("getId").invoke(thiz) as String
    }

    fun getFatVolumeId(thiz: StorageVolume): Int {
        return StorageVolume::class.java.getMethod("getFatVolumeId").invoke(thiz) as Int
    }

    fun getUserLabel(thiz: StorageVolume): String {
        return StorageVolume::class.java.getMethod("getUserLabel").invoke(thiz) as String
    }

    fun getPath(thiz: StorageVolume): String {
        return StorageVolume::class.java.getMethod("getPath").invoke(thiz) as String
    }

    fun getInternalPath(thiz: StorageVolume): String {
        return StorageVolume::class.java.getMethod("getInternalPath").invoke(thiz) as String
    }

    fun getMaxFileSize(thiz: StorageVolume): Long {
        return StorageVolume::class.java.getMethod("getMaxFileSize").invoke(thiz) as Long
    }

    fun getNormalizedUuid(thiz: StorageVolume): String? {
        return StorageVolume::class.java.getMethod("getNormalizedUuid").invoke(thiz) as String?
    }

    fun isExternallyManaged(thiz: StorageVolume): Boolean {
        return StorageVolume::class.java.getMethod("isExternallyManaged").invoke(thiz) as Boolean
    }

    fun allowMassStorage(thiz: StorageVolume): Boolean {
        return StorageVolume::class.java.getMethod("allowMassStorage").invoke(thiz) as Boolean
    }
}
