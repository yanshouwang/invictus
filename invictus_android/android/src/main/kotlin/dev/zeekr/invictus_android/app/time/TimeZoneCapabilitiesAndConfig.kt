package dev.zeekr.invictus_android.app.time

import dev.zeekr.invictus_android.InvictusObject

/**
 * An object containing a user's {@link TimeZoneCapabilities} and {@link TimeZoneConfiguration}.
 */
class TimeZoneCapabilitiesAndConfig : InvictusObject {
    companion object {
        internal val clazz: Class<*> get() = Class.forName("android.app.time.TimeZoneCapabilitiesAndConfig")
    }

    override val obj: Any

    internal constructor(obj: Any) {
        this.obj = obj
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
}