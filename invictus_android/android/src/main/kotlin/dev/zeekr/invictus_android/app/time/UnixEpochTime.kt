package dev.zeekr.invictus_android.app.time

import android.os.SystemClock

/**
 * A Unix epoch time value with an associated reading from the elapsed realtime clock.
 * When representing a device's system clock time, the Unix epoch time can be obtained using {@link
 * System#currentTimeMillis()}. The Unix epoch time might also come from an external source
 * depending on usage.
 *
 * <p>The elapsed realtime clock can be obtained using methods like {@link
 * SystemClock#elapsedRealtime()} or {@link SystemClock#elapsedRealtimeClock()}.
 *
 * @hide
 */
class UnixEpochTime {
    companion object {
        val clazz: Class<*> get() = Class.forName("android.app.time.UnixEpochTime")

        /**
         * Returns the difference in milliseconds between two instance's elapsed realtimes.
         *
         * @hide
         */
        fun elapsedRealtimeDifference(one: UnixEpochTime, two: UnixEpochTime): Long {
            return clazz.getMethod("elapsedRealtimeDifference", clazz, clazz)
                .invoke(null, one.obj, two.obj) as Long
        }
    }

    val obj: Any

    constructor(obj: Any) {
        this.obj = obj
    }

    constructor(elapsedRealtimeMillis: Long, unixEpochTimeMillis: Long) {
        this.obj = clazz.getConstructor(Long::class.java, Long::class.java)
            .newInstance(elapsedRealtimeMillis, unixEpochTimeMillis)
    }

    /** Returns the elapsed realtime clock value. See {@link UnixEpochTime} for more information. */
    val elapsedRealtimeMillis: Long
        get() = clazz.getMethod("getElapsedRealtimeMillis").invoke(this.obj) as Long

    /** Returns the unix epoch time value. See {@link UnixEpochTime} for more information. */
    val unixEpochTimeMillis: Long
        get() = clazz.getMethod("getUnixEpochTimeMillis").invoke(this.obj) as Long

    override fun equals(other: Any?): Boolean {
        return clazz.getMethod("equals", Any::class.java).invoke(this.obj, other) as Boolean
    }

    override fun hashCode(): Int {
        return clazz.getMethod("hashCode").invoke(this.obj) as Int
    }

    override fun toString(): String {
        return clazz.getMethod("toString").invoke(this.obj) as String
    }

    /**
     * Creates a new Unix epoch time value at {@code elapsedRealtimeTimeMillis} by adjusting this
     * Unix epoch time by the difference between the elapsed realtime value supplied and the one
     * associated with this instance.
     */
    fun at(elapsedRealtimeMillis: Long): UnixEpochTime {
        val obj =
            clazz.getMethod("at", Long::class.java).invoke(this.obj, elapsedRealtimeMillis) as Any
        return UnixEpochTime(obj)
    }
}