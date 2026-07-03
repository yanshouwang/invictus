package dev.zeekr.invictus_android.app.time

import dev.zeekr.invictus_android.InvictusObject

/**
 * A snapshot of the system time state.
 *
 * <p>{@code unixEpochTime} contains a snapshot of the system clock time and elapsed realtime clock
 * time.
 *
 * <p>{@code userShouldConfirmTime} is {@code true} if the system automatic time detection logic
 * suggests that the user be asked to confirm the {@code unixEpochTime} value is correct via {@link
 * TimeManager#confirmTime}. If it is not correct, the value can usually be changed via {@link
 * TimeManager#setManualTime}.
 */
class TimeState : InvictusObject {
    companion object {
        internal val clazz: Class<*> get() = Class.forName("android.app.time.TimeState")
    }

    override val obj: Any

    internal constructor(obj: Any) {
        this.obj = obj
    }

    val unixEpochTime: UnixEpochTime
        get() {
            val obj = clazz.getMethod("getUnixEpochTime").invoke(this.obj) as Any
            return UnixEpochTime(obj)
        }

    val userShouldConfirmTime: Boolean
        get() = clazz.getMethod("getUserShouldConfirmTime").invoke(this.obj) as Boolean
}