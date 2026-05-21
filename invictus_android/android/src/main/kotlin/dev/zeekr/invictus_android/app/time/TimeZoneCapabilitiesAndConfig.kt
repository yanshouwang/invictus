package dev.zeekr.invictus_android.app.time

/**
 * An object containing a user's {@link TimeZoneCapabilities} and {@link TimeZoneConfiguration}.
 *
 * @hide
 */
class TimeZoneCapabilitiesAndConfig(val obj: Any) {
    companion object {
        val clazz: Class<*> get() = Class.forName("android.app.time.TimeZoneCapabilitiesAndConfig")
    }

    /**
     * Returns the user's time zone behavior capabilities.
     */
    val capabilities: TimeZoneCapabilities
        get() {
            val obj = clazz.getMethod("getCapabilities").invoke(this.obj) as Any
            return TimeZoneCapabilities(obj)
        }

    /**
     * Returns the user's time zone behavior configuration.
     */
    val configuration: TimeZoneConfiguration
        get() {
            val obj = clazz.getMethod("getConfiguration").invoke(this.obj) as Any
            return TimeZoneConfiguration(obj)
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