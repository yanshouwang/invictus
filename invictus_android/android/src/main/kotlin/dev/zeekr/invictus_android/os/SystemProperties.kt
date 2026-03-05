package dev.zeekr.invictus_android.os

/**
 * Gives access to the system properties store.  The system properties
 * store contains a list of string key-value pairs.
 *
 * <p>Use this class only for the system properties that are local. e.g., within
 * an app, a partition, or a module. For system properties used across the
 * boundaries, formally define them in <code>*.sysprop</code> files and use the
 * auto-generated methods. For more information, see <a href=
 * "https://source.android.com/devices/architecture/sysprops-apis">Implementing
 * System Properties as APIs</a>.</p>
 */
object SystemProperties {
    /**
     * Handle to a pre-located property. Looking up a property handle in advance allows
     * for optimal repeated lookup of a single property.
     */
    class Handle(val obj: Any) {
        companion object {
            val clazz: Class<*> get() = Class.forName("android.os.SystemProperties\$Handle")
        }

        /**
         * @return Value of the property
         */
        fun get(): String {
            return clazz.getMethod("get").invoke(this.obj) as String
        }

        /**
         * @param defaultValue default value
         * @return value or {@code defaultValue} on parse error
         */
        fun getInt(defaultValue: Int): Int {
            return clazz.getMethod("getInt", Int::class.java).invoke(this.obj, defaultValue) as Int
        }

        /**
         * @param defaultValue default value
         * @return value or {@code defaultValue} on parse error
         */
        fun getLong(defaultValue: Long): Long {
            return clazz.getMethod("getLong", Long::class.java).invoke(this.obj, defaultValue) as Long
        }

        /**
         * @param defaultValue default value
         * @return value or {@code defaultValue} on parse error
         */
        fun getBoolean(defaultValue: Boolean): Boolean {
            return clazz.getMethod("getBoolean", Boolean::class.java).invoke(this.obj, defaultValue) as Boolean
        }
    }

    val clazz: Class<*> get() = Class.forName("android.os.SystemProperties")

    /**
     * Get the String value for the given {@code key}.
     *
     * @param key the key to lookup
     * @return an empty string if the {@code key} isn't found
     */
    fun get(key: String): String {
        return clazz.getMethod("get", String::class.java).invoke(null, key) as String
    }

    /**
     * Get the String value for the given {@code key}.
     *
     * @param key the key to lookup
     * @param defaultValue the default value in case the property is not set or empty
     * @return if the {@code key} isn't found, return {@code defaultValue} if it isn't null, or an empty
     * string otherwise
     */
    fun get(key: String, defaultValue: String?): String {
        return clazz.getMethod("get", String::class.java, String::class.java).invoke(null, key, defaultValue) as String
    }

    /**
     * Get the value for the given {@code key}, and return as an integer.
     *
     * @param key the key to lookup
     * @param defaultValue a default value to return
     * @return the key parsed as an integer, or defaultValue if the key isn't found or
     *         cannot be parsed
     */
    fun getInt(key: String, defaultValue: Int): Int {
        return clazz.getMethod("getInt", String::class.java, Int::class.java).invoke(null, key, defaultValue) as Int
    }

    /**
     * Get the value for the given {@code key}, and return as a long.
     *
     * @param key the key to lookup
     * @param defaultValue a default value to return
     * @return the key parsed as a long, or defaultValue if the key isn't found or
     *         cannot be parsed
     */
    fun getLong(key: String, defaultValue: Long): Long {
        return clazz.getMethod("getLong", String::class.java, Long::class.java).invoke(null, key, defaultValue) as Long
    }

    /**
     * Get the value for the given {@code key}, returned as a boolean.
     * Values 'n', 'no', '0', 'false' or 'off' are considered false.
     * Values 'y', 'yes', '1', 'true' or 'on' are considered true.
     * (case sensitive).
     * If the key does not exist, or has any other value, then the default
     * result is returned.
     *
     * @param key the key to lookup
     * @param defaultValue a default value to return
     * @return the key parsed as a boolean, or defaultValue if the key isn't found or is
     *         not able to be parsed as a boolean.
     */
    fun getBoolean(key: String, defaultValue: Boolean): Boolean {
        return clazz.getMethod("getBoolean", String::class.java, Boolean::class.java)
            .invoke(null, key, defaultValue) as Boolean
    }


    /**
     * Set the value for the given {@code key} to {@code value}.
     *
     * @throws IllegalArgumentException for non read-only properties if the {@code value} exceeds
     * 91 characters
     * @throws RuntimeException if the property cannot be set, for example, if it was blocked by
     * SELinux. libc will log the underlying reason.
     */
    fun set(key: String, value: String?) {
        clazz.getMethod("set", String::class.java, String::class.java).invoke(null, key, value)
    }

    /**
     * Add a callback that will be run whenever any system property changes.
     *
     * @param callback The {@link Runnable} that should be executed when a system property
     * changes.
     */
    fun addChangeCallback(callback: Runnable) {
        clazz.getMethod("addChangeCallback", Runnable::class.java).invoke(null, callback)
    }

    /**
     * Remove the target callback.
     *
     * @param callback The {@link Runnable} that should be removed.
     */
    fun removeChangeCallback(callback: Runnable) {
        clazz.getMethod("removeChangeCallback", Runnable::class.java).invoke(null, callback)
    }

    /**
     * Return a {@code SHA-1} digest of the given keys and their values as a
     * hex-encoded string. The ordering of the incoming keys doesn't change the
     * digest result.
     */
    fun digestOf(vararg keys: String): String {
        return clazz.getMethod("digestOf", Array<String>::class.java).invoke(null, keys) as String
    }

    fun find(name: String): Handle? {
        val handleObj = clazz.getMethod("find", String::class.java).invoke(null, name)
        return if (handleObj == null) null
        else Handle(handleObj)
    }
}