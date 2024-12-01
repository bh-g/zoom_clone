#=== Flutter Wrapper ===#
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

#=== Jitsi Meet Wrapper ===#
# Preserve all classes in the wrapper and the core Jitsi Meet library
-keep class org.jitsi.meet.** { *; }
-keep class org.jitsi.meet.sdk.** { *; }
-keep class com.gunschu.jitsi_meet_wrapper.** { *; }
-dontwarn org.jitsi.meet.**
-dontwarn com.gunschu.jitsi_meet_wrapper.**

# WebRTC
-keep class org.webrtc.** { *; }
-dontwarn org.chromium.build.BuildHooksAndroid

# JNI Methods
-keepclassmembers class * {
    native <methods>;
}

# Preserve annotations
-keepattributes *Annotation*
-keepattributes InnerClasses
-keepattributes EnclosingMethod

#=== React Native Rules (if used in your project) ===#
-keep class * extends com.facebook.react.bridge.JavaScriptModule { *; }
-keep class * extends com.facebook.react.bridge.NativeModule { *; }
-keepclassmembers class *  { @com.facebook.react.uimanager.UIProp <fields>; }
-keepclassmembers class *  { @com.facebook.react.uimanager.annotations.ReactProp <methods>; }
-keepclassmembers class *  { @com.facebook.react.uimanager.annotations.ReactPropGroup <methods>; }

-dontwarn com.facebook.react.**
-keep,includedescriptorclasses class com.facebook.react.bridge.** { *; }

#=== Network Libraries ===#
# okhttp
-keepattributes Signature
-keepattributes *Annotation*
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }
-dontwarn okhttp3.**

# okio
-keep class sun.misc.Unsafe { *; }
-dontwarn java.nio.file.*
-dontwarn org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement
-keep class okio.** { *; }
-dontwarn okio.**

#=== Hermes JS Engine (if used) ===#
-keep class com.facebook.hermes.unicode.** { *; }

#=== SVG Rendering ===#
-keep public class com.horcrux.svg.** {*;}
