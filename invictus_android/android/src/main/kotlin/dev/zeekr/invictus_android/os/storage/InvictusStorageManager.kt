package dev.zeekr.invictus_android.os.storage

import android.content.Context
import android.os.storage.StorageEventListener
import android.os.storage.StorageManager
import android.os.storage.StorageVolume
import java.io.File
import java.io.FileDescriptor
import java.util.UUID

class InvictusStorageManager(val obj: StorageManager) {
    companion object {
        val clazz: Class<*> get() = StorageManager::class.java

        val ENCRYPTION_STATE_NONE: Int
            get() = clazz.getField("ENCRYPTION_STATE_NONE").get(null) as Int
        val CRYPT_TYPE_PASSWORD: Int
            get() = clazz.getField("CRYPT_TYPE_PASSWORD").get(null) as Int
        val CRYPT_TYPE_DEFAULT: Int
            get() = clazz.getField("CRYPT_TYPE_DEFAULT").get(null) as Int
        val MOUNT_MODE_EXTERNAL_NONE: Int
            get() = clazz.getField("MOUNT_MODE_EXTERNAL_NONE").get(null) as Int
        val MOUNT_MODE_EXTERNAL_DEFAULT: Int
            get() = clazz.getField("MOUNT_MODE_EXTERNAL_DEFAULT").get(null) as Int
        val MOUNT_MODE_EXTERNAL_INSTALLER: Int
            get() = clazz.getField("MOUNT_MODE_EXTERNAL_INSTALLER").get(null) as Int
        val MOUNT_MODE_EXTERNAL_PASS_THROUGH: Int
            get() = clazz.getField("MOUNT_MODE_EXTERNAL_PASS_THROUGH").get(null) as Int
        val MOUNT_MODE_EXTERNAL_ANDROID_WRITABLE: Int
            get() = clazz.getField("MOUNT_MODE_EXTERNAL_ANDROID_WRITABLE").get(null) as Int
        val FLAG_ALLOCATE_AGGRESSIVE: Int
            get() = clazz.getField("FLAG_ALLOCATE_AGGRESSIVE").get(null) as Int
        val QUOTA_TYPE_MEDIA_NONE: Int
            get() = clazz.getField("QUOTA_TYPE_MEDIA_NONE").get(null) as Int
        val QUOTA_TYPE_MEDIA_IMAGE: Int
            get() = clazz.getField("QUOTA_TYPE_MEDIA_IMAGE").get(null) as Int
        val QUOTA_TYPE_MEDIA_AUDIO: Int
            get() = clazz.getField("QUOTA_TYPE_MEDIA_AUDIO").get(null) as Int
        val QUOTA_TYPE_MEDIA_VIDEO: Int
            get() = clazz.getField("QUOTA_TYPE_MEDIA_VIDEO").get(null) as Int
        val APP_IO_BLOCKED_REASON_UNKNOWN: Int
            get() = clazz.getField("APP_IO_BLOCKED_REASON_UNKNOWN").get(null) as Int
        val APP_IO_BLOCKED_REASON_TRANSCODING: Int
            get() = clazz.getField("APP_IO_BLOCKED_REASON_TRANSCODING").get(null) as Int

        val isEncrypted: Boolean get() = clazz.getMethod("isEncrypted").invoke(null) as Boolean
        val isFileEncryptedNativeOnly: Boolean
            get() = clazz.getMethod("isFileEncryptedNativeOnly").invoke(null) as Boolean
        val isFileEncryptedEmulatedOnly: Boolean
            get() = clazz.getMethod("isFileEncryptedEmulatedOnly").invoke(null) as Boolean
        val isFileEncryptedNativeOrEmulated: Boolean
            get() = clazz.getMethod("isFileEncryptedNativeOrEmulated").invoke(null) as Boolean
        val hasAdoptable: Boolean
            get() = clazz.getMethod("hasAdoptable").invoke(null) as Boolean
        val hasIsolatedStorage: Boolean
            get() = clazz.getMethod("hasIsolatedStorage").invoke(null) as Boolean

        fun getStorageVolume(file: File, userId: Int): StorageVolume? {
            return clazz.getMethod("getStorageVolume", File::class.java, Int::class.java)
                .invoke(null, file, userId) as StorageVolume?
        }

        fun getPrimaryStoragePathAndSize(): Pair<String, Long> {
            val pathAndSize = clazz.getMethod("getPrimaryStoragePathAndSize")
                .invoke(null) as android.util.Pair<*, *>
            return Pair(pathAndSize.first as String, pathAndSize.second as Long)
        }

        fun getVolumeList(userId: Int, flags: Int): Array<StorageVolume> {
            val volumeList = clazz.getMethod("getVolumeList", Int::class.java, Int::class.java)
                .invoke(null, userId, flags) as Array<*>
            return volumeList.filterIsInstance<StorageVolume>().toTypedArray()
        }

        fun getPrimaryVolume(volumes: Array<StorageVolume>): StorageVolume {
            return clazz.getMethod("getPrimaryVolume", Array<StorageVolume>::class.java)
                .invoke(null, volumes) as StorageVolume
        }

        fun isUserKeyUnlocked(userId: Int): Boolean {
            return clazz.getMethod("isUserKeyUnlocked", Int::class.java)
                .invoke(null, userId) as Boolean
        }

        @Deprecated("")
        fun maybeTranslateEmulatedPathToInternal(path: File): File {
            return clazz.getMethod("maybeTranslateEmulatedPathToInternal", File::class.java)
                .invoke(null, path) as File
        }

        @Deprecated("")
        fun from(context: Context): StorageManager {
            return clazz.getMethod("from", Context::class.java)
                .invoke(null, context) as StorageManager
        }

        fun checkPermissionAndAppOp(
            context: Context,
            enforce: Boolean,
            pid: Int,
            uid: Int,
            packageName: String,
            featureId: String,
            permission: String,
            op: Int
        ): Boolean {
            return clazz.getMethod(
                "checkPermissionAndAppOp",
                Context::class.java,
                Boolean::class.java,
                Int::class.java,
                Int::class.java,
                String::class.java,
                String::class.java,
                String::class.java,
                Int::class.java
            ).invoke(
                null, context, enforce, pid, uid, packageName, featureId, permission, op
            ) as Boolean
        }

        fun checkPermissionAndCheckOp(
            context: Context,
            enforce: Boolean,
            pid: Int,
            uid: Int,
            packageName: String,
            permission: String,
            op: Int
        ): Boolean {
            return clazz.getMethod(
                "checkPermissionAndCheckOp",
                Context::class.java,
                Boolean::class.java,
                Int::class.java,
                Int::class.java,
                String::class.java,
                String::class.java,
                Int::class.java
            ).invoke(
                null, context, enforce, pid, uid, packageName, permission, op
            ) as Boolean
        }

        fun setCacheBehavior(path: File, name: String, enabled: Boolean) {
            clazz.getMethod(
                "setCacheBehavior", File::class.java, String::class.java, Boolean::class.java
            ).invoke(null, path, name, enabled)
        }

        fun isCacheBehavior(path: File, name: String): Boolean {
            return clazz.getMethod("isCacheBehavior", File::class.java, String::class.java)
                .invoke(null, path, name) as Boolean
        }

        fun isFatVolumeIdentifier(uuid: String): Boolean {
            return clazz.getMethod("isFatVolumeIdentifier", String::class.java)
                .invoke(null, uuid) as Boolean
        }

        fun convert(uuid: String): UUID {
            return clazz.getMethod("convert", String::class.java).invoke(null, uuid) as UUID
        }
    }

    // region Instance methods (require StorageManager instance)

    fun registerListener(listener: StorageEventListener) {
        clazz.getMethod("registerListener", StorageEventListener::class.java)
            .invoke(obj, listener)
    }

    fun unregisterListener(listener: StorageEventListener) {
        clazz.getMethod("unregisterListener", StorageEventListener::class.java)
            .invoke(obj, listener)
    }

    @Deprecated("")
    fun enableUsbMassStorage() {
        clazz.getMethod("enableUsbMassStorage").invoke(obj)
    }

    @Deprecated("")
    fun disableUsbMassStorage() {
        clazz.getMethod("disableUsbMassStorage").invoke(obj)
    }

    @Deprecated("")
    fun isUsbMassStorageConnected(): Boolean {
        return clazz.getMethod("isUsbMassStorageConnected").invoke(obj) as Boolean
    }

    @Deprecated("")
    fun isUsbMassStorageEnabled(): Boolean {
        return clazz.getMethod("isUsbMassStorageEnabled").invoke(obj) as Boolean
    }

    fun unmount(volId: String) {
        clazz.getMethod("unmount", String::class.java).invoke(obj, volId)
    }

    fun format(volId: String) {
        clazz.getMethod("format", String::class.java).invoke(obj, volId)
    }

    fun partitionPublic(diskId: String) {
        clazz.getMethod("partitionPublic", String::class.java).invoke(obj, diskId)
    }

    fun getStorageBytesUntilLow(path: File): Long {
        return clazz.getMethod("getStorageBytesUntilLow", File::class.java)
            .invoke(obj, path) as Long
    }

    fun getStorageLowBytes(path: File): Long {
        return clazz.getMethod("getStorageLowBytes", File::class.java)
            .invoke(obj, path) as Long
    }

    fun getStorageFullBytes(path: File): Long {
        return clazz.getMethod("getStorageFullBytes", File::class.java)
            .invoke(obj, path) as Long
    }

    fun computeStorageCacheBytes(path: File): Long {
        return clazz.getMethod("computeStorageCacheBytes", File::class.java)
            .invoke(obj, path) as Long
    }

    fun getAllocatableBytes(storageUuid: UUID, flags: Int): Long {
        return clazz.getMethod("getAllocatableBytes", UUID::class.java, Int::class.java)
            .invoke(obj, storageUuid, flags) as Long
    }

    fun allocateBytes(storageUuid: UUID, bytes: Long, flags: Int) {
        clazz.getMethod("allocateBytes", UUID::class.java, Long::class.java, Int::class.java)
            .invoke(obj, storageUuid, bytes, flags)
    }

    fun allocateBytes(fd: FileDescriptor, bytes: Long, flags: Int) {
        clazz.getMethod(
            "allocateBytes",
            FileDescriptor::class.java,
            Long::class.java,
            Int::class.java
        ).invoke(obj, fd, bytes, flags)
    }

    fun getExternalStorageMountMode(uid: Int, packageName: String): Int {
        return clazz.getMethod(
            "getExternalStorageMountMode",
            Int::class.java,
            String::class.java
        ).invoke(obj, uid, packageName) as Int
    }

    fun updateExternalStorageFileQuotaType(path: File, quotaType: Int) {
        clazz.getMethod(
            "updateExternalStorageFileQuotaType",
            File::class.java,
            Int::class.java
        ).invoke(obj, path, quotaType)
    }

    fun notifyAppIoBlocked(volumeUuid: UUID, uid: Int, tid: Int, reason: Int) {
        clazz.getMethod(
            "notifyAppIoBlocked",
            UUID::class.java,
            Int::class.java,
            Int::class.java,
            Int::class.java
        ).invoke(obj, volumeUuid, uid, tid, reason)
    }

    fun notifyAppIoResumed(volumeUuid: UUID, uid: Int, tid: Int, reason: Int) {
        clazz.getMethod(
            "notifyAppIoResumed",
            UUID::class.java,
            Int::class.java,
            Int::class.java,
            Int::class.java
        ).invoke(obj, volumeUuid, uid, tid, reason)
    }

    fun setCloudMediaProvider(authority: String?) {
        clazz.getMethod("setCloudMediaProvider", String::class.java)
            .invoke(obj, authority)
    }

    fun getCloudMediaProvider(): String? {
        return clazz.getMethod("getCloudMediaProvider").invoke(obj) as String?
    }

    // endregion
}
