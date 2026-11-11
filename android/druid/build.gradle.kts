// The Java side of Druid: one small class per Android service, called from Nim
// through JNI (src/druid/bridge.nim), and DruidPermissionActivity, which asks
// for runtime permissions on behalf of any Activity -- a NativeActivity such as
// RUI's RuiActivity included. Java, not Kotlin, so it builds unchanged inside
// any host project.
plugins {
    id("com.android.library")
}

android {
    namespace = "dev.druid"
    compileSdk = 36
    defaultConfig {
        minSdk = 24
        consumerProguardFiles("consumer-rules.pro")
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
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.robolectric:robolectric:4.17")
    testImplementation("androidx.test:core:1.7.0")
}

// Robolectric would download its Android framework jar itself, at test time,
// outside Gradle's cache. Fetch it as a dependency and run offline against it
// (the version Robolectric 4.17 wants for SDK 36).
val robolectricRuntime: Configuration by configurations.creating { isTransitive = false }
dependencies {
    robolectricRuntime("org.robolectric:android-all-instrumented:16-robolectric-13921718-i7")
}
val robolectricJars = tasks.register<Copy>("robolectricJars") {
    from(robolectricRuntime)
    into(layout.buildDirectory.dir("robolectric-jars"))
}

// The Nim side runs inside the Robolectric JVM too: ../tools/build_host_harness.sh
// compiles tests/robolectric/harness.nim for the host into this library, and
// NimHarnessTest loads it. Pass -Pdruid.requireHarness=true (tools/test_all.sh
// does) to fail rather than skip when it has not been built.
val harnessLib = rootProject.layout.projectDirectory.file("../build/host/libdruid_harness.so").asFile
tasks.withType<Test>().configureEach {
    dependsOn(robolectricJars)
    jvmArgs("--add-opens=java.base/java.io=ALL-UNNAMED",
            "--add-exports=java.base/jdk.internal.access=ALL-UNNAMED")
    systemProperty("robolectric.offline", "true")
    systemProperty("robolectric.dependency.dir",
                   layout.buildDirectory.dir("robolectric-jars").get().asFile.absolutePath)
    systemProperty("druid.harness", harnessLib.absolutePath)
    systemProperty("druid.requireHarness",
                   (project.findProperty("druid.requireHarness") ?: "false").toString())
    inputs.files(harnessLib).optional()
    testLogging {
        events("passed", "skipped", "failed")
        exceptionFormat = org.gradle.api.tasks.testing.logging.TestExceptionFormat.FULL
    }
}
