package dev.druid;

import android.app.ActivityManager;
import android.content.Context;

/** Memory pressure: the device's, and this app's budget. onTrimMemory arrives as "memory" events. */
public final class Memory {
    private Memory() {}

    private static ActivityManager am() {
        return (ActivityManager) Druid.context().getSystemService(Context.ACTIVITY_SERVICE);
    }

    /** {available bytes, total bytes, low-memory threshold bytes, low memory 1|0}. */
    public static long[] info() {
        ActivityManager.MemoryInfo mi = new ActivityManager.MemoryInfo();
        am().getMemoryInfo(mi);
        return new long[] { mi.availMem, mi.totalMem, mi.threshold, mi.lowMemory ? 1 : 0 };
    }

    /** The heap budget of this app in MB (ActivityManager.getMemoryClass). */
    public static int memoryClass() { return am().getMemoryClass(); }
    public static int largeMemoryClass() { return am().getLargeMemoryClass(); }
    public static boolean isLowRamDevice() { return am().isLowRamDevice(); }

    /** Java heap of this process: {used, max} bytes. */
    public static long[] javaHeap() {
        Runtime r = Runtime.getRuntime();
        return new long[] { r.totalMemory() - r.freeMemory(), r.maxMemory() };
    }
}
