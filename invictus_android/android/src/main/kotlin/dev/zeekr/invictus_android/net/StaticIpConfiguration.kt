package dev.zeekr.invictus_android.net

import android.net.LinkAddress
import android.net.LinkProperties
import android.net.RouteInfo
import java.net.InetAddress

class StaticIpConfiguration {
    class Builder {
        companion object {
            val clazz: Class<*> get() = Class.forName("android.net.StaticIpConfiguration\$Builder")
        }

        val obj: Any

        constructor(obj: Any) {
            this.obj = obj
        }

        constructor() {
            this.obj = clazz.getConstructor().newInstance()
        }

        fun setIpAddress(ipAddress: LinkAddress): Builder {
            val obj = clazz.getMethod("setIpAddress", LinkAddress::class.java).invoke(this.obj, ipAddress) as Any
            return Builder(obj)
        }

        fun setGateway(gateway: InetAddress?): Builder {
            val obj = clazz.getMethod("setGateway", InetAddress::class.java).invoke(this.obj, gateway) as Any
            return Builder(obj)
        }

        fun setDnsServers(dnsServers: Iterable<InetAddress>): Builder {
            val obj = clazz.getMethod("setDnsServers", Iterable::class.java).invoke(this.obj, dnsServers) as Any
            return Builder(obj)
        }

        fun setDomains(newDomains: String?): Builder {
            val obj = clazz.getMethod("setDomains", String::class.java).invoke(this.obj, newDomains) as Any
            return Builder(obj)
        }

        fun build(): StaticIpConfiguration {
            val configObj = clazz.getMethod("build").invoke(this.obj) as Any
            return StaticIpConfiguration(configObj)
        }
    }

    companion object {
        val clazz: Class<*> get() = Class.forName("android.net.StaticIpConfiguration")
    }

    val obj: Any

    constructor(obj: Any) {
        this.obj = obj
    }

    constructor() {
        this.obj = clazz.getConstructor().newInstance()
    }

    constructor(source: StaticIpConfiguration) {
        this.obj = clazz.getConstructor(clazz).newInstance(source.obj)
    }

    val ipAddress: LinkAddress get() = clazz.getMethod("getIpAddress").invoke(this.obj) as LinkAddress

    val gateway: InetAddress? get() = clazz.getMethod("getGateway").invoke(this.obj) as InetAddress?

    val dnsServers: List<InetAddress>
        get() {
            val dnsServers = clazz.getMethod("getDnsServers").invoke(this.obj) as List<*>
            return dnsServers.filterIsInstance<InetAddress>()
        }

    val domains: String? get() = clazz.getMethod("getDomains").invoke(this.obj) as String?

    fun addDnsServer(server: InetAddress) {
        clazz.getMethod("addDnsServer", InetAddress::class.java).invoke(this.obj, server)
    }

    fun clear() {
        clazz.getMethod("clear").invoke(this.obj)
    }

    fun getRoutes(iface: String?): List<RouteInfo> {
        val routes = clazz.getMethod("getRoutes", String::class.java).invoke(this.obj, iface) as List<*>
        return routes.filterIsInstance<RouteInfo>()
    }

    fun toLinkProperties(iface: String?): LinkProperties {
        return clazz.getMethod("toLinkProperties", String::class.java).invoke(this.obj, iface) as LinkProperties
    }
}