package dev.druid;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Build;

/**
 * Local notifications. On Android 13+ they need the POST_NOTIFICATIONS
 * runtime permission (ask with Permissions); on 8+ a channel (created on demand).
 */
public final class Notifications {
    private Notifications() {}

    public static final String DEFAULT_CHANNEL = "druid_default";

    private static NotificationManager nm() {
        return (NotificationManager) Druid.context().getSystemService(Context.NOTIFICATION_SERVICE);
    }

    /** {@code importance}: NotificationManager.IMPORTANCE_* (1 min .. 4 high, 3 default). */
    public static void createChannel(String id, String name, int importance, String description) {
        if (Build.VERSION.SDK_INT < 26) return;
        NotificationChannel ch = new NotificationChannel(id, name, importance);
        if (description != null && !description.isEmpty()) ch.setDescription(description);
        nm().createNotificationChannel(ch);
    }

    public static void deleteChannel(String id) {
        if (Build.VERSION.SDK_INT >= 26) nm().deleteNotificationChannel(id);
    }

    public static boolean hasChannel(String id) {
        return Build.VERSION.SDK_INT < 26 || nm().getNotificationChannel(id) != null;
    }

    public static boolean areEnabled() { return nm().areNotificationsEnabled(); }

    /** The extra a notification's tap puts on the launch Intent: its id (Druid reports a "notification ... tap" event). */
    public static final String EXTRA_TAP = "dev.druid.notification";

    /**
     * Shows (or replaces) notification {@code id}. Tapping it opens the app's
     * launcher Activity. {@code progress} -1 for none, else 0..100.
     */
    public static void show(int id, String channel, String title, String text,
                            boolean ongoing, boolean autoCancel, int progress) {
        showFull(id, channel, title, text, ongoing, autoCancel, progress,
                 new String[0], new String[0], "", "");
    }

    /**
     * {@link #show} with action buttons and an inline reply. What the user does
     * becomes a "notification" event: (id, "tap", ""), (id, "dismissed", ""),
     * (id, "action", actionId) or (id, "reply", text) -- kept until the app
     * reads it, even if it was not running.
     *
     * @param actionIds   ids of the buttons, reported back
     * @param actionLabels what the buttons say
     * @param replyLabel  non-empty: a "Reply" button with a text field, labelled so
     * @param replyHint   the field's hint
     */
    @SuppressWarnings("deprecation")
    public static void showFull(int id, String channel, String title, String text,
                                boolean ongoing, boolean autoCancel, int progress,
                                String[] actionIds, String[] actionLabels,
                                String replyLabel, String replyHint) {
        Context c = Druid.context();
        String ch = channel == null || channel.isEmpty() ? DEFAULT_CHANNEL : channel;
        if (Build.VERSION.SDK_INT >= 26 && nm().getNotificationChannel(ch) == null) {
            createChannel(ch, ch.equals(DEFAULT_CHANNEL) ? "Notifications" : ch,
                          NotificationManager.IMPORTANCE_DEFAULT, "");
        }
        Notification.Builder b = Build.VERSION.SDK_INT >= 26
            ? new Notification.Builder(c, ch) : new Notification.Builder(c);
        int icon = c.getApplicationInfo().icon;
        b.setSmallIcon(icon != 0 ? icon : android.R.drawable.ic_dialog_info)
         .setContentTitle(title)
         .setContentText(text)
         .setOngoing(ongoing)
         .setAutoCancel(autoCancel);
        if (text != null && text.length() > 40) b.setStyle(new Notification.BigTextStyle().bigText(text));
        if (progress >= 0) b.setProgress(100, Math.min(100, progress), false);
        Intent launch = c.getPackageManager().getLaunchIntentForPackage(c.getPackageName());
        if (launch != null) {
            launch.putExtra(EXTRA_TAP, id);
            b.setContentIntent(PendingIntent.getActivity(c, id, launch,
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE));
        }
        b.setDeleteIntent(DruidNotificationReceiver.pending(c, id, DruidNotificationReceiver.DISMISSED, "", false));
        int n = Math.min(actionIds.length, actionLabels.length);
        for (int k = 0; k < n; k++) {
            b.addAction(new Notification.Action.Builder(null, actionLabels[k],
                DruidNotificationReceiver.pending(c, id, DruidNotificationReceiver.ACTION, actionIds[k], false)).build());
        }
        if (replyLabel != null && !replyLabel.isEmpty() && Build.VERSION.SDK_INT >= 24) {
            android.app.RemoteInput input = new android.app.RemoteInput.Builder(DruidNotificationReceiver.REPLY_KEY)
                .setLabel(replyHint == null || replyHint.isEmpty() ? replyLabel : replyHint).build();
            b.addAction(new Notification.Action.Builder(null, replyLabel,
                DruidNotificationReceiver.pending(c, id, DruidNotificationReceiver.REPLY, "", true))
                .addRemoteInput(input).build());
        }
        nm().notify(id, b.build());
    }

    public static void cancel(int id) { nm().cancel(id); }
    public static void cancelAll() { nm().cancelAll(); }

    /** Ids of this app's notifications on screen. */
    public static int[] active() {
        android.service.notification.StatusBarNotification[] s = nm().getActiveNotifications();
        int[] ids = new int[s.length];
        for (int k = 0; k < s.length; k++) ids[k] = s[k].getId();
        return ids;
    }
}
