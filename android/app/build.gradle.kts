plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.appsoleum"
    compileSdk = 36
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = org.gradle.api.JavaVersion.VERSION_17 // Java target is 17
        targetCompatibility = org.gradle.api.JavaVersion.VERSION_17
    }

    kotlinOptions {
    // 🚀 Change the Kotlin JVM target to 17 to match the Java target
    jvmTarget = org.gradle.api.JavaVersion.VERSION_17.toString()
    }
    
    // ❌ REMOVE THE DEPENDENCIES BLOCK FROM HERE ❌
    
    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.appsoleum"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        getByName("release") {
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
            signingConfig = signingConfigs.getByName("debug") // or "release" if you have one
        }
    }
} // ⬅️ The 'android' block ends here

// ✅ PLACE THE DEPENDENCIES BLOCK HERE (at the top level) ✅
dependencies {
    // This line ensures the OkHttp library, required by the uCrop library 
    // (used by a Flutter image cropping package), is available during the R8 process.
    // Use parentheses for idiomatic Kotlin script:
    implementation("com.squareup.okhttp3:okhttp:4.11.0") 
    // You can also use single quotes without parentheses:
    // implementation 'com.squareup.okhttp3:okhttp:4.11.0' 
}


flutter {
    source = "../.."
}