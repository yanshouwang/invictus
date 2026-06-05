package dev.zeekr.invictus_android.os.storage

import android.content.Context
import android.os.storage.StorageManager
import android.os.storage.StorageVolume
import java.io.File
import java.util.UUID

class InvictusStorageManager(val obj: StorageManager) {
    companion object {
        val clazz: Class<*> get() = StorageManager::class.java

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
}