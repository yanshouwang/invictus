package dev.zeekr.invictus_android.app

import android.app.ActivityManager
import android.os.LocaleList
import java.util.Locale

// https://cs.android.com/android/platform/superproject/main/+/main:frameworks/base/core/java/android/app/ActivityManager.java
class InvictusActivityManager(val obj: ActivityManager) {
    companion object {
        val clazz get() = ActivityManager::class.java
    }

    /**
     * Returns a list of supported locales by this system. It includes all locales that are
     * selectable by the user, potentially including locales that the framework does not have
     * translated resources for. To get locales that the framework has translated resources for, use
     * {@code Resources.getSystem().getAssets().getLocales()} instead.
     */
    val supportedLocales: Collection<Locale>
        get() {
            val locales = clazz.getMethod("getSupportedLocales").invoke(obj) as Collection<*>
            return locales.filterIsInstance<Locale>()
        }

    /**
     * Sets the current locales of the device. Calling app must have the permission
     * {@code android.permission.CHANGE_CONFIGURATION} and
     * {@code android.permission.WRITE_SETTINGS}.
     */
    fun setDeviceLocales(locales: LocaleList) {
        clazz.getMethod("setDeviceLocales", LocaleList::class.java).invoke(obj, locales)
    }
}