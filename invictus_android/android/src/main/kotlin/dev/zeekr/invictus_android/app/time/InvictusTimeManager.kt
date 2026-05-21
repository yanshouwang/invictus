package dev.zeekr.invictus_android.app.time

class InvictusTimeManager {
    interface InvictusTimeZoneDetectorListener {
        fun onChange()
    }

    class InvictusTimeZoneDetectorListenerImpl(private val listener: InvictusTimeZoneDetectorListener) :
        TimeManager.TimeZoneDetectorListener() {
        override fun onChange() {
            listener.onChange()
        }
    }
}