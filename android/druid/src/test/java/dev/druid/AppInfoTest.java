package dev.druid;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import org.junit.Test;

public class AppInfoTest extends DruidTestBase {
    @Test public void packageFacts() throws Exception {
        assertEquals(app.getPackageName(), AppInfo.packageName());
        PackageInfo pi = app.getPackageManager().getPackageInfo(app.getPackageName(), 0);
        assertEquals(pi.versionName == null ? "" : pi.versionName, AppInfo.versionName());
        @SuppressWarnings("deprecation") long code = api() >= 28 ? pi.getLongVersionCode() : pi.versionCode;
        assertEquals(code, AppInfo.versionCode());
        assertEquals(pi.firstInstallTime, AppInfo.firstInstallTime());
        assertEquals(pi.lastUpdateTime, AppInfo.lastUpdateTime());
        assertEquals(app.getApplicationInfo().targetSdkVersion, AppInfo.targetSdk());
        assertNotNull(AppInfo.label());
    }

    @Test public void debuggableFollowsTheFlag() {
        app.getApplicationInfo().flags |= ApplicationInfo.FLAG_DEBUGGABLE;
        assertTrue(AppInfo.isDebuggable());
        app.getApplicationInfo().flags &= ~ApplicationInfo.FLAG_DEBUGGABLE;
        assertFalse(AppInfo.isDebuggable());
    }

    @Test public void systemFeatures() {
        shadowOf(app.getPackageManager()).setSystemFeature("android.hardware.camera.any", true);
        shadowOf(app.getPackageManager()).setSystemFeature("android.hardware.nfc", false);
        assertTrue(AppInfo.hasSystemFeature("android.hardware.camera.any"));
        assertFalse(AppInfo.hasSystemFeature("android.hardware.nfc"));
    }

    @Test public void otherPackages() {
        PackageInfo other = new PackageInfo();
        other.packageName = "com.other.app";
        shadowOf(app.getPackageManager()).installPackage(other);
        assertTrue(AppInfo.isInstalled("com.other.app"));
        assertFalse(AppInfo.isInstalled("com.not.there"));
    }

    @Test public void declaredPermissionsIsNeverNull() throws Exception {
        assertNotNull(AppInfo.requestedPermissions());
    }
}
