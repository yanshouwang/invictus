package dev.zeekr.invictus_android.net

import android.content.Context

internal class JniEthernetManager {
    internal interface JniListener {
        fun onAvailabilityChanged(iface: String, isAvailable: Boolean)
    }

    internal class JniListenerImpl(context: Context, private val listener: JniListener) :
        EthernetManager.Listener(context) {
        override fun onAvailabilityChanged(iface: String, isAvailable: Boolean) {
            listener.onAvailabilityChanged(iface, isAvailable)
        }
    }
}