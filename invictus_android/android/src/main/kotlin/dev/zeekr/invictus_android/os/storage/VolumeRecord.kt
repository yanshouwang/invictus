package dev.zeekr.invictus_android.os.storage

import dev.zeekr.invictus_android.InvictusObject

class VolumeRecord : InvictusObject {
    override val obj: Any

    internal constructor(obj: Any) {
        this.obj = obj
    }
}