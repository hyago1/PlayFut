import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.hpdev.playfut"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    // 🔑 1. CONFIGURAÇÃO DA CHAVE DE ASSINATURA (SIGNING CONFIGS)
    signingConfigs {
        create("release") {
            val keyPropertiesFile = rootProject.file("key.properties")

            if (keyPropertiesFile.exists()) {
                val props = Properties()
                props.load(FileInputStream(keyPropertiesFile))

                storeFile = file(props["storeFile"] as String)
                storePassword = props["storePassword"] as String
                keyAlias = props["keyAlias"] as String
                keyPassword = props["keyPassword"] as String
            } else {
                // Apenas uma mensagem de aviso.
                // A atribuição do signingConfig é feita no bloco buildTypes abaixo.
                println("⚠️ ATENÇÃO: key.properties não encontrado. Usando chaves de debug para build de release.")
            }
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.hpdev.playfut"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        getByName("release") {
            
        isMinifyEnabled = true // <--- Mudar de volta para TRUE!
        isShrinkResources = true // <--- Mudar de volta para TRUE!

        proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
            signingConfig = signingConfigs.getByName("release")
        }   

        getByName("debug") {
            // Configurações de debug
        }
    }
}

flutter {
    source = "../.."
}