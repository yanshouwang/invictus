package dev.zeekr.invictus_android.net.wifi

import android.net.wifi.WifiManager
import android.os.Build
import androidx.annotation.RequiresApi

class InvictusWifiManager {
    interface InvictusScanResultsCallback {
        fun onScanResultsAvailable()
    }

    @RequiresApi(Build.VERSION_CODES.R)
    class InvictusScanResultsCallbackImpl(private val callback: InvictusScanResultsCallback) :
        WifiManager.ScanResultsCallback() {
        override fun onScanResultsAvailable() {
            callback.onScanResultsAvailable()
        }
    }
}