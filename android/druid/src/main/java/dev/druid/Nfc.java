package dev.druid;

import android.content.Context;
import android.nfc.NfcAdapter;
import android.nfc.NfcManager;

/** NFC presence and state. */
public final class Nfc {
    private Nfc() {}

    private static NfcAdapter adapter() {
        NfcManager m = (NfcManager) Druid.context().getSystemService(Context.NFC_SERVICE);
        return m == null ? null : m.getDefaultAdapter();
    }

    public static boolean isSupported() {
        return Druid.context().getPackageManager().hasSystemFeature("android.hardware.nfc") && adapter() != null;
    }

    public static boolean isEnabled() {
        NfcAdapter a = adapter();
        return a != null && a.isEnabled();
    }

    public static boolean openSettings() { return Intents.openSettings(android.provider.Settings.ACTION_NFC_SETTINGS); }
}
