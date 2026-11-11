package dev.druid.ruidemo;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.Manifest;
import android.app.Application;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import androidx.test.core.app.ApplicationProvider;
import dev.druid.Druid;
import dev.druid.DruidPermissionActivity;
import dev.druid.Permissions;
import dev.rui.android.RuiActivity;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.shadows.ShadowActivity;

/**
 * RUI and Druid in one app. Robolectric runs no native code, so RUI's
 * libmain.so does not start here; what is checked is the Java seam between
 * them: the merged manifest, and Druid working with RUI's NativeActivity as
 * its Activity -- which is what druid/ruiapp.nim's startDruidForRui gives it.
 */
@RunWith(RobolectricTestRunner.class)
public class RuiDruidTest {
    private final Application app = ApplicationProvider.getApplicationContext();

    @Test public void launcherOpensRuiActivityWhichRunsLibmain() throws Exception {
        Intent main = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER).setPackage(app.getPackageName());
        List<ResolveInfo> found = app.getPackageManager().queryIntentActivities(main, 0);
        assertEquals(1, found.size());
        ActivityInfo rui = app.getPackageManager().getActivityInfo(
            new ComponentName(app, RuiActivity.class), PackageManager.GET_META_DATA);
        assertEquals("main", rui.metaData.getString("android.app.lib_name"));
    }

    @Test public void mergedManifestHasBothLibraries() throws Exception {
        assertNotNull(app.getPackageManager().getActivityInfo(new ComponentName(app, DruidPermissionActivity.class), 0));
        String[] perms = app.getPackageManager().getPackageInfo(app.getPackageName(), PackageManager.GET_PERMISSIONS).requestedPermissions;
        assertTrue(java.util.Arrays.asList(perms).contains(Manifest.permission.CAMERA));
        assertTrue(java.util.Arrays.asList(perms).contains(Manifest.permission.VIBRATE));
    }

    @Test public void druidAsksForPermissionsOverRuiActivity() {
        // RuiActivity is a NativeActivity: it cannot receive onRequestPermissionsResult,
        // so Druid shows DruidPermissionActivity over it and reports the answer as an event.
        ActivityController<RuiActivity> c = Robolectric.buildActivity(RuiActivity.class,
            RuiActivity.intent(app, "demo"));
        RuiActivity rui = c.get();             // attached, not created: its native code cannot load here
        Druid.init(rui);
        assertSame(rui, Druid.activity());
        Druid.pollEvents();

        shadowOf(app).denyPermissions(Manifest.permission.CAMERA);
        Permissions.request(new String[] { Manifest.permission.CAMERA }, 5);
        Intent asked = shadowOf(rui).getNextStartedActivity();
        assertEquals(DruidPermissionActivity.class.getName(), asked.getComponent().getClassName());

        ActivityController<DruidPermissionActivity> p = Robolectric.buildActivity(DruidPermissionActivity.class, asked).setup();
        ShadowActivity.PermissionsRequest req = shadowOf(p.get()).getLastRequestedPermission();
        shadowOf(app).grantPermissions(Manifest.permission.CAMERA);
        p.get().onRequestPermissionsResult(req.requestCode, req.requestedPermissions,
            new int[] { PackageManager.PERMISSION_GRANTED });

        String[] events = Druid.pollEvents();
        boolean answered = false;
        for (String e : events) answered |= e.equals("permission\u001f5\u001fandroid.permission.CAMERA\u001f1");
        assertTrue(java.util.Arrays.toString(events), answered);
    }
}
