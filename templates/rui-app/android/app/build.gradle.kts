plugins {
    id("com.android.application")      // AGP 9 compiles Kotlin itself
}

android {
    namespace = "__PACKAGE__"
    compileSdk = 36
    defaultConfig {
        applicationId = "__PACKAGE__"
        minSdk = 24
        targetSdk = 36
        versionCode = 1
        versionName = "0.1"
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    testOptions {
        unitTests.isIncludeAndroidResources = true     // Robolectric sees the merged manifest
    }
}

dependencies {
    implementation(project(":rui"))
    implementation(project(":druid"))
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.robolectric:robolectric:4.17")
    testImplementation("androidx.test:core:1.7.0")
}

// Robolectric's Android framework jar as a dependency (cached, offline at test time).
val robolectricRuntime: Configuration by configurations.creating { isTransitive = false }
dependencies {
    robolectricRuntime("org.robolectric:android-all-instrumented:16-robolectric-13921718-i7")
}
val robolectricJars = tasks.register<Copy>("robolectricJars") {
    from(robolectricRuntime)
    into(layout.buildDirectory.dir("robolectric-jars"))
}
tasks.withType<Test>().configureEach {
    dependsOn(robolectricJars)
    jvmArgs("--add-opens=java.base/java.io=ALL-UNNAMED",
            "--add-exports=java.base/jdk.internal.access=ALL-UNNAMED")
    systemProperty("robolectric.offline", "true")
    systemProperty("robolectric.dependency.dir",
                   layout.buildDirectory.dir("robolectric-jars").get().asFile.absolutePath)
}
