plugins {
    // The same versions as RUI's mobile/android, so both builds share a cache
    // and the `druid` and `rui` libraries can sit in one host project.
    id("com.android.application") version "9.1.0" apply false
    id("com.android.library") version "9.1.0" apply false
}
