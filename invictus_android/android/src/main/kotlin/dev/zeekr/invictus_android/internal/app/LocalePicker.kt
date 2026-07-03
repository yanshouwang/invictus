package dev.zeekr.invictus_android.internal.app

import android.content.Context
import android.os.LocaleList
import dev.zeekr.invictus_android.InvictusObject
import java.lang.reflect.Proxy
import java.util.Locale

class LocalePicker : InvictusObject {
    abstract class LocaleSelectionListener : InvictusObject() {
        companion object {
            internal val clazz: Class<*> get() = Class.forName("com.android.internal.app.LocalePicker\$LocaleSelectionListener")
        }

        final override val obj: Any

        init {
            this.obj = Proxy.newProxyInstance(clazz.classLoader, arrayOf(clazz)) { _, _, args ->
                val locale = args[0] as Locale
                this.onLocaleSelected(locale)
            }
        }

        abstract fun onLocaleSelected(locale: Locale)
    }

    class LocaleInfo : InvictusObject, Comparable<LocaleInfo> {
        companion object {
            internal val clazz: Class<*> get() = Class.forName("com.android.internal.app.LocalePicker\$LocaleInfo")
        }

        override val obj: Any

        internal constructor(obj: Any) {
            this.obj = obj
        }

        constructor(label: String, locale: Locale) {
            this.obj = clazz.getConstructor(String::class.java, Locale::class.java)
                .newInstance(label, locale)
        }

        val label: String get() = clazz.getMethod("getLabel").invoke(obj) as String
        val locale: Locale get() = clazz.getMethod("getLocale").invoke(obj) as Locale

        override fun compareTo(other: LocaleInfo): Int {
            return clazz.getMethod("compareTo", clazz).invoke(this.obj, other.obj) as Int
        }
    }

    companion object {
        internal val clazz: Class<*> get() = Class.forName("com.android.internal.app.LocalePicker")

        fun getSystemAssetLocales(): Array<String> {
            val locales = clazz.getMethod("getSystemAssetLocales").invoke(null) as Array<*>
            return locales.filterIsInstance<String>().toTypedArray()
        }

        fun getSupportedLocales(context: Context): Array<String> {
            val locales = clazz.getMethod("getSupportedLocales", Context::class.java)
                .invoke(null, context) as Array<*>
            return locales.filterIsInstance<String>().toTypedArray()
        }

        fun getAllAssetLocales(context: Context, isInDeveloperMode: Boolean): List<LocaleInfo> {
            val objs =
                clazz.getMethod("getAllAssetLocales", Context::class.java, Boolean::class.java)
                    .invoke(null, context, isInDeveloperMode) as List<*>
            return objs.filterNotNull().map { LocaleInfo(it) }
        }

        fun setLocaleSelectionListener(listener: LocaleSelectionListener) {
            clazz.getMethod("setLocaleSelectionListener", LocaleSelectionListener.clazz)
                .invoke(null, listener.obj)
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
        fun updateLocales(locales: LocaleList) {
            clazz.getMethod("updateLocales", LocaleList::class.java).invoke(null, locales)
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

    override val obj: Any

    internal constructor(obj: Any) {
        this.obj = obj
    }
}