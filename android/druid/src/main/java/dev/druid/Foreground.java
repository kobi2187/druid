package dev.druid;

import android.app.Notification;
import android.app.NotificationManager;
import android.content.Context;
import android.content.Intent;
import android.os.Build;

/**
 * Keeps the app's process running, with a notification, while it works in
 * the background: playing music, tracking a route, an upload. A "foreground"
 * event says ("started", ""), ("stopped", "") or ("error", why).
 *
 * <p>Android 14+ needs the kind of work ({@code types}, ServiceInfo.FOREGROUND_SERVICE_TYPE_*)
 * declared on DruidForegroundService in the app's manifest, and the matching
 * FOREGROUND_SERVICE_* permission. From Android 12 a foreground service can
 * only be started while the app is in front (start() throws otherwise).
 */
public final class Foreground {
    private Foreground() {}

    /** The id of the service's notification. */
    public static final int NOTIFICATION_ID = 0x0D0F_0001;
    static final String EXTRA_TITLE = "dev.druid.fg.title", EXTRA_TEXT = "dev.druid.fg.text",
        EXTRA_CHANNEL = "dev.druid.fg.channel", EXTRA_TYPES = "dev.druid.fg.types";

    static volatile boolean running;
    static volatile String channel = "";

    /** Starts the service (or updates its notification if it runs). */
    public static void start(String title, String text, String channel, int types) {
        Context c = Druid.context();
        Foreground.channel = channel == null ? "" : channel;
        Intent i = new Intent(c, DruidForegroundService.class)
            .putExtra(EXTRA_TITLE, title).putExtra(EXTRA_TEXT, text)
            .putExtra(EXTRA_CHANNEL, Foreground.channel).putExtra(EXTRA_TYPES, types);
        if (Build.VERSION.SDK_INT >= 26) c.startForegroundService(i);
        else c.startService(i);
    }

    /** Changes the notification of the running service; {@code progress} 0..100, -1 for none. */
    public static void update(String title, String text, int progress) {
        if (!running) throw new IllegalStateException("the foreground service is not running");
        ((NotificationManager) Druid.context().getSystemService(Context.NOTIFICATION_SERVICE))
            .notify(NOTIFICATION_ID, notification(channel, title, text, progress));
    }

    public static void stop() {
        Context c = Druid.context();
        c.stopService(new Intent(c, DruidForegroundService.class));
    }

    public static boolean isRunning() { return running; }

    static Notification notification(String channel, String title, String text, int progress) {
        return Notifications.builder(NOTIFICATION_ID, channel, title, text, true, false, progress).build();
    }
}
