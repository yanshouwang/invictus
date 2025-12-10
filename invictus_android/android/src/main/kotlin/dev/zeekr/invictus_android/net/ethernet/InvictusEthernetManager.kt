package dev.zeekr.invictus_android.net.ethernet

import android.content.Context

class InvictusEthernetManager {
    interface InvictusListener {
        fun onAvailabilityChanged(iface: String, isAvailable: Boolean)
    }

    class InvictusListenerImpl(context: Context, private val listener: InvictusListener) :
        EthernetManager.Listener(context) {
        override fun onAvailabilityChanged(iface: String, isAvailable: Boolean) {
            listener.onAvailabilityChanged(iface, isAvailable)
        }
    }
}