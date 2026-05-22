package dev.zeekr.invictus_android.net.wifi

import android.net.wifi.WifiConfiguration
import dev.zeekr.invictus_android.net.IpConfiguration
import dev.zeekr.invictus_android.net.StaticIpConfiguration

class InvictusWifiConfiguration(val obj: WifiConfiguration) {
    companion object {
        val clazz: Class<*> get() = WifiConfiguration::class.java
    }

    var staticIpConfiguration: StaticIpConfiguration?
        get() {
            val obj = clazz.getMethod("getStaticIpConfiguration").invoke(this.obj)
            return if (obj == null) null else StaticIpConfiguration(obj)
        }
        set(value) {
            clazz.getMethod("setStaticIpConfiguration", StaticIpConfiguration.clazz)
                .invoke(this.obj, value?.obj)
        }

    var ipAssignment: IpConfiguration.IpAssignment
        get() {
            val obj = clazz.getMethod("getIpAssignment").invoke(this.obj) as Any
            return IpConfiguration.IpAssignment.of(obj)
        }
        set(value) {
            clazz.getMethod("setIpAssignment", IpConfiguration.IpAssignment.clazz)
                .invoke(this.obj, value.obj)
        }

    fun getIpConfiguration(): IpConfiguration {
        val obj = clazz.getMethod("getIpConfiguration").invoke(this.obj) as Any
        return IpConfiguration(obj)
    }

    fun setIpConfiguration(ipConfiguration: IpConfiguration?) {
        clazz.getMethod("setIpConfiguration", IpConfiguration.clazz)
            .invoke(this.obj, ipConfiguration?.obj)
    }
}