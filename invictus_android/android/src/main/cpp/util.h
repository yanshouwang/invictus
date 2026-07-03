//
// Created by 闫守旺 on 2026/7/2.
//

#ifndef ANDROID_UTIL_H
#define ANDROID_UTIL_H

#include <jni.h>

#if _ANDROID_API__ >= 31
#include <android/file_descriptor_jni.h>
#else
#include <dlfcn.h>

typedef int (*AFD_GetFd)(JNIEnv *, jobject);

static AFD_GetFd sGetFd;
#endif

static inline int JNI_GetFd(JNIEnv *env, jobject fileDescriptor) {
    if (fileDescriptor == nullptr)return -1;
#if _ANDROID_API__ >= 31
    return AFileDescriptor_getFd(env, fileDescriptor);
# else
    int deviceApiLevel = android_get_device_api_level();
    if (deviceApiLevel >= 31) {
        if (sGetFd == nullptr) {
            void *handle = dlopen("libandroid.so", RTLD_LAZY);
            void *sym = dlsym(handle, "AFileDescriptor_getFd");
            sGetFd = reinterpret_cast<AFD_GetFd>(sym);
        }
        return sGetFd(env, fileDescriptor);
    } else {
        jclass clazz = env->FindClass("java/io/FileDescriptor");
        jfieldID fdID = env->GetFieldID(clazz, "descriptor", "I");
        env->DeleteLocalRef(clazz);
        return env->GetIntField(fileDescriptor, fdID);
    }
# endif
}

static inline void JNI_ThrowByName(JNIEnv *env, const char *name, const char *message) {
    jclass clazz = env->FindClass(name);
    if (clazz != nullptr) {
        env->ThrowNew(clazz, message);
    }
    env->DeleteLocalRef(clazz);
}
#endif //ANDROID_UTIL_H
