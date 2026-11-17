package dev.druid;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;
import static org.robolectric.Shadows.shadowOf;

import android.app.Notification;
import android.app.NotificationManager;
import android.content.Context;
import android.content.Intent;
import org.junit.After;
import org.junit.Test;
import org.robolectric.Robolectric;
import org.robolectric.android.controller.ServiceController;

public class ForegroundTest extends DruidTestBase {
    @After public void reset() { Foreground.running = false; }

    private ServiceController<DruidForegroundService> run() {
        Intent started = shadowOf(app).getNextStartedService();
        assertNotNull(started);
        return Robolectric.buildService(DruidForegroundService.class, started).create().startCommand(0, 1);
    }

    @Test public void startShowsTheNotificationAndIsAnEvent() {
        Foreground.start("Tracking", "0 km", "", 8);
        ServiceController<DruidForegroundService> c = run();
        assertTrue(Foreground.isRunning());
        Notification n = shadowOf(c.get()).getLastForegroundNotification();
        assertEquals("Tracking", n.extras.getString(Notification.EXTRA_TITLE));
        assertEquals(Foreground.NOTIFICATION_ID, shadowOf(c.get()).getLastForegroundNotificationId());
        assertTrue((n.flags & Notification.FLAG_ONGOING_EVENT) != 0);
        assertArrayEquals(new String[] { "foreground", "started", "" }, events("foreground").get(0));
        c.startCommand(0, 2);                              // started again: no second event
        assertEquals(0, events("foreground").size());

        Foreground.update("Tracking", "1 km", 30);
        NotificationManager nm = (NotificationManager) app.getSystemService(Context.NOTIFICATION_SERVICE);
        Notification u = shadowOf(nm).getNotification(Foreground.NOTIFICATION_ID);
        assertEquals("1 km", u.extras.getCharSequence(Notification.EXTRA_TEXT).toString());
        assertEquals(30, u.extras.getInt(Notification.EXTRA_PROGRESS));

        Foreground.stop();
        assertNotNull(shadowOf(app).getNextStoppedService());
        c.destroy();
        assertFalse(Foreground.isRunning());
        assertArrayEquals(new String[] { "foreground", "stopped", "" }, events("foreground").get(0));
    }

    @Test public void aRefusalIsAnErrorEvent() {
        Foreground.start("x", "y", "", 0);
        Intent started = shadowOf(app).getNextStartedService();
        ServiceController<DruidForegroundService> c = Robolectric.buildService(DruidForegroundService.class, started).create();
        shadowOf(c.get()).setThrowInStartForeground(new SecurityException("needs FOREGROUND_SERVICE_LOCATION"));
        c.startCommand(0, 1);
        String[] e = events("foreground").get(0);
        assertEquals("error", e[1]);
        assertTrue(e[2].contains("FOREGROUND_SERVICE_LOCATION"));
        assertFalse(Foreground.isRunning());
        assertTrue(shadowOf(c.get()).isStoppedBySelf());
    }

    @Test public void restartedByTheSystemItStops() {
        ServiceController<DruidForegroundService> c = Robolectric.buildService(DruidForegroundService.class).create();
        c.get().onStartCommand(null, 0, 1);
        assertTrue(shadowOf(c.get()).isStoppedBySelf());
        assertEquals(0, events("foreground").size());
    }

    @Test public void updateNeedsItRunning() {
        try {
            Foreground.update("a", "b", -1);
            fail();
        } catch (IllegalStateException expected) {}
    }

    @Test public void theServiceIsDeclared() {
        assertFalse(app.getPackageManager().queryIntentServices(
            new Intent(app, DruidForegroundService.class), 0).isEmpty());
        assertEquals(null, Robolectric.buildService(DruidForegroundService.class).create().get().onBind(null));
    }
}
