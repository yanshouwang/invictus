package dev.zeekr.invictus_android.app.time

/**
 * A capability is the ability for the user to configure something or perform an action. This
 * information is exposed so that system apps like SettingsUI can be dynamic, rather than
 * hard-coding knowledge of when configuration or actions are applicable / available to the user.
 *
 * <p>Capabilities have states that users cannot change directly. They may influence some
 * capabilities indirectly by agreeing to certain device-wide behaviors such as location sharing, or
 * by changing the configuration. See the {@code CAPABILITY_} constants for details.
 *
 * <p>Actions have associated methods, see the documentation for each action for details.
 *
 * <p>Note: Capabilities are independent of app permissions required to call the associated APIs.
 *
 * @hide
 */
class Capabilities {
    companion object {
        val clazz: Class<*> get() = Class.forName("android.app.time.Capabilities")

        /**
         * Indicates that a capability is not supported on this device, e.g. because of form factor or
         * hardware. The associated UI should usually not be shown to the user.
         */
        val CAPABILITY_NOT_SUPPORTED = clazz.getField("CAPABILITY_NOT_SUPPORTED").get(null) as Int

        /**
         * Indicates that a capability is supported on this device, but not allowed for the user, e.g.
         * if the capability relates to the ability to modify settings the user is not able to.
         * This could be because of the user's type (e.g. maybe it applies to the primary user only) or
         * device policy. Depending on the capability, this could mean the associated UI
         * should be hidden, or displayed but disabled.
         */
        val CAPABILITY_NOT_ALLOWED = clazz.getField("CAPABILITY_NOT_ALLOWED").get(null) as Int

        /**
         * Indicates that a capability is possessed but not currently applicable, e.g. if the
         * capability relates to the ability to modify settings, the user has the ability to modify
         * it, but it is currently rendered irrelevant by other settings or other device state (flags,
         * resource config, etc.). The associated UI may be hidden, disabled, or left visible (but
         * ineffective) depending on requirements.
         */
        val CAPABILITY_NOT_APPLICABLE = clazz.getField("CAPABILITY_NOT_APPLICABLE").get(null) as Int

        /** Indicates that a capability is possessed by the user. */
        val CAPABILITY_POSSESSED = clazz.getField("CAPABILITY_POSSESSED").get(null) as Int
    }
}