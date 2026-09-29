package dev.zeekr.invictus_android.content

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent

internal interface JniBroadcastReceiver {
    fun onReceive(context: Context?, intent: Intent?)
}

internal class JniBroadcastReceiverImpl(private val receiver: JniBroadcastReceiver) :
    BroadcastReceiver() {
    override fun onReceive(context: Context?, intent: Intent?) {
        receiver.onReceive(context, intent)
    }
}