package dev.zeekr.invictus_android.app.time

/**
 * A time signal from an External source.
 *
 * <p>External time suggestions are for use in situations where the Android device is part of a
 * wider network of devices that are required to use a single time source, and where authority for
 * the time is external to the Android device. For example, for the Android Auto use case where the
 * Android device is part of a wider in-car network of devices that should display the same time.
 *
 * <p>Android allows for a single external source for time. If there are several external sources
 * then it is left to the caller to prioritize / filter accordingly to ensure consistency.
 *
 * <p>External is one of several time "origins" that the Android platform supports. Stock Android
 * allows for configuration of which origins can be used and the prioritization between them. Until
 * an external suggestion is made, the Android device may use its own RTC to initialize the system
 * clock during boot, and then accept suggestions from the configured origins.
 *
 * <p>The creator of an external suggestion is expected to be separate Android process, e.g. a
 * process integrating with the external time source via a HAL or local network. The creator must
 * capture the elapsed realtime clock value, e.g. via {@link SystemClock#elapsedRealtime()}, when
 * the Unix epoch time is first obtained (usually under a wakelock). This enables Android to adjust
 * for latency introduced between suggestion creation and eventual use. Adjustments for other
 * sources of latency, i.e. those before the external time suggestion is created, must be handled by
 * the creator.
 *
 * <p>{@code elapsedRealtimeMillis} and {@code suggestionMillis} represent the suggested time.
 * {@code suggestionMillis} is the number of milliseconds elapsed since 1/1/1970 00:00:00 UTC
 * according to the Unix time scale. {@code elapsedRealtimeMillis} is the value of the elapsed
 * realtime clock when {@code suggestionMillis} was established. Note that the elapsed realtime
 * clock is considered accurate but it is volatile, so time suggestions cannot be persisted across
 * device resets.
 *
 * <p>{@code debugInfo} contains debugging metadata associated with the suggestion. This is used to
 * record why the suggestion exists and how it was entered. This information exists only to aid in
 * debugging and therefore is used by {@link #toString()}, but it is not for use in detection logic
 * and is not considered in {@link #hashCode()} or {@link #equals(Object)}.
 *
 * @hide
 */
class ExternalTimeSuggestion {
    companion object {
        val clazz: Class<*> get() = Class.forName("android.app.time.ExternalTimeSuggestion")
    }

    val obj: Any

    constructor(obj: Any) {
        this.obj = obj
    }

    /**
     * Creates a time suggestion cross-referenced to the elapsed realtime clock. See {@link
     * ExternalTimeSuggestion} for more details.
     *
     * @param elapsedRealtimeMillis the elapsed realtime clock reference for the suggestion
     * @param suggestionMillis      the suggested time in milliseconds since the start of the
     *                              Unix epoch
     */
    constructor(elapsedRealtimeMillis: Long, suggestionMillis: Long) {
        this.obj = clazz.getConstructor(Long::class.java, Long::class.java).newInstance(
            elapsedRealtimeMillis, suggestionMillis
        )
    }

    /**
     * {@hide}
     */
    val unixEpochTime: UnixEpochTime
        get() {
            val obj = clazz.getMethod("getUnixEpochTime").invoke(this.obj) as Any
            return UnixEpochTime(obj)
        }

    /**
     * Returns information that can be useful for debugging / logging. See {@link #addDebugInfo}.
     */
    val debugInfo: List<String>
        get() {
            val obj = clazz.getMethod("getDebugInfo").invoke(this.obj) as List<*>
            return obj.filterIsInstance<String>()
        }

    /**
     * Associates information with the instance that can be useful for debugging / logging. The
     * information is present in {@link #toString()} but is not considered for {@link
     * #equals(Object)} and {@link #hashCode()}.
     */
    fun addDebugInfo(vararg debugInfos: String) {
        clazz.getMethod("addDebugInfo", Array<String>::class.java)
            .invoke(this.obj, arrayOf(*debugInfos))
    }

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