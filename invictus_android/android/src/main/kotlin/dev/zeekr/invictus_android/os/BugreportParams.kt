package dev.zeekr.invictus_android.os

import android.os.Build
import androidx.annotation.RequiresApi
import dev.zeekr.invictus_android.InvictusObject

/**
 * Parameters that specify what kind of bugreport should be taken.
 *
 * @hide
 */
@RequiresApi(Build.VERSION_CODES.S)
class BugreportParams : InvictusObject {
    override val obj: Any

    /**
     * Constructs a BugreportParams object to specify what kind of bugreport should be taken.
     *
     * @param mode of the bugreport to request
     */
    constructor(mode: Int) {
        this.obj = clazz.getConstructor(Int::class.javaPrimitiveType).newInstance(mode)
    }

    /**
     * Constructs a BugreportParams object to specify what kind of bugreport should be taken.
     *
     * @param mode of the bugreport to request
     * @param flags additional options for the bugreport
     */
    @RequiresApi(Build.VERSION_CODES.UPSIDE_DOWN_CAKE)
    constructor(mode: Int, flags: Int) {
        this.obj = clazz.getConstructor(Int::class.javaPrimitiveType, Int::class.javaPrimitiveType)
            .newInstance(mode, flags)
    }

    companion object {
        internal val clazz: Class<*> get() = Class.forName("android.os.BugreportParams")

        /**
         * Options for a bugreport without user interference (and hence causing less
         * interference to the system), but includes all sections.
         */
        val BUGREPORT_MODE_FULL: Int
            get() = clazz.getField("BUGREPORT_MODE_FULL").getInt(null)

        /**
         * Options that allow user to monitor progress and enter additional data; might not
         * include all sections.
         */
        val BUGREPORT_MODE_INTERACTIVE: Int
            get() = clazz.getField("BUGREPORT_MODE_INTERACTIVE").getInt(null)

        /**
         * Options for a bugreport requested remotely by administrator of the Device Owner app,
         * not the device's user.
         */
        val BUGREPORT_MODE_REMOTE: Int
            get() = clazz.getField("BUGREPORT_MODE_REMOTE").getInt(null)

        /** Options for a bugreport on a wearable device. */
        val BUGREPORT_MODE_WEAR: Int
            get() = clazz.getField("BUGREPORT_MODE_WEAR").getInt(null)

        /**
         * Options for a lightweight version of bugreport that only includes a few, urgent
         * sections used to report telephony bugs.
         */
        val BUGREPORT_MODE_TELEPHONY: Int
            get() = clazz.getField("BUGREPORT_MODE_TELEPHONY").getInt(null)

        /**
         * Options for a lightweight bugreport that only includes a few sections related to
         * Wifi.
         */
        val BUGREPORT_MODE_WIFI: Int
            get() = clazz.getField("BUGREPORT_MODE_WIFI").getInt(null)

        /**
         * Options for a bugreport that is requested while the user is being onboarded.
         */
        val BUGREPORT_MODE_ONBOARDING: Int
            @RequiresApi(Build.VERSION_CODES.VANILLA_ICE_CREAM) get() = clazz.getField("BUGREPORT_MODE_ONBOARDING")
                .getInt(null)

        /**
         * Flag for reusing pre-dumped UI data. The pre-dump and bugreport request calls must be
         * performed by the same UID, otherwise the flag is ignored.
         */
        val BUGREPORT_FLAG_USE_PREDUMPED_UI_DATA: Int
            @RequiresApi(Build.VERSION_CODES.UPSIDE_DOWN_CAKE) get() = clazz.getField("BUGREPORT_FLAG_USE_PREDUMPED_UI_DATA")
                .getInt(null)

        /**
         * Flag for deferring user consent.
         *
         * <p>This flag should be used in cases where it may not be possible for the user to
         * respond to a consent dialog immediately, such as when the user is driving. The
         * generated bugreport may be retrieved at a later time using
         * {@link BugreportManager#retrieveBugreport(String, ParcelFileDescriptor, Executor,
         * BugreportManager.BugreportCallback)}.
         */
        val BUGREPORT_FLAG_DEFER_CONSENT: Int
            @RequiresApi(Build.VERSION_CODES.UPSIDE_DOWN_CAKE) get() = clazz.getField("BUGREPORT_FLAG_DEFER_CONSENT")
                .getInt(null)

        /**
         * Flag for keeping a bugreport stored even after it has been retrieved via
         * {@link BugreportManager#retrieveBugreport}.
         *
         * <p>This flag can only be used when {@link #BUGREPORT_FLAG_DEFER_CONSENT} is set.
         * The bugreport may be retrieved multiple times using
         * {@link BugreportManager#retrieveBugreport(
         * String, ParcelFileDescriptor, Executor, BugreportManager.BugreportCallback)}.
         */
        val BUGREPORT_FLAG_KEEP_BUGREPORT_ON_RETRIEVAL: Int
            @RequiresApi(Build.VERSION_CODES.VANILLA_ICE_CREAM) get() = clazz.getField("BUGREPORT_FLAG_KEEP_BUGREPORT_ON_RETRIEVAL")
                .getInt(null)
    }
}
