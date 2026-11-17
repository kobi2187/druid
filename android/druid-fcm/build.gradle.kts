// Optional: push messages with Firebase Cloud Messaging, for Druid's `push()`.
// Adding this library brings Firebase into the app; the app also needs its
// google-services.json (the Google Services Gradle plugin) or FirebaseOptions
// of its own. Without it, `push().isAvailable` is false and nothing else changes.
plugins {
    id("com.android.library")
}

android {
    namespace = "dev.druid.fcm"
    compileSdk = 36
    defaultConfig {
        minSdk = 24
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    testOptions {
        unitTests.isIncludeAndroidResources = true
    }
}

dependencies {
    api(project(":druid"))
    implementation("com.google.firebase:firebase-messaging:25.1.3")
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.robolectric:robolectric:4.17")
    testImplementation("androidx.test:core:1.7.0")
}

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
    testLogging {
        events("passed", "skipped", "failed")
        exceptionFormat = org.gradle.api.tasks.testing.logging.TestExceptionFormat.FULL
    }
}
