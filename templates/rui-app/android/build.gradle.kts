plugins {
    id("com.android.application") version "9.1.0" apply false
    id("com.android.library") version "9.1.0" apply false
}

// This app ships its own RUI program (app.nim -> app/src/main/jniLibs/<abi>/libmain.so);
// RUI's library must not add the libmain.so its build_rui.sh may have left in it.
subprojects {
    if (path == ":rui") {
        plugins.withId("com.android.library") {
            extensions.configure<com.android.build.api.dsl.LibraryExtension>("android") {
                sourceSets.getByName("main").jniLibs.setSrcDirs(emptyList<String>())
            }
        }
    }
}
