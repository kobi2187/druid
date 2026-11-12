package dev.druid.sample;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assume.assumeTrue;
import static org.robolectric.Shadows.shadowOf;

import android.Manifest;
import android.app.Application;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import androidx.test.core.app.ApplicationProvider;
import dev.druid.DruidPermissionActivity;
import java.io.File;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.shadows.ShadowActivity;

/**
 * The sample as an app developer would ship it: the merged manifest carries
 * Druid's Activity, and the Activity's Nim library (built for the host) runs.
 */
@RunWith(RobolectricTestRunner.class)
public class MainActivityTest {
    @Before public void needsHostLibrary() {
        boolean built = false;
        for (String dir : System.getProperty("java.library.path").split(File.pathSeparator)) {
            built |= new File(dir, "libdruidsample.so").isFile();
        }
        if (Boolean.parseBoolean(System.getProperty("druid.requireHarness"))) assertTrue("run tools/build_host_harness.sh", built);
        assumeTrue("libdruidsample.so not built for the host", built);
    }

    @Test public void mergedManifestDeclaresDruidPermissionActivity() throws Exception {
        Application app = ApplicationProvider.getApplicationContext();
        ActivityInfo info = app.getPackageManager().getActivityInfo(
            new android.content.ComponentName(app, DruidPermissionActivity.class), 0);
        assertEquals(DruidPermissionActivity.class.getName(), info.name);
        String[] perms = app.getPackageManager().getPackageInfo(app.getPackageName(), PackageManager.GET_PERMISSIONS).requestedPermissions;
        assertTrue(java.util.Arrays.asList(perms).contains(Manifest.permission.VIBRATE));  // from the druid library
        assertTrue(java.util.Arrays.asList(perms).contains(Manifest.permission.CAMERA));   // from the app
    }

    @Test public void reportComesFromNim() {
        MainActivity a = Robolectric.buildActivity(MainActivity.class).setup().get();
        String r = a.report.getText().toString();
        assertTrue(r, r.startsWith("Druid 1.0.0\nAndroid "));
        assertTrue(r, r.contains("(API 36)"));
        assertTrue(r, r.contains("App dev.druid.sample 1.0"));
        assertTrue(r, r.contains("Camera permission not granted"));
    }

    @Test public void cameraButtonAsksThroughDruid() {
        Application app = ApplicationProvider.getApplicationContext();
        shadowOf(app).denyPermissions(Manifest.permission.CAMERA);
        ActivityController<MainActivity> c = Robolectric.buildActivity(MainActivity.class).setup();
        MainActivity a = c.get();
        a.nativePoll();                                   // drop the startup events
        ((android.view.ViewGroup) a.report.getParent()).getChildAt(1).performClick();

        Intent asked = shadowOf(a).getNextStartedActivity();
        assertEquals(DruidPermissionActivity.class.getName(), asked.getComponent().getClassName());
        ActivityController<DruidPermissionActivity> p = Robolectric.buildActivity(DruidPermissionActivity.class, asked).setup();
        ShadowActivity.PermissionsRequest req = shadowOf(p.get()).getLastRequestedPermission();
        shadowOf(app).grantPermissions(Manifest.permission.CAMERA);
        p.get().onRequestPermissionsResult(req.requestCode, req.requestedPermissions,
            new int[] { PackageManager.PERMISSION_GRANTED });

        a.refresh();
        assertTrue(a.log.getText().toString(), a.log.getText().toString().contains("camera: psGranted"));
        assertTrue(a.report.getText().toString().contains("Camera permission granted"));
    }
}
