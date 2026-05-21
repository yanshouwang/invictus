package dev.zeekr.invictus_android.app.time

/**
 * User visible settings that control the behavior of the time zone detector / manual time zone
 * entry.
 *
 * <p>When reading the configuration, values for all settings will be provided. In some cases, such
 * as when the device behavior relies on optional hardware / OEM configuration, or the value of
 * several settings, the device behavior may not be directly affected by the setting value.
 *
 * <p>Settings can be left absent when updating configuration via {@link
 * TimeManager#updateTimeZoneConfiguration(TimeZoneConfiguration)} and those settings will not be
 * changed. Not all configuration settings can be modified by all users: see {@link
 * TimeManager#getTimeZoneCapabilitiesAndConfig()} and {@link TimeZoneCapabilities} for details.
 *
 * @hide
 */
class TimeZoneConfiguration(val obj: Any) {
    /**
     * A builder for {@link TimeZoneConfiguration} objects.
     *
     * @hide
     */
    class Builder {
        companion object {
            val clazz: Class<*> get() = Class.forName("android.app.time.TimeZoneConfiguration\$Builder")
        }

        val obj: Any

        constructor(obj: Any) {
            this.obj = obj
        }

        constructor() {
            this.obj = clazz.getConstructor().newInstance()
        }

        constructor(toCopy: TimeZoneConfiguration) {
            this.obj = clazz.getConstructor(TimeZoneConfiguration.clazz).newInstance(toCopy.obj)
        }

        /**
         * Sets the state of the {@link #SETTING_AUTO_DETECTION_ENABLED} setting.
         */
        fun setAutoDetectionEnabled(enabled: Boolean): Builder {
            val obj = clazz.getMethod("setAutoDetectionEnabled", Boolean::class.java)
                .invoke(this.obj, enabled) as Any
            return Builder(obj)
        }

        /**
         * Sets the state of the {@link #SETTING_GEO_DETECTION_ENABLED} setting.
         */
        fun setGeoDetectionEnabled(enabled: Boolean): Builder {
            val obj = clazz.getMethod("setGeoDetectionEnabled", Boolean::class.java)
                .invoke(this.obj, enabled) as Any
            return Builder(obj)
        }

        /** Returns the {@link TimeZoneConfiguration}. */
        fun build(): TimeZoneConfiguration {
            val obj = clazz.getMethod("build").invoke(this.obj) as Any
            return TimeZoneConfiguration(obj)
        }
    }

    companion object {
        val clazz: Class<*> get() = Class.forName("android.app.time.TimeZoneConfiguration")
    }

    /**
     * Returns the value of the {@link #SETTING_AUTO_DETECTION_ENABLED} setting. This
     * controls whether a device will attempt to determine the time zone automatically using
     * contextual information if the device supports auto detection.
     *
     * <p>See {@link TimeZoneCapabilities#getConfigureAutoDetectionEnabledCapability()} for how to
     * tell if the setting is meaningful for the current user at this time.
     *
     * @throws IllegalStateException if the setting is not present
     */
    val isAutoDetectionEnabled: Boolean
        get() = clazz.getMethod("isAutoDetectionEnabled").invoke(this.obj) as Boolean

    /**
     * Returns the value of the {@link #SETTING_GEO_DETECTION_ENABLED} setting. This
     * controls whether the device can use geolocation to determine time zone. This value may only
     * be used by Android under some circumstances. For example, it is not used when
     * {@link #isGeoDetectionEnabled()} is {@code false}.
     *
     * <p>See {@link TimeZoneCapabilities#getConfigureGeoDetectionEnabledCapability()} for how to
     * tell if the setting is meaningful for the current user at this time.
     *
     * @throws IllegalStateException if the setting is not present
     */
    val isGeoDetectionEnabled: Boolean
        get() = clazz.getMethod("isGeoDetectionEnabled").invoke(this.obj) as Boolean

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