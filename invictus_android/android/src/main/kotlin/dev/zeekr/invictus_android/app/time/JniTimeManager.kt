package dev.zeekr.invictus_android.app.time

internal class JniTimeManager {
    internal interface JniTimeZoneDetectorListener {
        fun onChange()
    }

    internal class JniTimeZoneDetectorListenerImpl(private val listener: JniTimeZoneDetectorListener) :
        TimeManager.TimeZoneDetectorListener() {
        override fun onChange() {
            listener.onChange()
        }
    }
}