// A plain Java app using Druid: its Activity calls into a Nim library
// (examples/sample/sample.nim) that tools/build_ndk.sh builds with the NDK
// into src/main/jniLibs/<abi>/libdruidsample.so.
plugins {
    id("com.android.application")
}

android {
    namespace = "dev.druid.sample"
    compileSdk = 36
    defaultConfig {
        applicationId = "dev.druid.sample"
        minSdk = 24
        targetSdk = 36
        versionCode = 1
        versionName = "1.0"
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    testOptions {
        unitTests.isIncludeAndroidResources = true   // Robolectric sees the merged manifest
    }
}

dependencies {
    implementation(project(":druid"))
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
// The sample's Nim library built for the host (tools/build_host_harness.sh),
// found by System.loadLibrary through java.library.path.
val hostLibs = rootProject.layout.projectDirectory.dir("../build/host").asFile
tasks.withType<Test>().configureEach {
    dependsOn(robolectricJars)
    jvmArgs("--add-opens=java.base/java.io=ALL-UNNAMED",
            "--add-exports=java.base/jdk.internal.access=ALL-UNNAMED")
    systemProperty("robolectric.offline", "true")
    systemProperty("robolectric.dependency.dir",
                   layout.buildDirectory.dir("robolectric-jars").get().asFile.absolutePath)
    systemProperty("java.library.path", hostLibs.absolutePath)
    systemProperty("druid.requireHarness",
                   (project.findProperty("druid.requireHarness") ?: "false").toString())
    testLogging {
        events("passed", "skipped", "failed")
        exceptionFormat = org.gradle.api.tasks.testing.logging.TestExceptionFormat.FULL
    }
}
