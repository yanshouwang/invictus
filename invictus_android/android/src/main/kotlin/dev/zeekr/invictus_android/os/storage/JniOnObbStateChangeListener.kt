package dev.zeekr.invictus_android.os.storage

import android.os.storage.OnObbStateChangeListener

internal interface JniOnObbStateChangeListener {
    fun onObbStateChange(path: String, state: Int)
}

internal class JniOnObbStateChangeListenerImpl(val listener: JniOnObbStateChangeListener) :
    OnObbStateChangeListener() {
    override fun onObbStateChange(path: String, state: Int) {
        super.onObbStateChange(path, state)
        listener.onObbStateChange(path, state)
    }
}