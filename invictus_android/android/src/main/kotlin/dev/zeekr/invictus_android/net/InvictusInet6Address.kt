package dev.zeekr.invictus_android.net

import java.net.Inet6Address
import java.net.NetworkInterface

class InvictusInet6Address {
    companion object {
        val clazz: Class<Inet6Address> get() = Inet6Address::class.java
    }

    val obj: Inet6Address

    constructor(obj: Inet6Address) {
        this.obj = obj
    }

    constructor() {
        this.obj = clazz.getConstructor().newInstance()
    }

    constructor(hostName: String, addr: ByteArray, scopeId: Int) {
        this.obj = clazz.getConstructor(String::class.java, ByteArray::class.java, Int::class.java)
            .newInstance(hostName, addr, scopeId)
    }

    constructor(hostName: String, addr: ByteArray) {
        this.obj = clazz.getConstructor(String::class.java, ByteArray::class.java).newInstance(hostName, addr)
    }

    constructor(hostName: String, addr: ByteArray, nif: NetworkInterface) {
        this.obj = clazz.getConstructor(String::class.java, ByteArray::class.java, NetworkInterface::class.java)
            .newInstance(hostName, addr, nif)
    }

    constructor(hostName: String, addr: ByteArray, ifname: String) {
        this.obj = clazz.getConstructor(String::class.java, ByteArray::class.java, String::class.java)
            .newInstance(hostName, addr, ifname)
    }
}