package dev.zeekr.invictus_android.io

import dev.zeekr.invictus_android.system.OsCompat
import java.io.FileDescriptor
import java.io.SyncFailedException

object FileDescriptorCompat {
    @Throws(SyncFailedException::class)
    fun syncfs(thiz: FileDescriptor) {
        OsCompat.syncfs(thiz)
    }
}