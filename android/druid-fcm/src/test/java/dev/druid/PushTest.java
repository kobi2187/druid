package dev.druid;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import android.app.Application;
import android.content.Intent;
import androidx.test.core.app.ApplicationProvider;
import com.google.firebase.messaging.RemoteMessage;
import java.util.ArrayList;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36)
public class PushTest {
    private Application app;

    @Before public void start() {
        app = ApplicationProvider.getApplicationContext();
        Druid.init(app);
        Druid.pollEvents();
    }

    private List<String[]> events() {
        Druid.drainInbox();
        List<String[]> out = new ArrayList<>();
        for (String e : Druid.pollEvents()) {
            String[] f = e.split(String.valueOf(Druid.SEP), -1);
            if (f[0].equals("push")) out.add(f);
        }
        return out;
    }

    @Test public void aMessageIsAnEvent() {
        DruidMessagingService s = Robolectric.setupService(DruidMessagingService.class);
        RemoteMessage m = new RemoteMessage.Builder("123@fcm.googleapis.com")
            .setMessageId("m-1").addData("chat", "42").build();
        s.onMessageReceived(m);
        List<String[]> ev = events();
        assertEquals(1, ev.size());
        assertEquals("message", ev.get(0)[1]);
        assertEquals("m-1", ev.get(0)[3]);
        assertEquals("", ev.get(0)[4]);            // no notification part
        assertEquals("chat", ev.get(0)[6]);
        assertEquals("42", ev.get(0)[7]);
    }

    @Test public void aNewTokenIsAnEvent() {
        Robolectric.setupService(DruidMessagingService.class).onNewToken("tok-9");
        assertArrayEquals(new String[] { "push", "token", "tok-9" }, events().get(0));
    }

    @Test public void theServiceIsDeclared() {
        Intent i = new Intent("com.google.firebase.MESSAGING_EVENT").setPackage(app.getPackageName());
        assertEquals(DruidMessagingService.class.getName(),
                     app.getPackageManager().queryIntentServices(i, 0).get(0).serviceInfo.name);
    }

    @Test public void theNimSideFindsIt() throws Exception {
        assertTrue((Boolean) Druid.cls("Push").getMethod("isAvailable").invoke(null));
    }

    @Test public void aTokenNeedsFirebaseConfigured() {
        try {
            Push.requestToken();                       // no google-services.json in the test app
            fail();
        } catch (IllegalStateException expected) {}
    }
}
