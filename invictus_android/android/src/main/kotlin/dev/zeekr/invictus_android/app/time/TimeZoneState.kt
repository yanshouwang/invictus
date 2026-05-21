package dev.zeekr.invictus_android.app.time

/**
 * A snapshot of the system's time zone state.
 *
 * <p>{@code id} contains the system's time zone ID setting, e.g. "America/Los_Angeles". This
 * will usually agree with {@code TimeZone.getDefault().getID()} but it can be empty in rare cases.
 *
 * <p>{@code userShouldConfirmId} is {@code true} if the system automatic time zone detection logic
 * suggests that the user be asked to confirm the {@code id} value is correct via {@link
 * TimeManager#confirmTimeZone}. If it is not correct, the value can usually be changed via {@link
 * TimeManager#setManualTimeZone}.
 *
 * @hide
 */
class TimeZoneState(val obj: Any) {
    companion object {
        val clazz: Class<*> get() = Class.forName("android.app.time.TimeZoneState")
    }

    val id: String
        get() = clazz.getMethod("getId").invoke(this.obj) as String

    val userShouldConfirmId: Boolean
        get() = clazz.getMethod("getUserShouldConfirmId").invoke(this.obj) as Boolean

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