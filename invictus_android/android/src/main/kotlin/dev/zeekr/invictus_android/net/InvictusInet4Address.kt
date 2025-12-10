package dev.zeekr.invictus_android.net

import java.net.Inet4Address

class InvictusInet4Address {
    companion object {
        val clazz: Class<Inet4Address> get() = Inet4Address::class.java
    }

    val obj: Inet4Address

    constructor(obj: Inet4Address) {
        this.obj = obj
    }

    constructor() {
        this.obj = clazz.getConstructor().newInstance()
    }

    constructor(hostName: String, addr: ByteArray) {
        this.obj = clazz.getConstructor(String::class.java, ByteArray::class.java).newInstance(hostName, addr)
    }

    constructor(hostName: String, address: Int) {
        this.obj = clazz.getConstructor(String::class.java, Int::class.java).newInstance(hostName, address)
    }
}