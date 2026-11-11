package dev.druid;

import android.app.Activity;
import android.app.Application;
import android.content.ComponentCallbacks2;
import android.content.Context;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Locale;
import java.util.TimeZone;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * The entry point of Druid's Java side: the Context every service uses, the
 * queue of events the Nim side drains, and device facts.
 *
 * <p>Everything here is called from native code (src/druid/bridge.nim) by name,
 * with simple argument types. Android's callbacks (permission results, location
 * fixes, sensor readings, ...) do not call into Nim; they {@link #post} an event,
 * which Nim reads with {@link #pollEvents} once per frame.
 */
public final class Druid {
    private Druid() {}

    /** Separates an event's fields. Nothing a service reports contains it. */
    public static final char SEP = '\u001f';
    /** Events kept while nobody polls; the oldest are dropped beyond this. */
    public static final int MAX_QUEUED = 4096;

    private static volatile Context app;
    private static volatile WeakReference<Activity> current = new WeakReference<>(null);
    private static volatile String lastLifecycle = "";
    private static Application registeredOn;   // the Application our callbacks are on
    private static final ConcurrentLinkedQueue<String> events = new ConcurrentLinkedQueue<>();
    private static final AtomicInteger queued = new AtomicInteger();

    /**
     * Start Druid with any Context (an Activity, the Application, a Service).
     * Idempotent; a later call with an Activity makes it the current one.
     */
    public static synchronized void init(Context ctx) {
        if (ctx == null) throw new IllegalArgumentException("Druid.init: null Context");
        Context appCtx = ctx.getApplicationContext();
        Context newApp = appCtx != null ? appCtx : ctx;
        if (app != null && app != newApp) {
            // Another Application: the old one's Activity is not ours any more.
            current = new WeakReference<>(null);
            lastLifecycle = "";
        }
        app = newApp;
        if (ctx instanceof Activity && !(ctx instanceof DruidPermissionActivity)) {
            current = new WeakReference<>((Activity) ctx);
        }
        if (app instanceof Application && registeredOn != app) {
            Application a = (Application) app;
            a.registerActivityLifecycleCallbacks(new Lifecycle());
            a.registerComponentCallbacks(new Trim());
            registeredOn = a;
        }
    }

    public static boolean isInitialized() { return app != null; }

    /** The application Context. */
    public static Context context() {
        Context c = app;
        if (c == null) throw new IllegalStateException("Druid not initialized: call Druid.init(context)");
        return c;
    }

    /** The Activity in front, or the one Druid was started with; null if none. */
    public static Activity activity() {
        Activity a = current.get();
        return a == null || a.isFinishing() || a.isDestroyed() ? null : a;
    }

    /** What last happened to an Activity: "created", "resumed", "paused", ... */
    public static String lifecycleState() { return lastLifecycle; }

    /** A Druid class by simple name, from the loader that loaded Druid (JNI's FindClass cannot see app classes from a native thread). */
    public static Class<?> cls(String simpleName) throws ClassNotFoundException {
        return Class.forName("dev.druid." + simpleName, true, Druid.class.getClassLoader());
    }

    // ---- events ----

    /** Queue an event: its kind, then its fields, joined by {@link #SEP}. */
    public static void post(String kind, Object... fields) {
        StringBuilder b = new StringBuilder(kind);
        for (Object f : fields) b.append(SEP).append(f == null ? "" : String.valueOf(f));
        events.add(b.toString());
        if (queued.incrementAndGet() > MAX_QUEUED && events.poll() != null) queued.decrementAndGet();
        nativeWake();
    }

    /** Every queued event, oldest first, and empties the queue. */
    public static String[] pollEvents() {
        ArrayList<String> out = new ArrayList<>();
        for (String e; (e = events.poll()) != null; ) {
            queued.decrementAndGet();
            out.add(e);
        }
        return out.toArray(new String[0]);
    }

    public static int pendingEvents() { return Math.max(0, queued.get()); }

    // The Nim side registers this (RegisterNatives) to wake its loop when an
    // event arrives. Until it does, calling it would throw; so ask first.
    private static volatile boolean wakeRegistered;
    public static void setWakeRegistered(boolean on) { wakeRegistered = on; }
    private static native void wake();
    private static void nativeWake() {
        if (!wakeRegistered) return;
        try { wake(); } catch (UnsatisfiedLinkError e) { wakeRegistered = false; }
    }

    // ---- threads ----

    /** Runs {@code task} on the main thread and waits for it (at most 5 s). Directly, if already there. */
    static <T> T onMain(Callable<T> task) throws Exception {
        if (Looper.myLooper() == Looper.getMainLooper()) return task.call();
        FutureTask<T> f = new FutureTask<>(task);
        new Handler(Looper.getMainLooper()).post(f);
        return f.get(5, TimeUnit.SECONDS);
    }

    static void onMain(Runnable task) throws Exception {
        onMain(() -> { task.run(); return null; });
    }

    // ---- device ----

    public static int apiLevel() { return Build.VERSION.SDK_INT; }
    public static String release() { return Build.VERSION.RELEASE; }
    public static String manufacturer() { return Build.MANUFACTURER; }
    public static String brand() { return Build.BRAND; }
    public static String model() { return Build.MODEL; }
    public static String device() { return Build.DEVICE; }
    public static String[] supportedAbis() { return Build.SUPPORTED_ABIS; }
    public static String locale() { return Locale.getDefault().toLanguageTag(); }
    public static String timeZone() { return TimeZone.getDefault().getID(); }
    public static boolean isNightMode() {
        int mode = context().getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        return mode == Configuration.UI_MODE_NIGHT_YES;
    }
    public static boolean isEmulator() {
        return Build.FINGERPRINT.startsWith("generic") || Build.FINGERPRINT.contains("emulator")
            || Build.MODEL.contains("Emulator") || Build.MODEL.contains("Android SDK built for")
            || Build.HARDWARE.contains("ranchu") || Build.HARDWARE.contains("goldfish");
    }

    // ---- callbacks that become events ----

    /** The app's Activities, not Druid's own DruidPermissionActivity (plumbing the app never sees). */
    private static final class Lifecycle implements Application.ActivityLifecycleCallbacks {
        private static boolean ours(Activity a) { return a instanceof DruidPermissionActivity; }
        private void note(Activity a, String what) {
            if (ours(a)) return;
            lastLifecycle = what;
            post("lifecycle", what, a.getClass().getName());
        }
        private void makeCurrent(Activity a) { if (!ours(a)) current = new WeakReference<>(a); }
        @Override public void onActivityCreated(Activity a, Bundle b) { makeCurrent(a); note(a, "created"); }
        @Override public void onActivityStarted(Activity a) { note(a, "started"); }
        @Override public void onActivityResumed(Activity a) { makeCurrent(a); note(a, "resumed"); }
        @Override public void onActivityPaused(Activity a) { note(a, "paused"); }
        @Override public void onActivityStopped(Activity a) { note(a, "stopped"); }
        @Override public void onActivitySaveInstanceState(Activity a, Bundle b) {}
        @Override public void onActivityDestroyed(Activity a) {
            if (current.get() == a) current = new WeakReference<>(null);
            note(a, "destroyed");
        }
    }

    private static final class Trim implements ComponentCallbacks2 {
        @Override public void onTrimMemory(int level) { post("memory", level); }
        @Override public void onConfigurationChanged(Configuration c) {
            post("configuration", c.orientation, c.uiMode & Configuration.UI_MODE_NIGHT_MASK, c.fontScale);
        }
        @Override public void onLowMemory() { post("memory", 80); }
    }
}
