package dev.zeekr.invictus_android.app.time

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
 *
 * @hide
 */
class TimeState(val obj: Any) {
    companion object {
        val clazz: Class<*> get() = Class.forName("android.app.time.TimeState")
    }

    val unixEpochTime: UnixEpochTime
        get() {
            val obj = clazz.getMethod("getUnixEpochTime").invoke(this.obj) as Any
            return UnixEpochTime(obj)
        }

    val userShouldConfirmTime: Boolean
        get() = clazz.getMethod("getUserShouldConfirmTime").invoke(this.obj) as Boolean

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