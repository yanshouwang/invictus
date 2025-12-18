package dev.zeekr.invictus_android.content

import android.content.Context

class InvictusContext {
    companion object {
        val clazz: Class<*> get() = Context::class.java

        val ETHERNET_SERVICE: String
            get() = clazz.getField("ETHERNET_SERVICE").get(null) as String
    }
}