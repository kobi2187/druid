package dev.druid;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/** An alarm firing (Alarms), or the device booting, when alarms are armed again. */
public class DruidAlarmReceiver extends BroadcastReceiver {
    static final String FIRE = "dev.druid.ALARM";

    @Override public void onReceive(Context c, Intent i) {
        String action = i.getAction() == null ? "" : i.getAction();
        if (action.equals(FIRE)) {
            Alarms.fire(c, i.getIntExtra(Alarms.EXTRA_ID, 0));
        } else if (action.equals(Intent.ACTION_BOOT_COMPLETED)) {
            Alarms.rearm(c);
        }
    }
}
