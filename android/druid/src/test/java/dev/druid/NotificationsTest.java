package dev.druid;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.app.Notification;
import android.app.NotificationManager;
import android.content.Context;
import org.junit.Test;

public class NotificationsTest extends DruidTestBase {
    private NotificationManager nm() { return (NotificationManager) app.getSystemService(Context.NOTIFICATION_SERVICE); }

    @Test public void channelsBeforeAndroid8AreAlwaysThere() {
        org.junit.Assume.assumeTrue(api() < 26);
        assertTrue(Notifications.hasChannel("anything"));
        Notifications.createChannel("c1", "C", NotificationManager.IMPORTANCE_LOW, "");   // no-op, no crash
        Notifications.deleteChannel("c1");
    }

    @Test public void channels() {
        org.junit.Assume.assumeTrue(api() >= 26);
        assertFalse(Notifications.hasChannel("c1"));
        Notifications.createChannel("c1", "Channel one", NotificationManager.IMPORTANCE_LOW, "about it");
        assertTrue(Notifications.hasChannel("c1"));
        assertEquals("about it", nm().getNotificationChannel("c1").getDescription());
        assertEquals(NotificationManager.IMPORTANCE_LOW, nm().getNotificationChannel("c1").getImportance());
        Notifications.createChannel("c1", "Renamed", NotificationManager.IMPORTANCE_LOW, "");
        assertEquals("Renamed", nm().getNotificationChannel("c1").getName().toString());
        Notifications.deleteChannel("c1");
        assertFalse(Notifications.hasChannel("c1"));
    }

    @Test public void showMakesTheDefaultChannelWhenNoneIsGiven() {
        Notifications.show(1, "", "Title", "Text", false, true, -1);
        Notification n = shadowOf(nm()).getNotification(1);
        if (api() >= 26) assertEquals(Notifications.DEFAULT_CHANNEL, n.getChannelId());
        assertTrue((n.flags & Notification.FLAG_AUTO_CANCEL) != 0);
    }

    @Test public void longTextGetsBigTextStyleAndProgressIsCapped() {
        String text = "x".repeat(80);
        Notifications.show(2, "", "T", text, true, false, 250);
        Notification n = shadowOf(nm()).getNotification(2);
        assertEquals(text, n.extras.getCharSequence(Notification.EXTRA_BIG_TEXT).toString());
        assertEquals(100, n.extras.getInt(Notification.EXTRA_PROGRESS));
        assertTrue((n.flags & Notification.FLAG_ONGOING_EVENT) != 0);
    }

    @Test public void replaceCancelAndList() {
        Notifications.show(3, "", "A", "a", false, true, -1);
        Notifications.show(3, "", "B", "b", false, true, -1);   // same id: replaced
        Notifications.show(4, "", "C", "c", false, true, -1);
        assertEquals(2, Notifications.active().length);
        assertEquals("B", shadowOf(nm()).getNotification(3).extras.getString(Notification.EXTRA_TITLE));
        Notifications.cancel(3);
        assertArrayEquals(new int[] { 4 }, Notifications.active());
        Notifications.cancelAll();
        assertEquals(0, Notifications.active().length);
    }

    @Test public void enabled() {
        assertTrue(Notifications.areEnabled());
        shadowOf(nm()).setNotificationsEnabled(false);
        assertFalse(Notifications.areEnabled());
    }
}
