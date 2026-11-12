plugins {
    // The same versions as RUI's mobile/android, so both builds share a cache
    // and the `druid` and `rui` libraries can sit in one host project.
    id("com.android.application") version "9.1.0" apply false
    id("com.android.library") version "9.1.0" apply false
}

// RUI's `rui` library may carry the libmain.so of RUI's own mockups (its
// build_rui.sh puts it there). Here the app ships its own RUI program, so the
// library contributes no native code.
subprojects {
    if (path == ":rui") {
        plugins.withId("com.android.library") {
            extensions.configure<com.android.build.api.dsl.LibraryExtension>("android") {
                sourceSets.getByName("main").jniLibs.setSrcDirs(emptyList<String>())
            }
        }
    }
}
