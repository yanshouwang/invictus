//
// Created by 闫守旺 on 2026/7/2.
//
#include <jni.h>
#include <unistd.h>
#include <sys/syscall.h>

#include "util.h"

extern "C"
JNIEXPORT void JNICALL
Java_dev_zeekr_invictus_1android_system_OsCompat_syncfs(JNIEnv *env, jobject thiz, jobject fd) {
    const jint jfd = JNI_GetFd(env, fd);
    const jlong res = syscall(__NR_syncfs, jfd);
    if (res != 0) JNI_ThrowByName(env, "java/io/SyncFailedException", "sync failed");
}
