package dev.zeekr.invictus_android.app.time

import android.os.UserHandle
import dev.zeekr.invictus_android.InvictusObject

/**
 * Time-relate capabilities for a user.
 *
 * <p>For configuration settings capabilities, the associated settings value can be found via
 * {@link TimeManager#getTimeCapabilitiesAndConfig()} and may be changed using {@link
 * TimeManager#updateTimeConfiguration(TimeConfiguration)} (if the user's capabilities
 * allow).
 */
class TimeCapabilities : InvictusObject {
    /**
     * A builder of {@link TimeCapabilities} objects.
     */
    class Builder : InvictusObject {
        companion object {
            internal val clazz: Class<*> get() = Class.forName("android.app.time.TimeCapabilities\$Builder")
        }

        override val obj: Any

        internal constructor(obj: Any) {
            this.obj = obj
        }

        constructor(userHandle: UserHandle) {
            this.obj = clazz.getConstructor(UserHandle::class.java).newInstance(userHandle)
        }

        constructor(timeCapabilities: TimeCapabilities) {
            this.obj = clazz.getConstructor(clazz).newInstance(timeCapabilities.obj)
        }

        /** Sets the value for the "configure automatic time detection" capability. */
        fun setConfigureAutoDetectionEnabledCapability(value: Int): Builder {
            val obj = clazz.getMethod("setConfigureAutoDetectionEnabledCapability", Int::class.java)
                .invoke(this.obj, value) as Any
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
        internal val clazz: Class<*> get() = Class.forName("android.app.time.TimeCapabilities")
    }

    override val obj: Any

    internal constructor(obj: Any) {
        this.obj = obj
    }

    val configureAutoDetectionEnabledCapability: Int
        get() = clazz.getMethod("getConfigureAutoDetectionEnabledCapability")
            .invoke(this.obj) as Int

    val setManualTimeCapability: Int
        get() = clazz.getMethod("getSetManualTimeCapability").invoke(this.obj) as Int
}