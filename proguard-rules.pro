# By default, the flags in this file are appended to flags specified
# in /Applications/Android Studio.app/sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:


# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

-optimizationpasses 5
-dontusemixedcaseclassnames
-dontskipnonpubliclibraryclasses
-dontpreverify
-dontoptimize
-verbose



# Basic elements
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class com.google.gson.Gson

# for views
-keep public class * extends View {
public <init>(android.content.Context);
public <init>(android.content.Context, android.util.AttributeSet);
public <init>(android.content.Context, android.util.AttributeSet, int);
public void set*(...);
}

# Enumerations
-keepclassmembers enum  * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}


# DEBUG MODE: set line numbers and also stacktrace
-printmapping outputfile.txt

-dontwarn org.jboss.**
-dontwarn com.ning.http.**
-dontwarn org.apache.http.**
-dontwarn com.fasterxml.jackson.databind.**
-dontwarn retrofit.**
-dontwarn com.squareup.okhttp.**
-dontwarn org.w3c.dom.bootstrap.DOMImplementationRegistry
-dontwarn org.slf4j.**
-dontwarn fm.**
-dontwarn org.bouncycastle.**
-dontwarn okio.**
-dontwarn okhttp3.**
-dontwarn com.google.**
-dontwarn avp8.**
-dontwarn aopus.**
-dontwarn aaudioprocessing.**

-keep class retrofit.** { *; }
-keepclasseswithmembers class * {
    @retrofit.http.* <methods>;
}

-dontwarn org.joda.time.**
-keep class org.joda.time.** { *; }

-keep class sun.misc.Unsafe { *; }

-keep class com.squareup.okhttp.** { *; }
-keep interface com.squareup.okhttp.** { *; }

-keep class com.viewpagerindicator.** { *; }
-keep class okio.** { *; }
-keep class okhttp3.** { *; }
-keep class de.idnow.sdk.** { *; }
-keep class com.opentok.** { *; }
-keep class org.webrtc.** { *; }
-keep class com.fasterxml.jackson.** { *; }
-keep class com.ning.http.** { *; }
-keep class fm.** { *; }
-keep class org.bouncycastle.** { *; }
-keep class com.google.** { *; }
-keep class avp8.** { *; }
-keep class aopus.** { *; }
-keep class aaudioprocessing.** { *; }

-keepattributes *Annotation*
-keepattributes Signature
-keepattributes SourceFile, LineNumberTable
