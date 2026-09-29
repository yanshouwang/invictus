package dev.zeekr.invictus_android.net.wifi

import android.net.wifi.WifiManager
import android.os.Build
import androidx.annotation.RequiresApi

internal class JniWifiManager {
    internal interface JniScanResultsCallback {
        fun onScanResultsAvailable()
    }

    @RequiresApi(Build.VERSION_CODES.R)
    internal class JniScanResultsCallbackImpl(private val callback: JniScanResultsCallback) :
        WifiManager.ScanResultsCallback() {
        override fun onScanResultsAvailable() {
            callback.onScanResultsAvailable()
        }
    }
}