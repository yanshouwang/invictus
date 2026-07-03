package dev.zeekr.invictus_android.net

import android.content.Context
import androidx.core.content.ContextCompat
import dev.zeekr.invictus_android.InvictusObject
import net.bytebuddy.ByteBuddy
import net.bytebuddy.android.AndroidClassLoadingStrategy
import net.bytebuddy.description.method.MethodDescription
import net.bytebuddy.implementation.InvocationHandlerAdapter
import net.bytebuddy.matcher.ElementMatchers

class EthernetManager(context: Context) : InvictusObject() {
    abstract class Listener(context: Context) : InvictusObject() {
        companion object {
            internal val clazz: Class<*> get() = Class.forName("android.net.EthernetManager\$Listener")
        }

        final override val obj: Any

        init {
            val matcher = ElementMatchers.named<MethodDescription>("onAvailabilityChanged")
            val implementation = InvocationHandlerAdapter.of { _, _, args ->
                val iface = args[0] as String
                val isAvailable = args[1] as Boolean
                this.onAvailabilityChanged(iface, isAvailable)
            }
            val privateDirectory = context.getDir("generated", Context.MODE_PRIVATE)
            val classLoadingStrategy = AndroidClassLoadingStrategy.Wrapping(privateDirectory)
            this.obj = ByteBuddy().subclass(clazz).method(matcher).intercept(implementation).make()
                .load(clazz.classLoader, classLoadingStrategy).loaded.getConstructor().newInstance()
        }

        abstract fun onAvailabilityChanged(iface: String, isAvailable: Boolean)
    }

    companion object {
        internal val clazz: Class<*> get() = Class.forName("android.net.EthernetManager")
    }

    override val obj: Any

    init {
        this.obj = ContextCompat.getSystemService(context, clazz) as Any
    }

    val isAvailable: Boolean get() = clazz.getMethod("isAvailable").invoke(this.obj) as Boolean

    val availableInterfaces: Array<String>
        get() {
            val ifaces = clazz.getMethod("getAvailableInterfaces").invoke(this.obj) as Array<*>
            return ifaces.filterIsInstance<String>().toTypedArray()
        }

    fun addListener(listener: Listener) {
        clazz.getMethod("addListener", Listener.clazz).invoke(this.obj, listener.obj)
    }

    fun removeListener(listener: Listener) {
        clazz.getMethod("removeListener", Listener.clazz).invoke(this.obj, listener.obj)
    }

    fun isAvailable(iface: String): Boolean {
        return clazz.getMethod("isAvailable", String::class.java).invoke(this.obj, iface) as Boolean
    }

    fun getConfiguration(iface: String): IpConfiguration {
        val configObj =
            clazz.getMethod("getConfiguration", String::class.java).invoke(this.obj, iface)
                ?: throw NullPointerException("configuration is null")
        return IpConfiguration(configObj)
    }

    fun setConfiguration(iface: String, config: IpConfiguration) {
        clazz.getMethod("setConfiguration", String::class.java, IpConfiguration.clazz)
            .invoke(this.obj, iface, config.obj)
    }
}