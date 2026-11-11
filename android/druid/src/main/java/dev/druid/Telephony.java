package dev.druid;

import android.content.Context;
import android.telephony.TelephonyManager;

/** What can be read about the phone network without a dangerous permission. */
public final class Telephony {
    private Telephony() {}

    private static TelephonyManager tm() {
        return (TelephonyManager) Druid.context().getSystemService(Context.TELEPHONY_SERVICE);
    }

    public static boolean isSupported() {
        return Druid.context().getPackageManager().hasSystemFeature("android.hardware.telephony") && tm() != null;
    }
    /** TelephonyManager.PHONE_TYPE_* (0 none, 1 GSM, 2 CDMA, 3 SIP). */
    public static int phoneType() { return tm() == null ? 0 : tm().getPhoneType(); }
    /** TelephonyManager.SIM_STATE_* (1 absent, 5 ready, ...). */
    public static int simState() { return tm() == null ? 0 : tm().getSimState(); }
    public static String operatorName() { return tm() == null ? "" : nz(tm().getNetworkOperatorName()); }
    public static String simOperatorName() { return tm() == null ? "" : nz(tm().getSimOperatorName()); }
    public static String networkCountryIso() { return tm() == null ? "" : nz(tm().getNetworkCountryIso()); }
    public static String simCountryIso() { return tm() == null ? "" : nz(tm().getSimCountryIso()); }
    public static boolean isNetworkRoaming() { return tm() != null && tm().isNetworkRoaming(); }

    private static String nz(String s) { return s == null ? "" : s; }
}
