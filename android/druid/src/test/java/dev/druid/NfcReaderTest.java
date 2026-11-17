package dev.druid;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.nfc.NdefMessage;
import android.nfc.NdefRecord;
import android.nfc.NfcAdapter;
import java.nio.charset.StandardCharsets;
import java.util.List;
import org.junit.After;
import org.junit.Test;
import org.robolectric.Robolectric;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.shadows.ShadowNfcAdapter;

public class NfcReaderTest extends DruidTestBase {
    @After public void reset() throws Exception {
        NfcReader.stop();
        ShadowNfcAdapter.reset();
    }

    @Test public void recordsAreDescribed() {
        assertArrayEquals(new String[] { "text:en", "hello" },
            NfcReader.describe(NdefRecord.createTextRecord("en", "hello")));
        assertArrayEquals(new String[] { "uri", "https://nim-lang.org" },
            NfcReader.describe(NdefRecord.createUri("https://nim-lang.org")));
        assertArrayEquals(new String[] { "application/x-druid", "6869" },
            NfcReader.describe(NdefRecord.createMime("application/x-druid", "hi".getBytes(StandardCharsets.UTF_8))));
        NdefRecord unknown = new NdefRecord(NdefRecord.TNF_UNKNOWN, new byte[0], new byte[0], new byte[] { 1 });
        assertArrayEquals(new String[] { "tnf:5:", "01" }, NfcReader.describe(unknown));
    }

    @Test public void aTagIsAnEvent() {
        NdefMessage m = new NdefMessage(NdefRecord.createUri("https://nim-lang.org"),
                                        NdefRecord.createTextRecord("fr", "salut"));
        NfcReader.report("04a2b3", "NfcA,Ndef", m);
        NfcReader.report("05", "IsoDep", null);
        List<String[]> ev = events("nfc");
        assertArrayEquals(new String[] { "nfc", "04a2b3", "NfcA,Ndef", "uri", "https://nim-lang.org", "text:fr", "salut" },
                          ev.get(0));
        assertArrayEquals(new String[] { "nfc", "05", "IsoDep" }, ev.get(1));
    }

    @Test public void readsInTheActivityInFront() throws Exception {
        ShadowNfcAdapter.setNfcHardwareExists(true);
        shadowOf(app.getPackageManager()).setSystemFeature(android.content.pm.PackageManager.FEATURE_NFC, true);
        ActivityController<Activity> c = Robolectric.buildActivity(Activity.class).setup();
        NfcAdapter a = NfcAdapter.getDefaultAdapter(app);
        shadowOf(a).setEnabled(false);
        assertFalse(NfcReader.start());                 // switched off
        shadowOf(a).setEnabled(true);
        assertTrue(NfcReader.start());
        assertTrue(NfcReader.isReading());
        assertTrue(shadowOf(a).isInReaderMode());
        shadowOf(a).dispatchTagDiscovered(ShadowNfcAdapter.createMockTag());
        assertEquals(1, events("nfc").size());
        NfcReader.stop();
        assertFalse(NfcReader.isReading());
        assertFalse(shadowOf(a).isInReaderMode());
        c.pause().stop().destroy();
    }

    @Test public void noNfcNoReading() {
        ShadowNfcAdapter.setNfcHardwareExists(false);
        try {
            NfcReader.start();
            fail();
        } catch (Exception expected) {}
    }
}
