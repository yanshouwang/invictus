package dev.zeekr.invictus_android.net

import android.net.LinkAddress
import androidx.annotation.IntRange
import java.net.InetAddress
import java.net.InterfaceAddress


class InvictusLinkAddress {
    companion object {
        val clazz: Class<LinkAddress> get() = LinkAddress::class.java
    }

    val obj: LinkAddress

    constructor(obj: LinkAddress) {
        this.obj = obj
    }

    constructor(address: InetAddress, @IntRange(0, 128) prefixLength: Int, flags: Int, scope: Int) {
        this.obj = clazz.getConstructor(LinkAddress::class.java, Int::class.java, Int::class.java, Int::class.java)
            .newInstance(address, prefixLength, flags, scope)
    }

    constructor(
        address: InetAddress,
        @IntRange(0, 128) prefixLength: Int,
        flags: Int,
        scope: Int,
        deprecationTime: Long,
        expirationTime: Long
    ) {
        this.obj = clazz.getConstructor(
            InetAddress::class.java,
            Int::class.java,
            Int::class.java,
            Int::class.java,
            Long::class.java,
            Long::class.java
        ).newInstance(address, prefixLength, flags, scope, deprecationTime, expirationTime)
    }

    constructor(address: InetAddress, @IntRange(0, 128) prefixLength: Int) {
        this.obj = clazz.getConstructor(InetAddress::class.java, Int::class.java).newInstance(address, prefixLength)
    }

    constructor(address: InterfaceAddress) {
        this.obj = clazz.getConstructor(InterfaceAddress::class.java).newInstance(address)
    }

    constructor(address: String) {
        this.obj = clazz.getConstructor(String::class.java).newInstance(address)
    }

    constructor(address: String, flags: Int, scope: Int) {
        this.obj = clazz.getConstructor(String::class.java, Int::class.java, Int::class.java)
            .newInstance(address, flags, scope)
    }
}