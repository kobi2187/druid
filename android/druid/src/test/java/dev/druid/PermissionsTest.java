package dev.druid;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.Manifest;
import android.app.Activity;
import android.provider.Settings;
import org.junit.Test;
import org.robolectric.Robolectric;
import org.robolectric.android.controller.ActivityController;

public class PermissionsTest extends DruidTestBase {
    @Test public void check() {
        shadowOf(app).grantPermissions(Manifest.permission.CAMERA);
        shadowOf(app).denyPermissions(Manifest.permission.RECORD_AUDIO);
        assertTrue(Permissions.check(Manifest.permission.CAMERA));
        assertFalse(Permissions.check(Manifest.permission.RECORD_AUDIO));
    }

    @Test public void rationaleNeedsAnActivity() {
        assertFalse(Permissions.shouldShowRationale(Manifest.permission.CAMERA));
        Activity a = Robolectric.buildActivity(Activity.class).setup().get();
        Druid.init(a);
        shadowOf(app.getPackageManager()).setShouldShowRequestPermissionRationale(Manifest.permission.CAMERA, true);
        assertTrue(Permissions.shouldShowRationale(Manifest.permission.CAMERA));
    }

    @Test public void openSettingsShowsThisAppsPage() {
        Activity a = Robolectric.buildActivity(Activity.class).setup().get();
        Druid.init(a);
        Permissions.openSettings();
        assertEquals(Settings.ACTION_APPLICATION_DETAILS_SETTINGS, shadowOf(a).getNextStartedActivity().getAction());
    }

    @Test public void mixedRequestStillAsksForAll() {
        shadowOf(app).grantPermissions(Manifest.permission.CAMERA);
        shadowOf(app).denyPermissions(Manifest.permission.RECORD_AUDIO);
        Permissions.request(new String[] { Manifest.permission.CAMERA, Manifest.permission.RECORD_AUDIO }, 2);
        assertEquals(DruidPermissionActivity.class.getName(),
                     shadowOf(app).getNextStartedActivity().getComponent().getClassName());
    }

    @Test public void activityStateIsSavedWithoutAnEvent() {
        ActivityController<Activity> c = Robolectric.buildActivity(Activity.class).setup();
        Druid.pollEvents();
        c.saveInstanceState(new android.os.Bundle());
        assertEquals(0, Druid.pollEvents().length);
    }
}
