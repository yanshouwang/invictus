package dev.zeekr.invictus_android.os.storage

import dev.zeekr.invictus_android.InvictusObject

class VolumeInfo : InvictusObject {
    companion object {
        internal val clazz: Class<*> get() = Class.forName("android.os.storage.VolumeInfo")

        val ACTION_VOLUME_STATE_CHANGED: String
            get() = clazz.getField("ACTION_VOLUME_STATE_CHANGED").get(null) as String
        val EXTRA_VOLUME_ID: String
            get() = clazz.getField("EXTRA_VOLUME_ID").get(null) as String
        val EXTRA_VOLUME_STATE: String
            get() = clazz.getField("EXTRA_VOLUME_STATE").get(null) as String

        val ID_PRIVATE_INTERNAL: String
            get() = clazz.getField("ID_PRIVATE_INTERNAL").get(null) as String
        val ID_EMULATED_INTERNAL: String
            get() = clazz.getField("ID_EMULATED_INTERNAL").get(null) as String

        val TYPE_PUBLIC: Int
            get() = clazz.getField("TYPE_PUBLIC").get(null) as Int
        val TYPE_PRIVATE: Int
            get() = clazz.getField("TYPE_PRIVATE").get(null) as Int
        val TYPE_EMULATED: Int
            get() = clazz.getField("TYPE_EMULATED").get(null) as Int
        val TYPE_ASEC: Int
            get() = clazz.getField("TYPE_ASEC").get(null) as Int
        val TYPE_OBB: Int
            get() = clazz.getField("TYPE_OBB").get(null) as Int
        val TYPE_STUB: Int
            get() = clazz.getField("TYPE_STUB").get(null) as Int

        val STATE_UNMOUNTED: Int
            get() = clazz.getField("STATE_UNMOUNTED").get(null) as Int
        val STATE_CHECKING: Int
            get() = clazz.getField("STATE_CHECKING").get(null) as Int
        val STATE_MOUNTED: Int
            get() = clazz.getField("STATE_MOUNTED").get(null) as Int
        val STATE_MOUNTED_READ_ONLY: Int
            get() = clazz.getField("STATE_MOUNTED_READ_ONLY").get(null) as Int
        val STATE_FORMATTING: Int
            get() = clazz.getField("STATE_FORMATTING").get(null) as Int
        val STATE_EJECTING: Int
            get() = clazz.getField("STATE_EJECTING").get(null) as Int
        val STATE_UNMOUNTABLE: Int
            get() = clazz.getField("STATE_UNMOUNTABLE").get(null) as Int
        val STATE_REMOVED: Int
            get() = clazz.getField("STATE_REMOVED").get(null) as Int
        val STATE_BAD_REMOVAL: Int
            get() = clazz.getField("STATE_BAD_REMOVAL").get(null) as Int

        val MOUNT_FLAG_PRIMARY: Int
            get() = clazz.getField("MOUNT_FLAG_PRIMARY").get(null) as Int
        val MOUNT_FLAG_VISIBLE_FOR_READ: Int
            get() = clazz.getField("MOUNT_FLAG_VISIBLE_FOR_READ").get(null) as Int
        val MOUNT_FLAG_VISIBLE_FOR_WRITE: Int
            get() = clazz.getField("MOUNT_FLAG_VISIBLE_FOR_WRITE").get(null) as Int
    }

    override val obj: Any

    internal constructor(obj: Any) {
        this.obj = obj
    }

    val fsType: String? get() = clazz.getField("fsType").get(this.obj) as String?
    val fsLabel: String? get() = clazz.getField("fsLabel").get(this.obj) as String?
    val path: String? get() = clazz.getField("path").get(this.obj) as String?
    val internalPath: String? get() = clazz.getField("internalPath").get(this.obj) as String?
    val id: String get() = clazz.getMethod("getId").invoke(this.obj) as String
    val disk: DiskInfo?
        get() {
            val obj = clazz.getMethod("getDisk").invoke(this.obj)
            return if (obj == null) null
            else DiskInfo(obj)
        }
    val diskId: String? get() = clazz.getMethod("getDiskId").invoke(this.obj) as String?
    val type: Int get() = clazz.getMethod("getType").invoke(this.obj) as Int
    val state: Int get() = clazz.getMethod("getState").invoke(this.obj) as Int
    val stateDescription: Int
        get() = clazz.getMethod("getStateDescription").invoke(this.obj) as Int
    val fsUuid: String? get() = clazz.getMethod("getFsUuid").invoke(this.obj) as String?
    val normalizedFsUuid: String?
        get() = clazz.getMethod("getNormalizedFsUuid").invoke(this.obj) as String?
    val mountUserId: Int get() = clazz.getMethod("getMountUserId").invoke(this.obj) as Int
    val description: String?
        get() = clazz.getMethod("getDescription").invoke(this.obj) as String?
    val isMountedReadable: Boolean
        get() = clazz.getMethod("isMountedReadable").invoke(this.obj) as Boolean
    val isMountedWritable: Boolean
        get() = clazz.getMethod("isMountedWritable").invoke(this.obj) as Boolean
    val isPrimary: Boolean
        get() = clazz.getMethod("isPrimary").invoke(this.obj) as Boolean
    val isPrimaryPhysical: Boolean
        get() = clazz.getMethod("isPrimaryPhysical").invoke(this.obj) as Boolean
    val isVisible: Boolean
        get() = clazz.getMethod("isVisible").invoke(this.obj) as Boolean
}