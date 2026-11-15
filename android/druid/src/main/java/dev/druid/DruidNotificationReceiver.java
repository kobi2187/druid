package dev.druid;

import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.RemoteInput;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;

/**
 * What the user does to a notification besides tapping it: dismisses it,
 * presses one of its buttons, or replies inline. Each becomes a "notification"
 * event, kept until the app reads it even when it was not running.
 */
public class DruidNotificationReceiver extends BroadcastReceiver {
    static final String DISMISSED = "dev.druid.NOTIFICATION_DISMISSED";
    static final String ACTION = "dev.druid.NOTIFICATION_ACTION";
    static final String REPLY = "dev.druid.NOTIFICATION_REPLY";
    static final String EXTRA_ID = "dev.druid.notificationId";
    static final String EXTRA_ACTION = "dev.druid.actionId";
    static final String REPLY_KEY = "dev.druid.reply";

    /** A broadcast to this receiver for notification {@code id}; mutable when the system fills in a reply. */
    static PendingIntent pending(Context c, int id, String what, String actionId, boolean mutable) {
        Intent i = new Intent(c, DruidNotificationReceiver.class)
            .setAction(what)
            .putExtra(EXTRA_ID, id)
            .putExtra(EXTRA_ACTION, actionId);
        int code = (what + "/" + id + "/" + actionId).hashCode();
        int flags = PendingIntent.FLAG_UPDATE_CURRENT;
        if (Build.VERSION.SDK_INT >= 31) flags |= mutable ? PendingIntent.FLAG_MUTABLE : PendingIntent.FLAG_IMMUTABLE;
        else if (!mutable) flags |= PendingIntent.FLAG_IMMUTABLE;
        return PendingIntent.getBroadcast(c, code, i, flags);
    }

    @Override public void onReceive(Context c, Intent i) {
        Druid.init(c);
        int id = i.getIntExtra(EXTRA_ID, 0);
        String what = i.getAction() == null ? "" : i.getAction();
        switch (what) {
            case DISMISSED:
                Druid.postDurable(c, "notification", id, "dismissed", "");
                break;
            case ACTION:
                Druid.postDurable(c, "notification", id, "action", i.getStringExtra(EXTRA_ACTION));
                break;
            case REPLY: {
                Bundle results = RemoteInput.getResultsFromIntent(i);
                CharSequence text = results == null ? null : results.getCharSequence(REPLY_KEY);
                Druid.postDurable(c, "notification", id, "reply", text == null ? "" : text.toString());
                // The system shows a spinner until the notification changes: take it down.
                ((NotificationManager) c.getSystemService(Context.NOTIFICATION_SERVICE)).cancel(id);
                break;
            }
            default:
        }
    }
}
