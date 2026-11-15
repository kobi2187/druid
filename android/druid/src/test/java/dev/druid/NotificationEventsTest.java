package dev.druid;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.RemoteInput;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ActivityInfo;
import android.os.Bundle;
import java.util.List;
import org.junit.Test;
import org.robolectric.Robolectric;
import org.robolectric.android.controller.ActivityController;

public class NotificationEventsTest extends DruidTestBase {
    private NotificationManager nm() { return (NotificationManager) app.getSystemService(Context.NOTIFICATION_SERVICE); }

    private void show(int id) {
        Notifications.showFull(id, "", "Message", "Hi", false, true, -1,
            new String[] { "read", "later" }, new String[] { "Mark read", "Later" }, "Reply", "Your answer");
    }

    /** Fires a notification's PendingIntent as the system would. */
    private void send(PendingIntent p, Intent fill) throws Exception {
        p.send(app, 0, fill);
        idle();
    }

    @Test public void buttonsAndReplyAreAdded() {
        show(3);
        Notification n = shadowOf(nm()).getNotification(3);
        assertNotNull(n.deleteIntent);
        assertEquals(api() >= 24 ? 3 : 2, n.actions.length);
        assertEquals("Mark read", n.actions[0].title.toString());
        assertEquals("Later", n.actions[1].title.toString());
        if (api() >= 24) {
            assertEquals("Reply", n.actions[2].title.toString());
            assertEquals("Your answer", n.actions[2].getRemoteInputs()[0].getLabel().toString());
        }
    }

    @Test public void aButtonIsAnActionEvent() throws Exception {
        show(4);
        send(shadowOf(nm()).getNotification(4).actions[1].actionIntent, null);
        List<String[]> ev = events("notification");
        assertEquals(1, ev.size());
        assertArrayEquals(new String[] { "notification", "4", "action", "later" }, ev.get(0));
    }

    @Test public void dismissingIsAnEvent() throws Exception {
        show(5);
        send(shadowOf(nm()).getNotification(5).deleteIntent, null);
        assertArrayEquals(new String[] { "notification", "5", "dismissed", "" }, events("notification").get(0));
    }

    @Test public void aReplyIsAnEventAndClosesIt() throws Exception {
        if (api() < 24) return;
        show(6);
        Notification.Action reply = shadowOf(nm()).getNotification(6).actions[2];
        Intent fill = new Intent();
        Bundle typed = new Bundle();
        typed.putCharSequence(DruidNotificationReceiver.REPLY_KEY, "on my way");
        RemoteInput.addResultsToIntent(reply.getRemoteInputs(), fill, typed);
        send(reply.actionIntent, fill);
        assertArrayEquals(new String[] { "notification", "6", "reply", "on my way" }, events("notification").get(0));
        assertNull(shadowOf(nm()).getNotification(6));
    }

    @Test public void aTapOpensTheAppAndIsAnEvent() {
        // The launch Intent a tap sends carries the id; Druid reads it when the Activity starts.
        Intent tap = new Intent(Intent.ACTION_MAIN).putExtra(Notifications.EXTRA_TAP, 8);
        ActivityController<Activity> c = Robolectric.buildActivity(Activity.class, tap).create();
        List<String[]> ev = events("notification");
        assertEquals(1, ev.size());
        assertArrayEquals(new String[] { "notification", "8", "tap", "" }, ev.get(0));
        c.start().resume();                               // seen once, not again on resume
        assertEquals(0, events("notification").size());
        Intent again = new Intent(Intent.ACTION_MAIN).putExtra(Notifications.EXTRA_TAP, 9);
        Druid.newIntent(c.get(), again);                  // a tap while it runs (onNewIntent)
        assertEquals("9", events("notification").get(0)[1]);
        c.pause().stop().destroy();
    }

    @Test public void eventsWaitWhileTheNimSideIsAway() {
        Druid.setWakeRegistered(false);
        Druid.postDurable(app, "notification", 1, "dismissed", "");
        Druid.postDurable(app, "alarm", 2, 99);
        assertEquals(0, Druid.pendingEvents());           // stored, not queued
        assertFalse(app.getSharedPreferences("dev.druid.inbox", 0).getString("events", "").isEmpty());
        Druid.init(app);                                  // the app's code starts again
        List<String> all = java.util.Arrays.asList(Druid.pollEvents());
        assertEquals(2, all.size());
        assertTrue(all.get(0).startsWith("notification" + Druid.SEP + "1"));
        assertTrue(all.get(1).startsWith("alarm" + Druid.SEP + "2"));
        assertTrue(app.getSharedPreferences("dev.druid.inbox", 0).getString("events", "").isEmpty());
    }

    @Test public void theReceiverIsDeclared() {
        Intent i = new Intent(app, DruidNotificationReceiver.class);
        assertFalse(app.getPackageManager().queryBroadcastReceivers(i, 0).isEmpty());
    }
}
