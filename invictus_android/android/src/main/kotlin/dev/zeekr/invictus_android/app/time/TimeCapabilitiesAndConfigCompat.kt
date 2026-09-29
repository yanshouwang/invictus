package dev.zeekr.invictus_android.app.time

import android.os.Build

object TimeCapabilitiesAndConfigCompat {
    /**
     * Returns the user's time behaviour capabilities.
     */
    fun getCapabilities(thiz: TimeCapabilitiesAndConfig): TimeCapabilities {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            thiz.capabilities
        } else {
            val obj = TimeCapabilitiesAndConfig.clazz.getMethod("getTimeCapabilities")
                .invoke(thiz.obj) as Any
            TimeCapabilities(obj)
        }
    }

    /**
     * Returns the user's time behaviour configuration.
     */
    fun getConfiguration(thiz: TimeCapabilitiesAndConfig): TimeConfiguration {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            thiz.configuration
        } else {
            val obj = TimeCapabilitiesAndConfig.clazz.getMethod("getTimeConfiguration")
                .invoke(thiz.obj) as Any
            TimeConfiguration(obj)
        }
    }
}