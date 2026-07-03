package dev.zeekr.invictus_android.internal.app

import java.util.Locale

internal class JniLocalePicker {
    internal interface JniLocaleSelectionListener {
        fun onLocaleSelected(locale: Locale)
    }

    internal class JniLocaleSelectionListenerImpl(private val listener: JniLocaleSelectionListener) :
        LocalePicker.LocaleSelectionListener() {
        override fun onLocaleSelected(locale: Locale) {
            listener.onLocaleSelected(locale)
        }
    }
}