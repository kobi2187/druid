package dev.druid;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.content.Intent;
import android.provider.Settings;
import org.junit.Before;
import org.junit.Test;
import org.robolectric.Robolectric;
import org.robolectric.shadows.ShadowToast;

public class IntentsTest extends DruidTestBase {
    private Activity activity;

    @Before public void overAnActivity() {
        activity = Robolectric.buildActivity(Activity.class).setup().get();
        Druid.init(activity);
    }

    private Intent next() { return shadowOf(activity).getNextStartedActivity(); }

    @Test public void everyIntentIsTheRightOne() {
        assertTrue(Intents.openUrl("https://a.b/c"));
        assertEquals("https://a.b/c", next().getDataString());

        assertTrue(Intents.shareText("t", "", ""));
        Intent chooser = next();
        @SuppressWarnings("deprecation") Intent send = chooser.getParcelableExtra(Intent.EXTRA_INTENT);
        assertNull(send.getStringExtra(Intent.EXTRA_SUBJECT));      // empty subject: none
        assertEquals("text/plain", send.getType());

        assertTrue(Intents.dial("123"));
        assertEquals(Intent.ACTION_DIAL, next().getAction());

        assertTrue(Intents.sendEmail("a@b.c", "S", "B"));
        Intent mail = next();
        assertArrayEquals(new String[] { "a@b.c" }, mail.getStringArrayExtra(Intent.EXTRA_EMAIL));
        assertEquals("mailto:", mail.getDataString());

        assertTrue(Intents.sendSms("+1 2", "hi"));
        Intent sms = next();
        assertEquals("smsto:%2B1%202", sms.getDataString());
        assertEquals("hi", sms.getStringExtra("sms_body"));

        assertTrue(Intents.openMap("Eiffel Tower"));
        assertEquals("geo:0,0?q=Eiffel%20Tower", next().getDataString());

        assertTrue(Intents.openSettings(Settings.ACTION_WIFI_SETTINGS));
        assertEquals(Settings.ACTION_WIFI_SETTINGS, next().getAction());

        assertTrue(Intents.openAppSettings());
        assertEquals(Settings.ACTION_APPLICATION_DETAILS_SETTINGS, next().getAction());
    }

    @Test public void falseWhenNothingCanHandleIt() {
        shadowOf(app).checkActivities(true);
        assertFalse(Intents.openUrl("https://nothing.handles/this"));
        assertFalse(Intents.canOpen("https://nothing.handles/this"));
    }

    @Test public void toasts() throws Exception {
        Intents.toast("short", false);
        assertEquals("short", ShadowToast.getTextOfLatestToast());
        assertEquals(android.widget.Toast.LENGTH_SHORT, ShadowToast.getLatestToast().getDuration());
        Intents.toast("long", true);
        assertEquals(android.widget.Toast.LENGTH_LONG, ShadowToast.getLatestToast().getDuration());
    }
}
