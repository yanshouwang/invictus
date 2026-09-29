package dev.zeekr.invictus_android.app.time

import android.os.Build
import androidx.annotation.RequiresApi
import dev.zeekr.invictus_android.InvictusObject

/**
 * A pair containing a user's {@link TimeCapabilities} and {@link TimeConfiguration}.
 */
class TimeCapabilitiesAndConfig : InvictusObject {
    companion object {
        internal val clazz: Class<*> get() = Class.forName("android.app.time.TimeCapabilitiesAndConfig")
    }

    override val obj: Any

    internal constructor(obj: Any) {
        this.obj = obj
    }

    /**
     * Returns the user's time behaviour capabilities.
     */
    val capabilities: TimeCapabilities
        @RequiresApi(Build.VERSION_CODES.UPSIDE_DOWN_CAKE) get() {
            val obj = clazz.getMethod("getCapabilities").invoke(this.obj) as Any
            return TimeCapabilities(obj)
        }

    /**
     * Returns the user's time behaviour configuration.
     */
    val configuration: TimeConfiguration
        @RequiresApi(Build.VERSION_CODES.UPSIDE_DOWN_CAKE) get() {
            val obj = clazz.getMethod("getConfiguration").invoke(this.obj) as Any
            return TimeConfiguration(obj)
        }
}