package dev.zeekr.invictus_android.os.storage

import android.os.storage.OnObbStateChangeListener

interface JniOnObbStateChangeListener {
    fun onObbStateChange(path: String, state: Int)
}

class JniOnObbStateChangeListenerImpl(val listener: JniOnObbStateChangeListener) :
    OnObbStateChangeListener() {
    override fun onObbStateChange(path: String, state: Int) {
        super.onObbStateChange(path, state)
        listener.onObbStateChange(path, state)
    }
}