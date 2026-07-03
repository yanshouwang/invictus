package dev.zeekr.invictus_android.net.util

import java.net.Inet4Address
import java.net.InetAddress
import java.net.UnknownHostException

/**
 * Collection of utilities to work with IPv4 addresses.
 */
object Inet4AddressUtils {
    internal val clazz: Class<*> = Class.forName("com.android.net.module.util.Inet4AddressUtils")

    /**
     * Convert a IPv4 address from an integer to an InetAddress (0x04030201 -> 1.2.3.4)
     *
     *
     * This method uses the higher-order int bytes as the lower-order IPv4 address bytes,
     * which is an unusual convention. Consider [.intToInet4AddressHTH] instead.
     * @param hostAddress an int coding for an IPv4 address, where higher-order int byte is
     * lower-order IPv4 address byte
     */
    fun intToInet4AddressHTL(hostAddress: Int): Inet4Address {
        return clazz.getMethod("intToInet4AddressHTL", Int::class.java)
            .invoke(null, hostAddress) as Inet4Address
    }

    /**
     * Convert a IPv4 address from an integer to an InetAddress (0x01020304 -> 1.2.3.4)
     * @param hostAddress an int coding for an IPv4 address
     */
    fun intToInet4AddressHTH(hostAddress: Int): Inet4Address {
        return clazz.getMethod("intToInet4AddressHTH", Int::class.java)
            .invoke(null, hostAddress) as Inet4Address
    }

    /**
     * Convert an IPv4 address from an InetAddress to an integer (1.2.3.4 -> 0x01020304)
     *
     *
     * This conversion can help order IP addresses: considering the ordering
     * 192.0.2.1 < 192.0.2.2 < ..., resulting ints will follow that ordering if read as unsigned
     * integers with [Integer.toUnsignedLong].
     * @param inetAddr is an InetAddress corresponding to the IPv4 address
     * @return the IP address as integer
     */
    fun inet4AddressToIntHTH(inetAddr: Inet4Address): Int {
        return clazz.getMethod("inet4AddressToIntHTH", Inet4Address::class.java)
            .invoke(null, inetAddr) as Int
    }

    /**
     * Convert a IPv4 address from an InetAddress to an integer (1.2.3.4 -> 0x04030201)
     *
     *
     * This method stores the higher-order IPv4 address bytes in the lower-order int bytes,
     * which is an unusual convention. Consider [.inet4AddressToIntHTH] instead.
     * @param inetAddr is an InetAddress corresponding to the IPv4 address
     * @return the IP address as integer
     */
    fun inet4AddressToIntHTL(inetAddr: Inet4Address): Int {
        return clazz.getMethod("inet4AddressToIntHTL", Inet4Address::class.java)
            .invoke(null, inetAddr) as Int
    }

    /**
     * Convert a network prefix length to an IPv4 netmask integer (prefixLength 17 -> 0xffff8000)
     * @return the IPv4 netmask as an integer
     */
    fun prefixLengthToV4NetmaskIntHTH(prefixLength: Int): Int {
        return clazz.getMethod("prefixLengthToV4NetmaskIntHTH", Int::class.java)
            .invoke(null, prefixLength) as Int
    }

    /**
     * Convert a network prefix length to an IPv4 netmask integer (prefixLength 17 -> 0x0080ffff).
     *
     *
     * This method stores the higher-order IPv4 address bytes in the lower-order int bytes,
     * which is an unusual convention. Consider [.prefixLengthToV4NetmaskIntHTH] instead.
     * @return the IPv4 netmask as an integer
     */
    fun prefixLengthToV4NetmaskIntHTL(prefixLength: Int): Int {
        return clazz.getMethod("prefixLengthToV4NetmaskIntHTL", Int::class.java)
            .invoke(null, prefixLength) as Int
    }

    /**
     * Convert an IPv4 netmask to a prefix length, checking that the netmask is contiguous.
     * @param netmask as a `Inet4Address`.
     * @return the network prefix length
     * @throws IllegalArgumentException the specified netmask was not contiguous.
     */
    fun netmaskToPrefixLength(netmask: Inet4Address): Int {
        return clazz.getMethod("netmaskToPrefixLength", Inet4Address::class.java)
            .invoke(null, netmask) as Int
    }

    /**
     * Returns the implicit netmask of an IPv4 address, as was the custom before 1993.
     */
    fun getImplicitNetmask(address: Inet4Address): Int {
        return clazz.getMethod("getImplicitNetmask", Inet4Address::class.java)
            .invoke(null, address) as Int
    }

    /**
     * Get the broadcast address for a given prefix.
     *
     *
     * For example 192.168.0.1/24 -> 192.168.0.255
     */
    fun getBroadcastAddress(addr: Inet4Address, prefixLength: Int): Inet4Address {
        return clazz.getMethod("getBroadcastAddress", Inet4Address::class.java, Int::class.java)
            .invoke(null, addr, prefixLength) as Inet4Address
    }

    /**
     * Get a prefix mask as Inet4Address for a given prefix length.
     *
     *
     * For example 20 -> 255.255.240.0
     */
    fun getPrefixMaskAsInet4Address(prefixLength: Int): Inet4Address {
        return clazz.getMethod("getPrefixMaskAsInet4Address", Int::class.java)
            .invoke(null, prefixLength) as Inet4Address
    }

    /**
     * Trim leading zeros from IPv4 address strings
     * Non-v4 addresses and host names remain unchanged.
     * For example, 192.168.000.010 -> 192.168.0.10
     * @param addr a string representing an ip address
     * @return a string properly trimmed
     */
    fun trimAddressZeros(addr: String?): String? {
        return clazz.getMethod("trimAddressZeros", String::class.java).invoke(null, addr) as String?
    }
}