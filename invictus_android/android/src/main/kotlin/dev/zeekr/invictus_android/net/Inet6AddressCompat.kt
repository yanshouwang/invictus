package dev.zeekr.invictus_android.net

import java.net.Inet6Address
import java.net.NetworkInterface

object Inet6AddressCompat {
    fun create(): Inet6Address {
        return Inet6Address::class.java.getConstructor().newInstance()
    }

    fun create(hostName: String, addr: ByteArray, scopeId: Int): Inet6Address {
        return Inet6Address::class.java.getConstructor(
            String::class.java, ByteArray::class.java, Int::class.java
        ).newInstance(hostName, addr, scopeId)
    }

    fun create(hostName: String, addr: ByteArray): Inet6Address {
        return Inet6Address::class.java.getConstructor(String::class.java, ByteArray::class.java)
            .newInstance(hostName, addr)
    }

    fun create(hostName: String, addr: ByteArray, nif: NetworkInterface): Inet6Address {
        return Inet6Address::class.java.getConstructor(
            String::class.java, ByteArray::class.java, NetworkInterface::class.java
        ).newInstance(hostName, addr, nif)
    }

    fun create(hostName: String, addr: ByteArray, ifname: String): Inet6Address {
        return Inet6Address::class.java.getConstructor(
            String::class.java, ByteArray::class.java, String::class.java
        ).newInstance(hostName, addr, ifname)
    }
}