-dontwarn com.sun.jna.**
-dontwarn edu.umd.cs.findbugs.annotations.**
-dontwarn java.lang.instrument.**
-dontwarn javax.annotation.**

-keep class androidx.core.content.** { *; }
# https://github.com/Guardsquare/proguard/issues/238
-keep class com.android.dx.** { *; }
-keep class dev.zeekr.invictus_android.** { *; }
-keep class javax.net.** { *; }
-keep class net.bytebuddy.** { *; }