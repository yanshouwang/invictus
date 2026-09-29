package dev.zeekr.invictus_android.os

import android.os.BugreportManager
import android.os.Build
import androidx.annotation.RequiresApi

@RequiresApi(Build.VERSION_CODES.S)
internal class JniBugreportManager {
    internal interface JniBugreportCallback {
        fun onProgress(progress: Float)
        fun onError(errorCode: Int)
        fun onFinished()
        fun onEarlyReportFinished()
    }

    internal class JniBugreportCallbackImpl(val callback: JniBugreportCallback) :
        BugreportManager.BugreportCallback() {
        override fun onProgress(progress: Float) {
            super.onProgress(progress)
            callback.onProgress(progress)
        }

        override fun onError(errorCode: Int) {
            super.onError(errorCode)
            callback.onError(errorCode)
        }

        override fun onFinished() {
            super.onFinished()
            callback.onFinished()
        }

        override fun onEarlyReportFinished() {
            super.onEarlyReportFinished()
            callback.onEarlyReportFinished()
        }
    }
}