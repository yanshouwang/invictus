package dev.zeekr.invictus_android.app

import android.app.ActivityManager
import android.os.LocaleList
import java.util.Locale

object ActivityManagerCompat {
    /**
     * Returns a list of supported locales by this system. It includes all locales that are
     * selectable by the user, potentially including locales that the framework does not have
     * translated resources for. To get locales that the framework has translated resources for, use
     * {@code Resources.getSystem().getAssets().getLocales()} instead.
     */
    fun getSupportedLocales(thiz: ActivityManager): Collection<Locale> {
        val locales = ActivityManager::class.java.getMethod("getSupportedLocales")
            .invoke(thiz) as Collection<*>
        return locales.filterIsInstance<Locale>()
    }

    /**
     * Sets the current locales of the device. Calling app must have the permission
     * {@code android.permission.CHANGE_CONFIGURATION} and
     * {@code android.permission.WRITE_SETTINGS}.
     */
    fun setDeviceLocales(thiz: ActivityManager, locales: LocaleList) {
        ActivityManager::class.java.getMethod("setDeviceLocales", LocaleList::class.java)
            .invoke(thiz, locales)
    }
}