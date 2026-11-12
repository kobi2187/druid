package dev.druid;

import static org.junit.Assume.assumeTrue;
import static org.junit.Assert.fail;

import android.content.Context;
import java.io.File;

/**
 * The Nim side of the tests: tests/robolectric/harness.nim, built for the host
 * by tools/build_host_harness.sh and loaded into Robolectric's JVM. Each
 * command runs Nim code that calls Druid through JNI.
 */
final class NimHarness {
    private NimHarness() {}

    private static boolean loaded;

    /** Loads the library once; skips the test when it is not built (fails instead with -Pdruid.requireHarness=true). */
    static synchronized void load() {
        if (loaded) return;
        String path = System.getProperty("druid.harness", "");
        boolean required = Boolean.parseBoolean(System.getProperty("druid.requireHarness", "false"));
        if (path.isEmpty() || !new File(path).isFile()) {
            if (required) fail("Nim harness not built: " + path + " (run tools/build_host_harness.sh)");
            assumeTrue("Nim harness not built: run tools/build_host_harness.sh", false);
        }
        System.load(path);
        loaded = true;
    }

    static native void start(Context context);
    static native void stop();
    static native String run(String command);

    /** Runs "name|arg|arg..." and returns its answer. */
    static String cmd(String name, Object... args) {
        StringBuilder b = new StringBuilder(name);
        for (Object a : args) b.append('|').append(a);
        return run(b.toString());
    }
}
