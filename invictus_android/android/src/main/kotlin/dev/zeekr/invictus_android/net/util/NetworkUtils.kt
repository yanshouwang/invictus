package dev.zeekr.invictus_android.net.util

import java.net.Inet4Address

/**
 * Native methods for managing network interfaces.
 */
object NetworkUtils {
    internal val clazz: Class<*> get() = Class.forName("android.net.NetworkUtils")

    /**
     * @see Inet4AddressUtils.intToInet4AddressHTL
     */
    @Deprecated("Use either {@link Inet4AddressUtils#intToInet4AddressHTH(int)} or {@link Inet4AddressUtils#intToInet4AddressHTL(int)}")
    fun intToInetAddress(hostAddress: Int): Inet4Address {
        return clazz.getMethod("intToInetAddress", Int::class.java)
            .invoke(null, hostAddress) as Inet4Address
    }

    /**
     * @see Inet4AddressUtils.inet4AddressToIntHTL
     */
    @Deprecated("Use either {@link Inet4AddressUtils#inet4AddressToIntHTH(Inet4Address)} or {@link Inet4AddressUtils#inet4AddressToIntHTL(Inet4Address)}")
    fun inetAddressToInt(inetAddr: Inet4Address): Int {
        return clazz.getMethod("inetAddressToInt", Inet4Address::class.java)
            .invoke(null, inetAddr) as Int
    }

    /**
     * @see Inet4AddressUtils.prefixLengthToV4NetmaskIntHTL
     */
    @Deprecated("Use either {@link Inet4AddressUtils#prefixLengthToV4NetmaskIntHTH(int)} or {@link Inet4AddressUtils#prefixLengthToV4NetmaskIntHTL(int)}")
    fun prefixLengthToNetmaskInt(prefixLength: Int): Int {
        return clazz.getMethod("prefixLengthToNetmaskInt", Int::class.java)
            .invoke(null, prefixLength) as Int
    }

    /**
     * Convert a IPv4 netmask integer to a prefix length
     * @param netmask as an integer (0xff000000 for a /8 subnet)
     * @return the network prefix length
     */
    fun netmaskIntToPrefixLength(netmask: Int): Int {
        return clazz.getMethod("netmaskIntToPrefixLength", Int::class.java)
            .invoke(null, netmask) as Int
    }

    /**
     * Convert an IPv4 netmask to a prefix length, checking that the netmask is contiguous.
     * @param netmask as a `Inet4Address`.
     * @return the network prefix length
     * @throws IllegalArgumentException the specified netmask was not contiguous.
     */
    @Deprecated("use {@link Inet4AddressUtils#netmaskToPrefixLength(Inet4Address)}")
    fun netmaskToPrefixLength(netmask: Inet4Address): Int {
        return clazz.getMethod("netmaskToPrefixLength", Inet4Address::class.java)
            .invoke(null, netmask) as Int
    }
}