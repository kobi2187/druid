package dev.druid;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;
import static org.robolectric.Shadows.shadowOf;

import android.Manifest;
import android.app.Activity;
import android.app.Application;
import android.app.NativeActivity;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.Looper;
import androidx.test.core.app.ApplicationProvider;
import java.util.concurrent.atomic.AtomicReference;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowActivity;

/** The Java side's own mechanics, without the Nim library. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36)
public class BridgeTest {
    private Application app;

    @Before public void setUp() {
        app = ApplicationProvider.getApplicationContext();
        Druid.init(app);
        Druid.pollEvents();
    }

    @Test public void eventsAreKindThenFieldsJoinedByUnitSeparator() {
        Druid.post("x", 1, "two", null, 2.5f);
        assertArrayEquals(new String[] { "x\u001f1\u001ftwo\u001f\u001f2.5" }, Druid.pollEvents());
        assertEquals(0, Druid.pollEvents().length);
        assertEquals(0, Druid.pendingEvents());
    }

    @Test public void theQueueKeepsTheNewestWhenNobodyPolls() {
        for (int k = 0; k < Druid.MAX_QUEUED + 10; k++) Druid.post("n", k);
        String[] all = Druid.pollEvents();
        assertEquals(Druid.MAX_QUEUED, all.length);
        assertEquals("n\u001f10", all[0]);
        assertEquals("n\u001f" + (Druid.MAX_QUEUED + 9), all[all.length - 1]);
    }

    @Test public void initNeedsAContext() {
        try {
            Druid.init(null);
            fail();
        } catch (IllegalArgumentException expected) {}
    }

    @Test public void classesAreFoundByDruidsLoader() throws Exception {
        assertSame(Clipboard.class, Druid.cls("Clipboard"));
        try {
            Druid.cls("Nope");
            fail();
        } catch (ClassNotFoundException expected) {}
    }

    @Test public void onMainRunsOnTheMainThreadAndWaits() throws Throwable {
        AtomicReference<Object> got = new AtomicReference<>();
        Thread t = new Thread(() -> {
            try {
                got.set(Druid.onMain(() -> Looper.myLooper() == Looper.getMainLooper()));
            } catch (Throwable e) {
                got.set(e);
            }
        });
        t.start();
        // The worker waits for the main thread; run the main looper until it is done.
        for (int k = 0; k < 200 && t.isAlive(); k++) {
            shadowOf(Looper.getMainLooper()).idle();
            t.join(10);
        }
        if (got.get() instanceof Throwable) throw (Throwable) got.get();
        assertEquals(Boolean.TRUE, got.get());
    }

    @Test public void theActivityIsForgottenWhenDestroyed() {
        ActivityController<Activity> c = Robolectric.buildActivity(Activity.class).setup();
        assertSame(c.get(), Druid.activity());
        c.pause().stop().destroy();
        assertNull(Druid.activity());
    }

    @Test public void aNativeActivityCanHostPermissionRequests() {
        // Like RUI's RuiActivity: attached, never created here (its native code cannot load).
        NativeActivity host = Robolectric.buildActivity(NativeActivity.class).get();
        Druid.init(host);
        assertSame(host, Druid.activity());
        shadowOf(app).denyPermissions(Manifest.permission.RECORD_AUDIO);
        Permissions.request(new String[] { Manifest.permission.RECORD_AUDIO }, 3);
        Intent asked = shadowOf(host).getNextStartedActivity();
        assertEquals(DruidPermissionActivity.class.getName(), asked.getComponent().getClassName());
        assertEquals(3, asked.getIntExtra(DruidPermissionActivity.EXTRA_REQUEST_ID, -1));
    }

    @Test public void thePermissionActivityLeavesTheAppsActivityCurrent() {
        ActivityController<Activity> host = Robolectric.buildActivity(Activity.class).setup();
        Druid.pollEvents();
        Intent i = new Intent(app, DruidPermissionActivity.class)
            .putExtra(DruidPermissionActivity.EXTRA_PERMISSIONS, new String[] { Manifest.permission.CAMERA })
            .putExtra(DruidPermissionActivity.EXTRA_REQUEST_ID, 6);
        host.pause();
        ActivityController<DruidPermissionActivity> p = Robolectric.buildActivity(DruidPermissionActivity.class, i).setup();
        assertSame(host.get(), Druid.activity());
        ShadowActivity.PermissionsRequest req = shadowOf(p.get()).getLastRequestedPermission();
        p.get().onRequestPermissionsResult(req.requestCode, req.requestedPermissions, new int[] { -1 });
        p.pause().stop().destroy();
        host.resume();
        assertSame(host.get(), Druid.activity());
        assertArrayEquals(new String[] {
            "lifecycle\u001fpaused\u001fandroid.app.Activity",
            "permission\u001f6\u001fandroid.permission.CAMERA\u001f0",
            "lifecycle\u001fresumed\u001fandroid.app.Activity" }, Druid.pollEvents());
    }

    @Test public void anInterruptedRequestIsDenied() {
        Intent i = new Intent(app, DruidPermissionActivity.class)
            .putExtra(DruidPermissionActivity.EXTRA_PERMISSIONS, new String[] { Manifest.permission.CAMERA })
            .putExtra(DruidPermissionActivity.EXTRA_REQUEST_ID, 9);
        ActivityController<DruidPermissionActivity> c = Robolectric.buildActivity(DruidPermissionActivity.class, i).setup();
        ShadowActivity.PermissionsRequest req = shadowOf(c.get()).getLastRequestedPermission();
        c.get().onRequestPermissionsResult(req.requestCode, new String[0], new int[0]);
        assertArrayEquals(new String[] { "permission\u001f9\u001fandroid.permission.CAMERA\u001f0" }, Druid.pollEvents());
        assertTrue(c.get().isFinishing());
    }

    @Test public void aRecreatedPermissionActivityDoesNotAskTwice() {
        Intent i = new Intent(app, DruidPermissionActivity.class)
            .putExtra(DruidPermissionActivity.EXTRA_PERMISSIONS, new String[] { Manifest.permission.CAMERA })
            .putExtra(DruidPermissionActivity.EXTRA_REQUEST_ID, 4);
        ActivityController<DruidPermissionActivity> c = Robolectric.buildActivity(DruidPermissionActivity.class, i)
            .create(new Bundle()).start().resume();
        assertNull(shadowOf(c.get()).getLastRequestedPermission());
        assertEquals(0, Druid.pollEvents().length);
    }

    @Test public void anEmptyRequestIsAnsweredAtOnce() {
        Intent i = new Intent(app, DruidPermissionActivity.class).putExtra(DruidPermissionActivity.EXTRA_REQUEST_ID, 2);
        ActivityController<DruidPermissionActivity> c = Robolectric.buildActivity(DruidPermissionActivity.class, i).setup();
        assertArrayEquals(new String[] { "permission\u001f2" }, Druid.pollEvents());
        assertTrue(c.get().isFinishing());
    }

    @Test public void grantedPermissionsNeedNoActivity() {
        shadowOf(app).grantPermissions(Manifest.permission.CAMERA);
        Permissions.request(new String[] { Manifest.permission.CAMERA }, 1);
        assertNull(shadowOf(app).getNextStartedActivity());
        assertArrayEquals(new String[] { "permission\u001f1\u001fandroid.permission.CAMERA\u001f1" }, Druid.pollEvents());
    }

    @Test public void deviceFacts() {
        assertEquals(36, Druid.apiLevel());
        assertTrue(Druid.supportedAbis().length > 0);
        assertTrue(Druid.isInitialized());
        assertSame(app, Druid.context());
        assertEquals(PackageManager.PERMISSION_GRANTED, 0);
    }
}
