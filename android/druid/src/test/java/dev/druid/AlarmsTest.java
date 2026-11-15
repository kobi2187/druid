package dev.druid;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.AlarmManager;
import android.app.Notification;
import android.app.NotificationManager;
import android.content.Context;
import android.content.Intent;
import java.util.List;
import org.junit.Test;
import org.robolectric.shadows.ShadowAlarmManager;

public class AlarmsTest extends DruidTestBase {
    private AlarmManager am() { return (AlarmManager) app.getSystemService(Context.ALARM_SERVICE); }

    @Test public void setArmsTheSystemAlarm() {
        long at = System.currentTimeMillis() + 60_000;
        boolean exact = Alarms.set(1, at, "Stretch", "Get up", "", true);
        assertEquals(Alarms.canBeExact(), exact);
        ShadowAlarmManager.ScheduledAlarm a = shadowOf(am()).getNextScheduledAlarm();
        assertNotNull(a);
        assertEquals(at, a.getTriggerAtMs());
        assertEquals(AlarmManager.RTC_WAKEUP, a.getType());
        assertArrayEquals(new int[] { 1 }, Alarms.pending());
    }

    @Test public void exactNeedsTheUsersGrantOn12() {
        if (api() < 31) {
            assertTrue(Alarms.canBeExact());
            return;
        }
        ShadowAlarmManager.setCanScheduleExactAlarms(false);
        assertFalse(Alarms.canBeExact());
        assertFalse(Alarms.set(2, System.currentTimeMillis() + 1000, "", "", "", true));
        ShadowAlarmManager.setCanScheduleExactAlarms(true);
        assertTrue(Alarms.set(2, System.currentTimeMillis() + 1000, "", "", "", true));
    }

    @Test public void firingShowsTheNotificationAndIsAnEvent() {
        long at = System.currentTimeMillis() + 5000;
        Alarms.set(3, at, "Stretch", "Get up", "", false);
        Intent fire = new Intent(app, DruidAlarmReceiver.class).setAction(DruidAlarmReceiver.FIRE)
            .putExtra(Alarms.EXTRA_ID, 3);
        new DruidAlarmReceiver().onReceive(app, fire);
        List<String[]> ev = events("alarm");
        assertEquals(1, ev.size());
        assertArrayEquals(new String[] { "alarm", "3", String.valueOf(at) }, ev.get(0));
        NotificationManager nm = (NotificationManager) app.getSystemService(Context.NOTIFICATION_SERVICE);
        Notification n = shadowOf(nm).getNotification(3);
        assertNotNull(n);
        assertEquals("Stretch", n.extras.getString(Notification.EXTRA_TITLE));
        assertEquals(0, Alarms.pending().length);
        new DruidAlarmReceiver().onReceive(app, fire);    // a stale broadcast: nothing
        assertEquals(0, events("alarm").size());
    }

    @Test public void withoutATitleThereIsNoNotification() {
        Alarms.set(4, System.currentTimeMillis(), "", "", "", false);
        Alarms.fire(app, 4);
        assertEquals(1, events("alarm").size());
        NotificationManager nm = (NotificationManager) app.getSystemService(Context.NOTIFICATION_SERVICE);
        assertNull(shadowOf(nm).getNotification(4));
    }

    @Test public void cancelForgetsIt() {
        Alarms.set(5, System.currentTimeMillis() + 60_000, "", "", "", false);
        Alarms.set(6, System.currentTimeMillis() + 60_000, "", "", "", false);
        Alarms.cancel(5);
        assertArrayEquals(new int[] { 6 }, Alarms.pending());
        assertEquals(1, shadowOf(am()).getScheduledAlarms().size());
    }

    @Test public void aRebootArmsThemAgain() {
        long at = System.currentTimeMillis() + 60_000;
        Alarms.set(7, at, "x", "", "", false);
        am().cancel(Alarms.pending(app, 7));          // a reboot clears the system's alarms, not Druid's list
        assertEquals(0, shadowOf(am()).getScheduledAlarms().size());
        new DruidAlarmReceiver().onReceive(app, new Intent(Intent.ACTION_BOOT_COMPLETED));
        assertEquals(at, shadowOf(am()).getNextScheduledAlarm().getTriggerAtMs());
    }

    @Test public void theReceiverIsDeclaredForBoot() {
        Intent boot = new Intent(Intent.ACTION_BOOT_COMPLETED).setPackage(app.getPackageName());
        assertFalse(app.getPackageManager().queryBroadcastReceivers(boot, 0).isEmpty());
    }
}
