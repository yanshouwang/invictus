package dev.zeekr.invictus_android.net

class IpConfiguration {
    class Builder {
        companion object {
            val clazz: Class<*> get() = Class.forName("android.net.IpConfiguration\$Builder")
        }

        val obj: Any

        constructor(obj: Any) {
            this.obj = obj
        }

        constructor() {
            this.obj = clazz.getConstructor().newInstance()
        }

        fun setStaticIpConfiguration(config: StaticIpConfiguration?): Builder {
            val obj =
                clazz.getMethod("setStaticIpConfiguration", StaticIpConfiguration.clazz).invoke(this.obj, config) as Any
            return Builder(obj)
        }

        fun build(): IpConfiguration {
            val configObj = clazz.getMethod("build").invoke(this.obj) as Any
            return IpConfiguration(configObj)
        }
    }

    companion object {
        val clazz: Class<*> get() = Class.forName("android.net.IpConfiguration")
    }

    val obj: Any

    constructor(obj: Any) {
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
            val clazz: Class<*> get() = Class.forName("android.net.IpConfiguration\$IpAssignment")

            fun of(obj: Any): IpAssignment {
                val index = clazz.enumConstants!!.indexOf(obj)
                return entries[index]
            }
        }

        val obj: Any get() = clazz.enumConstants!![ordinal]
    }

    var ipAssignment: IpAssignment
        get() {
            val ipAssignmentObj = clazz.getMethod("getIpAssignment").invoke(this.obj) as Any
            return IpAssignment.of(ipAssignmentObj)
        }
        set(value) {
            clazz.getMethod("setIpAssignment", IpAssignment.clazz).invoke(this.obj, value.obj)
        }

    var staticIpConfiguration: StaticIpConfiguration?
        get() {
            val configObj = clazz.getMethod("getStaticIpConfiguration").invoke(this.obj)
            return if (configObj == null) null
            else StaticIpConfiguration(configObj)
        }
        set(value) {
            clazz.getMethod("setStaticIpConfiguration", StaticIpConfiguration.clazz).invoke(this.obj, value?.obj)
        }
}