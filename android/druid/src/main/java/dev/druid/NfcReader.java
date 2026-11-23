package dev.druid;

import android.app.Activity;
import android.nfc.NdefMessage;
import android.nfc.NdefRecord;
import android.nfc.NfcAdapter;
import android.nfc.Tag;
import android.nfc.tech.Ndef;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;

/**
 * Reading NFC tags while the app is in front (reader mode: the system's own
 * tag handling is off meanwhile). Each tag is an "nfc" event: id (hex),
 * technologies (comma-separated short names), then per NDEF record two
 * fields: its kind and its value -- "text:LANG" and the text, "uri" and the
 * URI, a MIME type and the payload in hex, or "tnf:N:TYPEHEX" and the payload.
 */
public final class NfcReader {
    private NfcReader() {}

    private static Activity readingIn;

    private static NfcAdapter adapter() {
        NfcAdapter a = NfcAdapter.getDefaultAdapter(Druid.context());
        if (a == null) throw new IllegalStateException("this device has no NFC");
        return a;
    }

    /** Starts reading in the current Activity; false when NFC is switched off. */
    public static synchronized boolean start() throws Exception {
        NfcAdapter a = adapter();
        if (!a.isEnabled()) return false;
        Activity act = Druid.activity();
        if (act == null) throw new IllegalStateException("no Activity to read tags in");
        int flags = NfcAdapter.FLAG_READER_NFC_A | NfcAdapter.FLAG_READER_NFC_B | NfcAdapter.FLAG_READER_NFC_F
                  | NfcAdapter.FLAG_READER_NFC_V | NfcAdapter.FLAG_READER_NFC_BARCODE;
        Druid.onMain(() -> a.enableReaderMode(act, NfcReader::tag, flags, null));
        readingIn = act;
        return true;
    }

    public static synchronized void stop() throws Exception {
        Activity act = readingIn;
        readingIn = null;
        if (act != null && !act.isDestroyed()) Druid.onMain(() -> adapter().disableReaderMode(act));
    }

    public static synchronized boolean isReading() { return readingIn != null; }

    static void tag(Tag t) {
        StringBuilder techs = new StringBuilder();
        for (String tech : t.getTechList()) {
            if (techs.length() > 0) techs.append(',');
            techs.append(tech.substring(tech.lastIndexOf('.') + 1));
        }
        NdefMessage m = null;
        Ndef ndef = Ndef.get(t);
        if (ndef != null) m = ndef.getCachedNdefMessage();
        report(BleGatt.hex(t.getId()), techs.toString(), m);
    }

    static void report(String id, String techs, NdefMessage m) {
        ArrayList<Object> f = new ArrayList<>();
        f.add(id);
        f.add(techs);
        if (m != null) {
            for (NdefRecord r : m.getRecords()) {
                String[] kv = describe(r);
                f.add(kv[0]);
                f.add(kv[1]);
            }
        }
        Druid.post("nfc", f.toArray());
    }

    static String[] describe(NdefRecord r) {
        short tnf = r.getTnf();
        byte[] type = r.getType();
        byte[] p = r.getPayload();
        if (tnf == NdefRecord.TNF_WELL_KNOWN && java.util.Arrays.equals(type, NdefRecord.RTD_TEXT) && p.length > 0) {
            int langLen = p[0] & 0x3f;
            boolean utf16 = (p[0] & 0x80) != 0;
            String lang = new String(p, 1, langLen, StandardCharsets.US_ASCII);
            String text = new String(p, 1 + langLen, p.length - 1 - langLen,
                                     utf16 ? StandardCharsets.UTF_16 : StandardCharsets.UTF_8);
            return new String[] { "text:" + lang, text };
        }
        android.net.Uri u = r.toUri();
        if (u != null) return new String[] { "uri", u.toString() };
        if (tnf == NdefRecord.TNF_MIME_MEDIA) return new String[] { new String(type, StandardCharsets.US_ASCII), BleGatt.hex(p) };
        return new String[] { "tnf:" + tnf + ":" + BleGatt.hex(type), BleGatt.hex(p) };
    }
}
