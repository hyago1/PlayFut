# 1. Manter a MainActivity e classes base do Flutter
-keep public class io.flutter.embedding.android.FlutterActivity
-keep public class com.hpdev.playfut.MainActivity {
    public *;
}

# 2. Manter o AdMob e suas dependências (SafeParcelable)

# Mantenha todas as classes e membros do AdMob
-keep class com.google.android.gms.ads.** { *; }

# Mantenha as classes SafeParcelable e suas propriedades de serialização.
# Esta sintaxe é a que o R8 espera.
-keep public class * extends com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable {
    public static final android.os.Parcelable$Creator CREATOR;
    public <init>(...);
    public void writeToParcel(android.os.Parcel, int);
}