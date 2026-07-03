package dev.zeekr.invictus_android.net.wifi

import android.net.wifi.WifiConfiguration
import dev.zeekr.invictus_android.net.IpConfiguration
import dev.zeekr.invictus_android.net.StaticIpConfiguration

object WifiConfigurationCompat {
    fun getIpConfiguration(thiz: WifiConfiguration): IpConfiguration {
        val obj = WifiConfiguration::class.java.getMethod("getIpConfiguration").invoke(thiz) as Any
        return IpConfiguration(obj)
    }

    fun setIpConfiguration(thiz: WifiConfiguration, ipConfiguration: IpConfiguration?) {
        WifiConfiguration::class.java.getMethod("setIpConfiguration", IpConfiguration.clazz)
            .invoke(thiz, ipConfiguration?.obj)
    }

    fun getIpAssignment(thiz: WifiConfiguration): IpConfiguration.IpAssignment {
        val obj = WifiConfiguration::class.java.getMethod("getIpAssignment").invoke(thiz) as Any
        return IpConfiguration.IpAssignment.of(obj)
    }

    fun setIpAssignment(thiz: WifiConfiguration, ipAssignment: IpConfiguration.IpAssignment) {
        WifiConfiguration::class.java.getMethod(
            "setIpAssignment", IpConfiguration.IpAssignment.clazz
        ).invoke(thiz, ipAssignment.obj)
    }

    fun getStaticIpConfiguration(thiz: WifiConfiguration): StaticIpConfiguration? {
        val obj = WifiConfiguration::class.java.getMethod("getStaticIpConfiguration").invoke(thiz)
        return if (obj == null) null else StaticIpConfiguration(obj)
    }

    fun setStaticIpConfiguration(
        thiz: WifiConfiguration, staticIpConfiguration: StaticIpConfiguration?
    ) {
        WifiConfiguration::class.java.getMethod(
            "setStaticIpConfiguration", StaticIpConfiguration.clazz
        ).invoke(thiz, staticIpConfiguration?.obj)
    }
}
