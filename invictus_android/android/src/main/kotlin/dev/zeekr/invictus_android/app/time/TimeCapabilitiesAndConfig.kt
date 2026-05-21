package dev.zeekr.invictus_android.app.time

import android.os.Build

/**
 * A pair containing a user's {@link TimeCapabilities} and {@link TimeConfiguration}.
 *
 * @hide
 */
class TimeCapabilitiesAndConfig(val obj: Any) {
    companion object {
        val clazz: Class<*> get() = Class.forName("android.app.time.TimeCapabilitiesAndConfig")
    }

    /**
     * Returns the user's time behaviour capabilities.
     */
    val capabilities: TimeCapabilities
        get() {
            val methodName = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
                "getCapabilities"
            } else {
                "getTimeCapabilities"
            }
            val obj = clazz.getMethod(methodName).invoke(this.obj) as Any
            return TimeCapabilities(obj)
        }

    /**
     * Returns the user's time behaviour configuration.
     */
    val configuration: TimeConfiguration
        get() {
            val methodName = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
                "getConfiguration"
            } else {
                "getTimeConfiguration"
            }
            val obj = clazz.getMethod(methodName).invoke(this.obj) as Any
            return TimeConfiguration(obj)
        }

    override fun equals(other: Any?): Boolean {
        return clazz.getMethod("equals", Any::class.java).invoke(this.obj, other) as Boolean
    }

    override fun hashCode(): Int {
        return clazz.getMethod("hashCode").invoke(this.obj) as Int
    }

    override fun toString(): String {
        return clazz.getMethod("toString").invoke(this.obj) as String
    }
}