package dev.zeekr.invictus_android.app.time

import android.content.Context
import androidx.core.content.ContextCompat
import java.lang.reflect.Proxy
import java.util.concurrent.Executor

/**
 * The interface through which system components can interact with time and time zone services.
 *
 * @hide
 */
class TimeManager(context: Context) {
    /**
     * An interface that can be used to listen for changes to the time zone detector behavior.
     */
    abstract class TimeZoneDetectorListener {
        companion object {
            val clazz: Class<*> get() = Class.forName("android.app.time.TimeManager\$TimeZoneDetectorListener")
        }

        val obj: Any

        init {
            this.obj = Proxy.newProxyInstance(
                clazz.classLoader, arrayOf(clazz)
            ) { _, _, _ -> onChange() }
        }

        abstract fun onChange()
    }

    companion object {
        val clazz: Class<*> get() = Class.forName("android.app.time.TimeManager")
    }

    val obj: Any = ContextCompat.getSystemService(context, clazz) as Any

    /**
     * Returns the calling user's time zone capabilities and configuration.
     */
    val timeZoneCapabilitiesAndConfig: TimeZoneCapabilitiesAndConfig
        get() {
            val obj = clazz.getMethod("getTimeZoneCapabilitiesAndConfig").invoke(this.obj) as Any
            return TimeZoneCapabilitiesAndConfig(obj)
        }

    /**
     * Returns the calling user's time capabilities and configuration.
     */
    val timeCapabilitiesAndConfig: TimeCapabilitiesAndConfig
        get() {
            val obj = clazz.getMethod("getTimeCapabilitiesAndConfig").invoke(this.obj) as Any
            return TimeCapabilitiesAndConfig(obj)
        }

    /**
     * Returns a snapshot of the device's current system clock time state. See also {@link
     * #confirmTime(UnixEpochTime)} for how this information can be used.
     */
    val timeState: TimeState
        get() {
            val obj = clazz.getMethod("getTimeState").invoke(this.obj) as Any
            return TimeState(obj)
        }

    /**
     * Returns a snapshot of the device's current time zone state. See also {@link
     * #confirmTimeZone(String)} and {@link #setManualTimeZone(String)} for how this information may
     * be used.
     */
    val timeZoneState: TimeZoneState
        get() {
            val obj = clazz.getMethod("getTimeZoneState").invoke(this.obj) as Any
            return TimeZoneState(obj)
        }

    /**
     * Modifies the time detection configuration.
     *
     * <p>The ability to modify configuration settings can be subject to restrictions. For
     * example, they may be determined by device hardware, general policy (i.e. only the primary
     * user can set them), or by a managed device policy. Use {@link
     * #getTimeCapabilitiesAndConfig()} to obtain information at runtime about the user's
     * capabilities.
     *
     * <p>Attempts to modify configuration settings with capabilities that are {@link
     * Capabilities#CAPABILITY_NOT_SUPPORTED} or {@link
     * Capabilities#CAPABILITY_NOT_ALLOWED} will have no effect and a {@code false}
     * will be returned. Modifying configuration settings with capabilities that are {@link
     * Capabilities#CAPABILITY_NOT_APPLICABLE} or {@link
     * Capabilities#CAPABILITY_POSSESSED} will succeed. See {@link
     * TimeZoneCapabilities} for further details.
     *
     * <p>If the supplied configuration only has some values set, then only the specified settings
     * will be updated (where the user's capabilities allow) and other settings will be left
     * unchanged.
     *
     * @return {@code true} if all the configuration settings specified have been set to the
     *   new values, {@code false} if none have
     */
    fun updateTimeConfiguration(configuration: TimeConfiguration): Boolean {
        return clazz.getMethod("updateTimeConfiguration", TimeConfiguration.clazz)
            .invoke(this.obj, configuration.obj) as Boolean
    }

    /**
     * Modifies the time zone detection configuration.
     *
     * <p>Configuration settings vary in scope: some may be global (affect all users), others may be
     * specific to the current user.
     *
     * <p>The ability to modify configuration settings can be subject to restrictions. For
     * example, they may be determined by device hardware, general policy (i.e. only the primary
     * user can set them), or by a managed device policy. Use {@link
     * #getTimeZoneCapabilitiesAndConfig()} to obtain information at runtime about the user's
     * capabilities.
     *
     * <p>Attempts to modify configuration settings with capabilities that are {@link
     * Capabilities#CAPABILITY_NOT_SUPPORTED} or {@link
     * Capabilities#CAPABILITY_NOT_ALLOWED} will have no effect and a {@code false}
     * will be returned. Modifying configuration settings with capabilities that are {@link
     * Capabilities#CAPABILITY_NOT_APPLICABLE} or {@link
     * Capabilities#CAPABILITY_POSSESSED} will succeed. See {@link
     * TimeZoneCapabilities} for further details.
     *
     * <p>If the supplied configuration only has some values set, then only the specified settings
     * will be updated (where the user's capabilities allow) and other settings will be left
     * unchanged.
     *
     * @return {@code true} if all the configuration settings specified have been set to the
     *   new values, {@code false} if none have
     */
    fun updateTimeZoneConfiguration(configuration: TimeZoneConfiguration): Boolean {
        return clazz.getMethod("updateTimeZoneConfiguration", TimeZoneConfiguration.clazz)
            .invoke(this.obj, configuration.obj) as Boolean
    }

    /**
     * Registers a listener that will be informed when something about the time zone detector
     * behavior changes.
     */
    fun addTimeZoneDetectorListener(executor: Executor, listener: TimeZoneDetectorListener) {
        clazz.getMethod(
            "addTimeZoneDetectorListener", Executor::class.java, TimeZoneDetectorListener.clazz
        ).invoke(this.obj, executor, listener.obj)
    }

    /**
     * Removes a listener previously passed to
     * {@link #addTimeZoneDetectorListener(Executor, TimeZoneDetectorListener)}
     */
    fun removeTimeZoneDetectorListener(listener: TimeZoneDetectorListener) {
        clazz.getMethod(
            "removeTimeZoneDetectorListener", TimeZoneDetectorListener.clazz
        ).invoke(this.obj, listener.obj)
    }

    /**
     * Suggests the current time from an external time source. For example, a form factor-specific
     * HAL. This time <em>may</em> be used to set the device system clock, depending on the device
     * configuration and user settings. This method call is processed asynchronously.
     * See {@link ExternalTimeSuggestion} for more details.
     */
    fun suggestExternalTime(timeSuggestion: ExternalTimeSuggestion) {
        clazz.getMethod("suggestExternalTime", ExternalTimeSuggestion.clazz)
            .invoke(this.obj, timeSuggestion.obj)
    }

    /**
     * Confirms the device's current time during device setup, raising the system's confidence in
     * the time if needed. Unlike {@link #setManualTime(UnixEpochTime)}, which can only be used when
     * automatic time detection is currently disabled, this method can be used regardless of the
     * automatic time detection setting, but only to confirm the current time (which may have been
     * set via automatic means). Use {@link #getTimeState()} to obtain the time state to confirm.
     *
     * <p>Returns {@code false} if the confirmation is invalid, i.e. if the time being
     * confirmed is no longer the time the device is currently set to. Confirming a time
     * in which the system already has high confidence will return {@code true}.
     */
    fun confirmTime(unixEpochTime: UnixEpochTime): Boolean {
        return clazz.getMethod("confirmTime", UnixEpochTime.clazz)
            .invoke(this.obj, unixEpochTime.obj) as Boolean
    }

    /**
     * Attempts to set the device's time, expected to be determined from the user's manually entered
     * information.
     *
     * <p>Returns {@code false} if the time is invalid, or the device configuration / user
     * capabilities prevents the time being accepted, e.g. if the device is currently set to
     * "automatic time detection". This method returns {@code true} if the time was accepted even
     * if it is the same as the current device time.
     */
    fun setManualTime(unixEpochTime: UnixEpochTime): Boolean {
        return clazz.getMethod("setManualTime", UnixEpochTime.clazz)
            .invoke(this.obj, unixEpochTime.obj) as Boolean
    }

    /**
     * Confirms the device's current time zone ID, raising the system's confidence in the time zone
     * if needed. Unlike {@link #setManualTimeZone(String)}, which can only be used when automatic
     * time zone detection is currently disabled, this method can be used regardless of the
     * automatic time zone detection setting, but only to confirm the current value (which may have
     * been set via automatic means).
     *
     * <p>Returns {@code false} if the confirmation is invalid, i.e. if the time zone ID being
     * confirmed is no longer the time zone ID the device is currently set to. Confirming a time
     * zone ID in which the system already has high confidence returns {@code true}.
     */
    fun confirmTimeZone(timeZoneId: String): Boolean {
        return clazz.getMethod("confirmTimeZone", String::class.java)
            .invoke(this.obj, timeZoneId) as Boolean
    }

    /**
     * Attempts to set the device's time zone, expected to be determined from a user's manually
     * entered information.
     *
     * <p>Returns {@code false} if the time zone is invalid, or the device configuration / user
     * capabilities prevents the time zone being accepted, e.g. if the device is currently set to
     * "automatic time zone detection". {@code true} is returned if the time zone is accepted. A
     * time zone that is accepted and matches the current device time zone returns {@code true}.
     */
    fun setManualTimeZone(timeZoneId: String): Boolean {
        return clazz.getMethod("setManualTimeZone", String::class.java)
            .invoke(this.obj, timeZoneId) as Boolean
    }
}