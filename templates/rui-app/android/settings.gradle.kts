// __APP_NAME__: the app, plus RUI's `rui` library (RuiActivity) and Druid's
// `druid` library (Android services for Nim), taken from their checkouts.
pluginManagement {
    repositories { google(); mavenCentral(); gradlePluginPortal() }
}
dependencyResolutionManagement {
    repositories { google(); mavenCentral() }
}
rootProject.name = "__APP_ID__"

// Where RUI and Druid are: gradle.properties (rui.dir, druid.dir), or RUI_DIR / DRUID_DIR.
fun dir(prop: String, env: String): File {
    val p = providers.gradleProperty(prop).orNull ?: System.getenv(env)
        ?: error("set $prop in gradle.properties or $env")
    return file(p)
}
include(":app")
include(":rui")
project(":rui").projectDir = dir("rui.dir", "RUI_DIR").resolve("mobile/android/rui")
include(":druid")
project(":druid").projectDir = dir("druid.dir", "DRUID_DIR").resolve("android/druid")
