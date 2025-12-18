package dev.zeekr.invictus_android.content

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent

interface InvictusBroadcastReceiver {
    fun onReceive(context: Context?, intent: Intent?)
}

class InvictusBroadcastReceiverImpl(private val receiver: InvictusBroadcastReceiver) : BroadcastReceiver() {
    override fun onReceive(context: Context?, intent: Intent?) {
        receiver.onReceive(context, intent)
    }
}