// Druid on Android: the `druid` library (the Java side of every service the Nim
// API offers, plus DruidPermissionActivity) and `sample`, a plain app that
// packages a Nim library built with the NDK and calls into it.
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
