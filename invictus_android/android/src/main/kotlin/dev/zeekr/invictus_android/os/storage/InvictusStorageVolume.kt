package dev.zeekr.invictus_android.os.storage

import android.os.storage.StorageVolume

class InvictusStorageVolume(val obj: StorageVolume) {
    companion object {
        val clazz: Class<*> get() = StorageVolume::class.java
    }

    val id: String get() = clazz.getMethod("getId").invoke(this.obj) as String
    val fatVolumeId: Int get() = clazz.getMethod("getFatVolumeId").invoke(this.obj) as Int
    val userLabel: String get() = clazz.getMethod("getUserLabel").invoke(this.obj) as String
    val path: String get() = clazz.getMethod("getPath").invoke(this.obj) as String
    val internalPath: String get() = clazz.getMethod("getInternalPath").invoke(this.obj) as String
    val maxFileSize: Long get() = clazz.getMethod("getMaxFileSize").invoke(this.obj) as Long
    val isExternallyManaged: Boolean
        get() = clazz.getMethod("isExternallyManaged").invoke(this.obj) as Boolean
    val allowMassStorage: Boolean
        get() = clazz.getMethod("allowMassStorage").invoke(this.obj) as Boolean
    val normalizedUuid: String? get() = clazz.getMethod("getNormalizedUuid") as String?
}