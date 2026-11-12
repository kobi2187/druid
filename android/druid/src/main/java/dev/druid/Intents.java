package dev.druid;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.provider.Settings;
import android.widget.Toast;

/** Hand things to other apps: links, sharing, the dialer, mail, settings; and toasts. */
public final class Intents {
    private Intents() {}

    /** Starts {@code i} from the current Activity, or as a new task from the app. False if nothing handles it. */
    static boolean start(Intent i) {
        Activity a = Druid.activity();
        Context c = a != null ? a : Druid.context();
        if (a == null) i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        try {
            c.startActivity(i);
            return true;
        } catch (ActivityNotFoundException e) {
            return false;
        }
    }

    public static boolean openUrl(String url) { return start(new Intent(Intent.ACTION_VIEW, Uri.parse(url))); }

    public static boolean shareText(String text, String subject, String chooserTitle) {
        Intent send = new Intent(Intent.ACTION_SEND);
        send.setType("text/plain");
        send.putExtra(Intent.EXTRA_TEXT, text);
        if (subject != null && !subject.isEmpty()) send.putExtra(Intent.EXTRA_SUBJECT, subject);
        return start(Intent.createChooser(send, chooserTitle == null || chooserTitle.isEmpty() ? null : chooserTitle));
    }

    /** Opens the dialer with {@code number} filled in (no permission needed; the user presses call). */
    public static boolean dial(String number) { return start(new Intent(Intent.ACTION_DIAL, Uri.parse("tel:" + Uri.encode(number)))); }

    public static boolean sendEmail(String to, String subject, String body) {
        Intent i = new Intent(Intent.ACTION_SENDTO, Uri.parse("mailto:"));
        i.putExtra(Intent.EXTRA_EMAIL, new String[] { to });
        i.putExtra(Intent.EXTRA_SUBJECT, subject);
        i.putExtra(Intent.EXTRA_TEXT, body);
        return start(i);
    }

    public static boolean sendSms(String number, String body) {
        Intent i = new Intent(Intent.ACTION_SENDTO, Uri.parse("smsto:" + Uri.encode(number)));
        i.putExtra("sms_body", body);
        return start(i);
    }

    public static boolean openMap(String query) {
        return start(new Intent(Intent.ACTION_VIEW, Uri.parse("geo:0,0?q=" + Uri.encode(query))));
    }

    public static boolean openAppSettings() {
        return start(new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS,
                                Uri.fromParts("package", Druid.context().getPackageName(), null)));
    }

    /** One of Settings.ACTION_* ("android.settings.WIFI_SETTINGS", ...). */
    public static boolean openSettings(String action) { return start(new Intent(action)); }

    /** Whether some app can open {@code url}. */
    public static boolean canOpen(String url) {
        Intent i = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
        return i.resolveActivity(Druid.context().getPackageManager()) != null;
    }

    public static void toast(String text, boolean longDuration) throws Exception {
        Druid.onMain(() -> Toast.makeText(Druid.context(), text,
            longDuration ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT).show());
    }
}
