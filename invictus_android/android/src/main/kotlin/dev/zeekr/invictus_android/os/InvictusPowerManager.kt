package dev.zeekr.invictus_android.os

import android.os.PowerManager

class InvictusPowerManager(val instance: PowerManager) {
    companion object {
        val clazz: Class<PowerManager> get() = PowerManager::class.java

        /**
         * The value to pass as the 'reason' argument to reboot() to reboot into
         * recovery mode for tasks other than applying system updates, such as
         * doing factory resets.
         * <p>
         * Requires the {@link android.Manifest.permission#RECOVERY}
         * permission (in addition to
         * {@link android.Manifest.permission#REBOOT}).
         * </p>
         */
        val REBOOT_RECOVERY get() = clazz.getField("REBOOT_RECOVERY").get(null) as String

        /**
         * The value to pass as the 'reason' argument to reboot() to reboot into
         * recovery mode for applying system updates.
         * <p>
         * Requires the {@link android.Manifest.permission#RECOVERY}
         * permission (in addition to
         * {@link android.Manifest.permission#REBOOT}).
         * </p>
         */
        val REBOOT_RECOVERY_UPDATE get() = clazz.getField("REBOOT_RECOVERY_UPDATE").get(null) as String

        /**
         * The value to pass as the 'reason' argument to reboot() when device owner requests a reboot on
         * the device.
         */
        val REBOOT_REQUESTED_BY_DEVICE_OWNER
            get() = clazz.getField("REBOOT_REQUESTED_BY_DEVICE_OWNER").get(null) as String

        /**
         * The 'reason' value used when rebooting in safe mode
         */
        val REBOOT_SAFE_MODE get() = clazz.getField("REBOOT_SAFE_MODE").get(null) as String

        /**
         * The 'reason' value used for rebooting userspace.
         *
         * @deprecated userspace reboot is not supported
         */
        val REBOOT_USERSPACE get() = clazz.getField("REBOOT_USERSPACE").get(null) as String

        /**
         * The 'reason' value used when rebooting the device without turning on the screen.
         * @hide
         */
        val REBOOT_QUIESCENT get() = clazz.getField("REBOOT_QUIESCENT").get(null) as String

        /**
         * The value to pass as the 'reason' argument to android_reboot().
         */
        val SHUTDOWN_USER_REQUESTED get() = clazz.getField("SHUTDOWN_USER_REQUESTED").get(null) as String

        /**
         * The value to pass as the 'reason' argument to android_reboot() when battery temperature
         * is too high.
         */
        val SHUTDOWN_BATTERY_THERMAL_STATE get() = clazz.getField("SHUTDOWN_BATTERY_THERMAL_STATE").get(null) as String

        /**
         * The value to pass as the 'reason' argument to android_reboot() when device temperature
         * is too high.
         */
        val SHUTDOWN_THERMAL_STATE get() = clazz.getField("SHUTDOWN_THERMAL_STATE").get(null) as String

        /**
         * The value to pass as the 'reason' argument to android_reboot() when device is running
         * critically low on battery.
         */
        val SHUTDOWN_LOW_BATTERY get() = clazz.getField("SHUTDOWN_LOW_BATTERY").get(null) as String
    }

    /**
     * Turn off the device.
     *
     * @param confirm If true, shows a shutdown confirmation dialog.
     * @param reason code to pass to android_reboot() (e.g. "userrequested"), or null.
     * @param wait If true, this call waits for the shutdown to complete and does not return.
     */
    fun shutdown(confirm: Boolean, reason: String?, wait: Boolean) {
        val method = clazz.getMethod("shutdown", Boolean::class.java, String::class.java, Boolean::class.java)
        method.invoke(instance, confirm, reason, wait)
    }
}