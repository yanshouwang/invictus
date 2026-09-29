package dev.zeekr.invictus_android.net

import android.net.LinkAddress
import androidx.annotation.IntRange
import java.net.InetAddress
import java.net.InterfaceAddress

object LinkAddressCompat {
    fun create(
        address: InetAddress, @IntRange(0, 128) prefixLength: Int, flags: Int, scope: Int
    ): LinkAddress {
        return LinkAddress::class.java.getConstructor(
            InetAddress::class.java, Int::class.java, Int::class.java, Int::class.java
        ).newInstance(address, prefixLength, flags, scope)
    }

    fun create(
        address: InetAddress,
        @IntRange(0, 128) prefixLength: Int,
        flags: Int,
        scope: Int,
        deprecationTime: Long,
        expirationTime: Long
    ): LinkAddress {
        return LinkAddress::class.java.getConstructor(
            InetAddress::class.java,
            Int::class.java,
            Int::class.java,
            Int::class.java,
            Long::class.java,
            Long::class.java
        ).newInstance(address, prefixLength, flags, scope, deprecationTime, expirationTime)
    }

    fun create(address: InetAddress, @IntRange(0, 128) prefixLength: Int): LinkAddress {
        return LinkAddress::class.java.getConstructor(InetAddress::class.java, Int::class.java)
            .newInstance(address, prefixLength)
    }

    fun create(address: InterfaceAddress): LinkAddress {
        return LinkAddress::class.java.getConstructor(InterfaceAddress::class.java)
            .newInstance(address)
    }

    fun create(address: String): LinkAddress {
        return LinkAddress::class.java.getConstructor(String::class.java).newInstance(address)
    }

    fun create(address: String, flags: Int, scope: Int): LinkAddress {
        return LinkAddress::class.java.getConstructor(
            String::class.java, Int::class.java, Int::class.java
        ).newInstance(address, flags, scope)
    }
}