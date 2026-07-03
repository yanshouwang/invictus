package dev.zeekr.invictus_android.io

import dev.zeekr.invictus_android.system.OsCompat
import java.io.FileDescriptor
import java.io.SyncFailedException

@Throws(SyncFailedException::class)
fun FileDescriptor.syncfs() {
    FileDescriptorCompat.syncfs(this)
}