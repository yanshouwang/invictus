package dev.zeekr.invictus_android.net

import java.net.Inet4Address

object Inet4AddressCompat {
    fun create(): Inet4Address {
        return Inet4Address::class.java.getConstructor().newInstance()
    }

    fun create(hostName: String, addr: ByteArray): Inet4Address {
        return Inet4Address::class.java.getConstructor(String::class.java, ByteArray::class.java)
            .newInstance(hostName, addr)
    }

    fun create(hostName: String, address: Int): Inet4Address {
        return Inet4Address::class.java.getConstructor(String::class.java, Int::class.java)
            .newInstance(hostName, address)
    }
}