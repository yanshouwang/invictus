package dev.zeekr.invictus_android.net

import dev.zeekr.invictus_android.InvictusObject

class IpConfiguration : InvictusObject {
    class Builder : InvictusObject {
        companion object {
            internal val clazz: Class<*> get() = Class.forName("android.net.IpConfiguration\$Builder")
        }

        override val obj: Any

        internal constructor(obj: Any) {
            this.obj = obj
        }

        constructor() {
            this.obj = clazz.getConstructor().newInstance()
        }

        fun setStaticIpConfiguration(config: StaticIpConfiguration?): Builder {
            val obj = clazz.getMethod("setStaticIpConfiguration", StaticIpConfiguration.clazz)
                .invoke(this.obj, config) as Any
            return Builder(obj)
        }

        fun build(): IpConfiguration {
            val obj = clazz.getMethod("build").invoke(this.obj) as Any
            return IpConfiguration(obj)
        }
    }

    companion object {
        internal val clazz: Class<*> get() = Class.forName("android.net.IpConfiguration")
    }

    override val obj: Any

    internal constructor(obj: Any) {
        this.obj = obj
    }

    constructor() {
        this.obj = clazz.getConstructor().newInstance()
    }

    constructor(source: IpConfiguration) {
        this.obj = clazz.getConstructor(clazz).newInstance(source.obj)
    }

    enum class IpAssignment {
        STATIC, DHCP, UNASSIGNED;

        companion object {
            internal val clazz: Class<*> get() = Class.forName("android.net.IpConfiguration\$IpAssignment")

            internal fun of(obj: Any): IpAssignment {
                val index = clazz.enumConstants!!.indexOf(obj)
                return entries[index]
            }
        }

        internal val obj: Any get() = clazz.enumConstants!![ordinal]
    }

    var ipAssignment: IpAssignment
        get() {
            val obj = clazz.getMethod("getIpAssignment").invoke(this.obj) as Any
            return IpAssignment.of(obj)
        }
        set(value) {
            clazz.getMethod("setIpAssignment", IpAssignment.clazz).invoke(this.obj, value.obj)
        }

    var staticIpConfiguration: StaticIpConfiguration?
        get() {
            val obj = clazz.getMethod("getStaticIpConfiguration").invoke(this.obj)
            return if (obj == null) null
            else StaticIpConfiguration(obj)
        }
        set(value) {
            clazz.getMethod("setStaticIpConfiguration", StaticIpConfiguration.clazz)
                .invoke(this.obj, value?.obj)
        }
}