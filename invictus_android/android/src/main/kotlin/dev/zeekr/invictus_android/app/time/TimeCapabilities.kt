package dev.zeekr.invictus_android.app.time

import android.os.UserHandle

/**
 * Time-relate capabilities for a user.
 *
 * <p>For configuration settings capabilities, the associated settings value can be found via
 * {@link TimeManager#getTimeCapabilitiesAndConfig()} and may be changed using {@link
 * TimeManager#updateTimeConfiguration(TimeConfiguration)} (if the user's capabilities
 * allow).
 *
 * @hide
 */
class TimeCapabilities(val obj: Any) {
    /**
     * A builder of {@link TimeCapabilities} objects.
     *
     * @hide
     */
    class Builder {
        companion object {
            val clazz: Class<*> get() = Class.forName("android.app.time.TimeCapabilities\$Builder")
        }

        val obj: Any

        constructor(obj: Any) {
            this.obj = obj
        }

        constructor(userHandle: UserHandle) {
            this.obj = clazz.getConstructor(UserHandle::class.java).newInstance(userHandle)
        }

        constructor(timeCapabilities: TimeCapabilities) {
            this.obj =
                clazz.getConstructor(TimeCapabilities.clazz).newInstance(timeCapabilities.obj)
        }

        /** Sets the value for the "configure automatic time detection" capability. */
        fun setConfigureAutoDetectionEnabledCapability(value: Int): Builder {
            val obj = clazz.getMethod(
                "setConfigureAutoDetectionEnabledCapability", Int::class.java
            ).invoke(this.obj, value) as Any
            return Builder(obj)
        }

        /** Sets the value for the "set manual time" capability. */
        fun setSetManualTimeCapability(value: Int): Builder {
            val obj = clazz.getMethod("setSetManualTimeZoneCapability", Int::class.java)
                .invoke(this.obj, value) as Any
            return Builder(obj)
        }

        /** Returns the {@link TimeCapabilities}. */
        fun build(): TimeCapabilities {
            val obj = clazz.getMethod("build").invoke(this.obj) as Any
            return TimeCapabilities(obj)
        }
    }

    companion object {
        val clazz: Class<*> get() = Class.forName("android.app.time.TimeCapabilities")
    }

    val configureAutoDetectionEnabledCapability: Int
        get() = clazz.getMethod("getConfigureAutoDetectionEnabledCapability")
            .invoke(this.obj) as Int

    val setManualTimeCapability: Int
        get() = clazz.getMethod("getSetManualTimeCapability").invoke(this.obj) as Int

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