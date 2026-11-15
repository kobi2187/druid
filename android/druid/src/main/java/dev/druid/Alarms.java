package dev.druid;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Build;
import java.util.ArrayList;
import java.util.List;

/**
 * Reminders at a time, which fire whether or not the app is running: at the
 * time, the notification is shown (when there is a title) and an "alarm"
 * event (id) waits for the app. Kept across reboots (re-armed at boot).
 *
 * <p>Exact alarms need SCHEDULE_EXACT_ALARM on Android 12+ (the user grants it
 * in Settings); without it an exact alarm is set inexactly, within minutes.
 */
public final class Alarms {
    private Alarms() {}

    private static final String STORE = "dev.druid.alarms";
    static final String EXTRA_ID = "dev.druid.alarmId";

    private static AlarmManager am(Context c) { return (AlarmManager) c.getSystemService(Context.ALARM_SERVICE); }
    private static SharedPreferences store(Context c) { return c.getSharedPreferences(STORE, Context.MODE_PRIVATE); }

    static PendingIntent pending(Context c, int id) {
        Intent i = new Intent(c, DruidAlarmReceiver.class).setAction(DruidAlarmReceiver.FIRE).putExtra(EXTRA_ID, id);
        return PendingIntent.getBroadcast(c, id, i, PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
    }

    /** Whether exact alarms are allowed (always before Android 12). */
    public static boolean canBeExact() {
        return Build.VERSION.SDK_INT < 31 || am(Druid.context()).canScheduleExactAlarms();
    }

    /**
     * At {@code atMs} (Unix ms): shows notification {@code id} with {@code title}
     * and {@code text} on {@code channel} (no notification when the title is
     * empty) and posts an "alarm" event. Replaces an alarm with the same id.
     * Returns whether it was set exactly.
     */
    public static boolean set(int id, long atMs, String title, String text, String channel, boolean exact) {
        Context c = Druid.context();
        store(c).edit().putString(String.valueOf(id), Druid.SEP + String.valueOf(atMs) + Druid.SEP + nz(title)
            + Druid.SEP + nz(text) + Druid.SEP + nz(channel) + Druid.SEP + (exact ? "1" : "0")).commit();
        return arm(c, id, atMs, exact);
    }

    static boolean arm(Context c, int id, long atMs, boolean exact) {
        PendingIntent p = pending(c, id);
        boolean asExact = exact && (Build.VERSION.SDK_INT < 31 || am(c).canScheduleExactAlarms());
        if (asExact) {
            if (Build.VERSION.SDK_INT >= 23) am(c).setExactAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, atMs, p);
            else am(c).setExact(AlarmManager.RTC_WAKEUP, atMs, p);
        } else {
            if (Build.VERSION.SDK_INT >= 23) am(c).setAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, atMs, p);
            else am(c).set(AlarmManager.RTC_WAKEUP, atMs, p);
        }
        return asExact;
    }

    public static void cancel(int id) {
        Context c = Druid.context();
        am(c).cancel(pending(c, id));
        store(c).edit().remove(String.valueOf(id)).commit();
    }

    /** Ids of the alarms set and not yet fired. */
    public static int[] pending() {
        List<Integer> ids = new ArrayList<>();
        for (String k : store(Druid.context()).getAll().keySet()) ids.add(Integer.parseInt(k));
        int[] out = new int[ids.size()];
        for (int k = 0; k < out.length; k++) out[k] = ids.get(k);
        java.util.Arrays.sort(out);
        return out;
    }

    /** The stored alarm: {atMs, title, text, channel, exact}, or null. */
    static String[] stored(Context c, int id) {
        String v = store(c).getString(String.valueOf(id), null);
        return v == null ? null : v.substring(1).split(String.valueOf(Druid.SEP), -1);
    }

    /** It fired: shown, reported, forgotten. */
    static void fire(Context c, int id) {
        String[] a = stored(c, id);
        store(c).edit().remove(String.valueOf(id)).commit();
        if (a == null) return;
        if (!a[1].isEmpty()) {
            Druid.init(c);
            Notifications.show(id, a[3], a[1], a[2], false, true, -1);
        }
        Druid.postDurable(c, "alarm", id, a[0]);
    }

    /** After a reboot: every stored alarm armed again (one already past fires at once). */
    static void rearm(Context c) {
        for (String k : store(c).getAll().keySet()) {
            String[] a = stored(c, Integer.parseInt(k));
            arm(c, Integer.parseInt(k), Long.parseLong(a[0]), a[4].equals("1"));
        }
    }

    private static String nz(String s) { return s == null ? "" : s; }
}
