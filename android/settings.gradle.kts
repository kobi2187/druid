// Druid on Android: the `druid` library (the Java side of every service the Nim
// API offers, plus DruidPermissionActivity); `sample`, a plain app that
// packages a Nim library built with the NDK and calls into it; and, when an
// RUI checkout is found, `rui-demo`: an RUI app (RUI's `rui` library and
// RuiActivity) that uses Druid.
pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositories {
        google()
        mavenCentral()
    }
}
rootProject.name = "druid-android"
include(":druid", ":sample")

// RUI: -Prui.dir=/path/to/rui2, or RUI_DIR, or a checkout next to this repository.
val ruiDir = providers.gradleProperty("rui.dir").orNull
    ?: System.getenv("RUI_DIR")
    ?: settingsDir.resolve("../../rui2").path
val ruiLibrary = file("$ruiDir/mobile/android/rui")
if (ruiLibrary.resolve("build.gradle.kts").isFile) {
    include(":rui")
    project(":rui").projectDir = ruiLibrary
    include(":rui-demo")
} else {
    logger.info("No RUI checkout at $ruiDir: rui-demo is not built (set -Prui.dir or RUI_DIR)")
}
