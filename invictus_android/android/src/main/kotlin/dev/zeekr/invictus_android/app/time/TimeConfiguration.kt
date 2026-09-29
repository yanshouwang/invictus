package dev.zeekr.invictus_android.app.time

import dev.zeekr.invictus_android.InvictusObject

/**
 * User visible settings that control the behavior of the time detector / manual time entry.
 *
 * <p>When reading the configuration, values for all settings will be provided. In some cases, such
 * as when the device behavior relies on optional hardware / OEM configuration, or the value of
 * several settings, the device behavior may not be directly affected by the setting value.
 *
 * <p>Settings can be left absent when updating configuration via {@link
 * TimeManager#updateTimeConfiguration(TimeConfiguration)} and those settings will not be
 * changed. Not all configuration settings can be modified by all users: see {@link
 * TimeManager#getTimeCapabilitiesAndConfig()} and {@link TimeCapabilities} for details.
 */
class TimeConfiguration : InvictusObject {
    /**
     * A builder for {@link TimeConfiguration} objects.
     */
    class Builder : InvictusObject {
        companion object {
            internal val clazz: Class<*> get() = Class.forName("android.app.time.TimeConfiguration\$Builder")
        }

        override val obj: Any

        internal constructor(obj: Any) {
            this.obj = obj
        }

        /**
         * Creates a new Builder with no settings held.
         */
        constructor() {
            this.obj = clazz.getConstructor().newInstance()
        }

        constructor(toCopy: TimeConfiguration) {
            this.obj = clazz.getConstructor(clazz).newInstance(toCopy.obj)
        }

        /** Sets whether auto detection is enabled or not. */
        fun setAutoDetectionEnabled(enabled: Boolean): Builder {
            val obj = clazz.getMethod("setAutoDetectionEnabled", Boolean::class.java)
                .invoke(this.obj, enabled) as Any
            return Builder(obj)
        }

        /** Returns the {@link TimeConfiguration}. */
        fun build(): TimeConfiguration {
            val obj = clazz.getMethod("build").invoke(this.obj) as Any
            return TimeConfiguration(obj)
        }
    }

    companion object {
        internal val clazz: Class<*> get() = Class.forName("android.app.time.TimeConfiguration")
    }

    override val obj: Any

    internal constructor(obj: Any) {
        this.obj = obj
    }

    /**
     * Returns the value of the {@link #SETTING_AUTO_DETECTION_ENABLED} setting. This
     * controls whether a device will attempt to determine the time automatically using
     * contextual information if the device supports auto detection.
     *
     * <p>See {@link TimeCapabilities#getConfigureAutoDetectionEnabledCapability()} for how to
     * tell if the setting is meaningful for the current user at this time.
     *
     * @throws IllegalStateException if the setting is not present
     */
    val isAutoDetectionEnabled: Boolean
        get() = clazz.getMethod("isAutoDetectionEnabled").invoke(this.obj) as Boolean
}