package dev.zeekr.invictus_android.os

import android.content.Context
import android.os.Build
import androidx.annotation.RequiresApi

@RequiresApi(Build.VERSION_CODES.S)
internal class JniBugreportManagerCompat {
    internal interface JniBugreportCallbackCompat {
        fun onProgress(progress: Float)
        fun onError(errorCode: Int)
        fun onFinished()
        fun onFinished(bugreportFile: String)
        fun onEarlyReportFinished()
    }

    internal class JniBugreportCallbackCompatImpl(
        context: Context, val callback: JniBugreportCallbackCompat
    ) : BugreportManagerCompat.BugreportCallbackCompat(context) {
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

        override fun onFinished(bugreportFile: String) {
            super.onFinished(bugreportFile)
            callback.onFinished(bugreportFile)
        }

        override fun onEarlyReportFinished() {
            super.onEarlyReportFinished()
            callback.onEarlyReportFinished()
        }
    }
}