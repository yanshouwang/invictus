package dev.zeekr.invictus_android.app.time

import android.os.UserHandle

/**
 * Time zone-related capabilities for a user.
 *
 * <p>For configuration settings capabilities, the associated settings value can be found via
 * {@link TimeManager#getTimeZoneCapabilitiesAndConfig()} and may be changed using {@link
 * TimeManager#updateTimeZoneConfiguration(TimeZoneConfiguration)} (if the user's capabilities
 * allow).
 *
 * @hide
 */
class TimeZoneCapabilities(val obj: Any) {
    /**
     * A builder of {@link TimeZoneCapabilities} objects.
     *
     * @hide
     */
    class Builder {
        companion object {
            val clazz: Class<*> get() = Class.forName("android.app.time.TimeZoneCapabilities\$Builder")
        }

        val obj: Any

        constructor(obj: Any) {
            this.obj = obj
        }

        constructor(userHandle: UserHandle) {
            this.obj = clazz.getConstructor(UserHandle::class.java).newInstance()
        }

        constructor(capabilitiesToCopy: TimeZoneCapabilities) {
            this.obj =
                clazz.getConstructor(TimeZoneCapabilities.clazz).newInstance(capabilitiesToCopy.obj)
        }

        /** Sets the value for the "configure automatic time zone detection enabled" capability. */
        fun setConfigureAutoDetectionEnabledCapability(value: Int): Builder {
            val obj = clazz.getMethod(
                "setConfigureAutoDetectionEnabledCapability", Int::class.java
            ) as Any
            return Builder(obj)
        }

        /** Sets the values for "use location". See {@link #isUseLocationEnabled()}. */
        fun setUseLocationEnabled(useLocation: Boolean): Builder {
            val obj = clazz.getMethod("setUseLocationEnabled", Boolean::class.java)
                .invoke(this.obj, useLocation) as Any
            return Builder(obj)
        }

        /**
         * Sets the value for the "configure geolocation time zone detection enabled" capability.
         */
        fun setConfigureGeoDetectionEnabledCapability(value: Int): Builder {
            val obj = clazz.getMethod(
                "setConfigureGeoDetectionEnabledCapability", Int::class.java
            ).invoke(this.obj, value) as Any
            return Builder(obj)
        }

        /** Sets the value for the "set manual time zone" capability. */
        fun setSetManualTimeZoneCapability(value: Int): Builder {
            val obj = clazz.getMethod("setSetManualTimeZoneCapability", Int::class.java)
                .invoke(this.obj, value) as Any
            return Builder(obj)
        }

        /** Returns the {@link TimeZoneCapabilities}. */
        fun build(): TimeZoneCapabilities {
            val obj = clazz.getMethod("build").invoke(this.obj) as Any
            return TimeZoneCapabilities(obj)
        }
    }

    companion object {
        val clazz: Class<*> get() = Class.forName("android.app.time.TimeZoneCapabilities")
    }

    /**
     * Returns the capability state associated with the user's ability to modify the automatic time
     * zone detection setting. The setting can be updated via {@link
     * TimeManager#updateTimeZoneConfiguration(TimeZoneConfiguration)}.
     */
    val configureAutoDetectionEnabledCapability: Int
        get() = clazz.getMethod("getConfigureAutoDetectionEnabledCapability")
            .invoke(this.obj) as Int

    /**
     * Returns {@code true} if the device's location can be used by the Android system, and
     * therefore the platform components running on behalf of the user. At the time of writing, the
     * user can change this via the "Use location" setting on the Location settings screen.
     *
     * Not part of the SDK API because it is intended for use by SettingsUI, which can display
     * text about needing it to be on for location-based time zone detection.
     * @hide
     *
     */
    val isUseLocationEnabled: Boolean
        get() = clazz.getMethod("isUseLocationEnabled").invoke(this.obj) as Boolean

    /**
     * Returns the capability state associated with the user's ability to modify the geolocation
     * detection setting. The setting can be updated via {@link
     * TimeManager#updateTimeZoneConfiguration(TimeZoneConfiguration)}.
     */
    val configureGeoDetectionEnabledCapability: Int
        get() = clazz.getMethod("getConfigureGeoDetectionEnabledCapability").invoke(this.obj) as Int

    /**
     * Returns the capability state associated with the user's ability to manually set the time zone
     * on a device.
     *
     * <p>The time zone will be ignored in all cases unless the value is {@link
     * Capabilities#CAPABILITY_POSSESSED}. See also
     * {@link TimeZoneConfiguration#isAutoDetectionEnabled()}.
     */
    val setManualTimeZoneCapability: Int
        get() = clazz.getMethod("getSetManualTimeZoneCapability").invoke(this.obj) as Int


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