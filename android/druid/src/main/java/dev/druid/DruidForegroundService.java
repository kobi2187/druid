package dev.druid;

import android.app.Notification;
import android.app.Service;
import android.content.Intent;
import android.content.pm.ServiceInfo;
import android.os.Build;
import android.os.IBinder;

/** The service behind {@link Foreground}: a notification, and nothing else -- the work is the app's. */
public class DruidForegroundService extends Service {
    @Override public int onStartCommand(Intent intent, int flags, int startId) {
        Druid.init(this);
        if (intent == null) {            // restarted by the system: the app's work is gone with its process
            stopSelf();
            return START_NOT_STICKY;
        }
        Notification n = Foreground.notification(intent.getStringExtra(Foreground.EXTRA_CHANNEL),
            intent.getStringExtra(Foreground.EXTRA_TITLE), intent.getStringExtra(Foreground.EXTRA_TEXT), -1);
        int types = intent.getIntExtra(Foreground.EXTRA_TYPES, 0);
        boolean was = Foreground.running;
        try {
            if (Build.VERSION.SDK_INT >= 29) {
                startForeground(Foreground.NOTIFICATION_ID, n,
                    types != 0 ? types : ServiceInfo.FOREGROUND_SERVICE_TYPE_MANIFEST);
            } else {
                startForeground(Foreground.NOTIFICATION_ID, n);
            }
            Foreground.running = true;
            if (!was) Druid.post("foreground", "started", "");
        } catch (Exception e) {         // a missing type or permission (Android 14), not allowed now (12)
            Druid.post("foreground", "error", e.toString());
            stopSelf();
        }
        return START_NOT_STICKY;
    }

    @Override public void onDestroy() {
        if (Foreground.running) {
            Foreground.running = false;
            Druid.post("foreground", "stopped", "");
        }
        super.onDestroy();
    }

    @Override public IBinder onBind(Intent intent) { return null; }
}
