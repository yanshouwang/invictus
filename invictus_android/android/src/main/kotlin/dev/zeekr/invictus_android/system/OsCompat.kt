package dev.zeekr.invictus_android.system

import java.io.FileDescriptor
import java.io.SyncFailedException

object OsCompat {
    init {
        System.loadLibrary("invictus_android")
    }

    @Throws(SyncFailedException::class)
    external fun syncfs(fd: FileDescriptor)
}