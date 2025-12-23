package dev.zeekr.invictus_android.internal.app

import java.util.Locale

class InvictusLocalePicker {
    interface InvictusLocaleSelectionListener {
        fun onLocaleSelected(locale: Locale)
    }

    class InvictusLocaleSelectionListenerImpl(private val listener: InvictusLocaleSelectionListener) :
        LocalePicker.LocaleSelectionListener() {
        override fun onLocaleSelected(locale: Locale) {
            listener.onLocaleSelected(locale)
        }
    }
}