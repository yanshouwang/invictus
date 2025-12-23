package dev.zeekr.invictus_android.internal.app

import android.content.Context
import android.os.LocaleList
import java.lang.reflect.InvocationHandler
import java.lang.reflect.Proxy
import java.util.Locale

// https://cs.android.com/android/platform/superproject/main/+/main:frameworks/base/core/java/com/android/internal/app/LocalePicker.java
class LocalePicker {
    abstract class LocaleSelectionListener {
        companion object {
            val clazz: Class<*> get() = Class.forName("com.android.internal.app.LocalePicker\$LocaleSelectionListener")
        }

        val obj: Any

        init {
            val handler = InvocationHandler { _, _, args ->
                val locale = args[0] as Locale
                onLocaleSelected(locale)
            }
            obj = Proxy.newProxyInstance(clazz.classLoader, arrayOf(clazz), handler)
        }

        abstract fun onLocaleSelected(locale: Locale)
    }

    class LocaleInfo : Comparable<LocaleInfo> {
        companion object {
            val clazz: Class<*> get() = Class.forName("com.android.internal.app.LocalePicker\$LocaleInfo")
        }

        val obj: Any

        constructor(obj: Any) {
            this.obj = obj
        }

        constructor(label: String, locale: Locale) {
            this.obj = clazz.getConstructor(String::class.java, Locale::class.java).newInstance(label, locale)
        }

        val label: String get() = clazz.getMethod("getLabel").invoke(obj) as String
        val locale: Locale get() = clazz.getMethod("getLocale").invoke(obj) as Locale

        override fun toString(): String {
            return clazz.getMethod("toString").invoke(obj) as String
        }

        override fun compareTo(other: LocaleInfo): Int {
            return clazz.getMethod("compareTo", clazz).invoke(obj, other.obj) as Int
        }
    }

    companion object {
        val clazz: Class<*> get() = Class.forName("com.android.internal.app.LocalePicker")

        fun getSystemAssetLocales(): Array<String> {
            val locales = clazz.getMethod("getSystemAssetLocales").invoke(null) as Array<*>
            return locales.filterIsInstance<String>().toTypedArray()
        }

        fun getSupportedLocales(context: Context): Array<String> {
            val locales = clazz.getMethod("getSupportedLocales", Context::class.java).invoke(null, context) as Array<*>
            return locales.filterIsInstance<String>().toTypedArray()
        }

        fun getAllAssetLocales(context: Context, isInDeveloperMode: Boolean): List<LocaleInfo> {
            val infos = clazz.getMethod("getAllAssetLocales", Context::class.java, Boolean::class.java)
                .invoke(null, context, isInDeveloperMode) as List<*>
            return infos.filterNotNull().map { LocaleInfo(it) }
        }

        fun setLocaleSelectionListener(listener: LocaleSelectionListener) {
            clazz.getMethod("setLocaleSelectionListener", LocaleSelectionListener.clazz).invoke(null, listener.obj)
        }

        /**
         * Requests the system to update the system locale. Note that the system looks halted
         * for a while during the Locale migration, so the caller need to take care of it.
         *
         * @see #updateLocales(LocaleList)
         */
        fun updateLocale(locale: Locale) {
            clazz.getMethod("updateLocale", Locale::class.java).invoke(null, locale)
        }

        /**
         * Requests the system to update the list of system locales.
         * Note that the system looks halted for a while during the Locale migration,
         * so the caller need to take care of it.
         */
        fun updateLocales(locals: LocaleList) {
            clazz.getMethod("updateLocale", LocaleList::class.java).invoke(null, locals)
        }

        /**
         * Get the locale list.
         *
         * @return The locale list.
         */
        fun getLocales(): LocaleList {
            return clazz.getMethod("getLocales").invoke(null) as LocaleList
        }
    }
}