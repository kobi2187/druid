package dev.druid;

import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;

/** This app's package: its name, version and install facts, and what the device offers. */
public final class AppInfo {
    private AppInfo() {}

    private static PackageInfo info() throws PackageManager.NameNotFoundException {
        return Druid.context().getPackageManager().getPackageInfo(packageName(), 0);
    }

    public static String packageName() { return Druid.context().getPackageName(); }

    public static String versionName() throws Exception {
        String v = info().versionName;
        return v == null ? "" : v;
    }

    @SuppressWarnings("deprecation")
    public static long versionCode() throws Exception {
        PackageInfo p = info();
        return Build.VERSION.SDK_INT >= 28 ? p.getLongVersionCode() : p.versionCode;
    }

    public static long firstInstallTime() throws Exception { return info().firstInstallTime; }
    public static long lastUpdateTime() throws Exception { return info().lastUpdateTime; }

    public static int targetSdk() { return Druid.context().getApplicationInfo().targetSdkVersion; }

    public static String label() {
        ApplicationInfo ai = Druid.context().getApplicationInfo();
        CharSequence l = Druid.context().getPackageManager().getApplicationLabel(ai);
        return l == null ? "" : l.toString();
    }

    public static boolean isDebuggable() {
        return (Druid.context().getApplicationInfo().flags & ApplicationInfo.FLAG_DEBUGGABLE) != 0;
    }

    public static boolean hasSystemFeature(String feature) {
        return Druid.context().getPackageManager().hasSystemFeature(feature);
    }

    public static boolean isInstalled(String pkg) {
        try {
            Druid.context().getPackageManager().getPackageInfo(pkg, 0);
            return true;
        } catch (PackageManager.NameNotFoundException e) {
            return false;
        }
    }

    /** Permissions this app declares in its manifest. */
    public static String[] requestedPermissions() throws Exception {
        PackageInfo p = Druid.context().getPackageManager()
            .getPackageInfo(packageName(), PackageManager.GET_PERMISSIONS);
        return p.requestedPermissions == null ? new String[0] : p.requestedPermissions;
    }
}
