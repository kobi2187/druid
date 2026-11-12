package dev.druid;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothManager;
import android.content.Context;
import android.content.pm.PackageManager;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CameraManager;
import android.provider.Settings;
import android.telephony.TelephonyManager;
import org.junit.Test;
import org.robolectric.Robolectric;
import org.robolectric.shadows.ShadowCameraCharacteristics;
import org.robolectric.shadows.ShadowNfcAdapter;

/** Telephony, Bluetooth, NFC and Camera. */
public class HardwareTest extends DruidTestBase {
    @Test public void telephony() {
        TelephonyManager tm = (TelephonyManager) app.getSystemService(Context.TELEPHONY_SERVICE);
        shadowOf(app.getPackageManager()).setSystemFeature(PackageManager.FEATURE_TELEPHONY, false);
        assertFalse(Telephony.isSupported());
        shadowOf(app.getPackageManager()).setSystemFeature(PackageManager.FEATURE_TELEPHONY, true);
        assertTrue(Telephony.isSupported());
        shadowOf(tm).setPhoneType(TelephonyManager.PHONE_TYPE_CDMA);
        shadowOf(tm).setSimState(TelephonyManager.SIM_STATE_ABSENT);
        shadowOf(tm).setNetworkOperatorName("Net");
        shadowOf(tm).setSimOperatorName("Sim");
        shadowOf(tm).setNetworkCountryIso("il");
        shadowOf(tm).setSimCountryIso("fr");
        shadowOf(tm).setIsNetworkRoaming(true);
        assertEquals(TelephonyManager.PHONE_TYPE_CDMA, Telephony.phoneType());
        assertEquals(TelephonyManager.SIM_STATE_ABSENT, Telephony.simState());
        assertEquals("Net", Telephony.operatorName());
        assertEquals("Sim", Telephony.simOperatorName());
        assertEquals("il", Telephony.networkCountryIso());
        assertEquals("fr", Telephony.simCountryIso());
        assertTrue(Telephony.isNetworkRoaming());
    }

    @Test public void bluetooth() {
        BluetoothAdapter a = ((BluetoothManager) app.getSystemService(Context.BLUETOOTH_SERVICE)).getAdapter();
        assertTrue(Bluetooth.isSupported());
        shadowOf(a).setEnabled(false);
        assertFalse(Bluetooth.isEnabled());
        shadowOf(a).setEnabled(true);
        assertTrue(Bluetooth.isEnabled());
        shadowOf(app.getPackageManager()).setSystemFeature(PackageManager.FEATURE_BLUETOOTH_LE, false);
        assertFalse(Bluetooth.hasLowEnergy());
        Activity act = Robolectric.buildActivity(Activity.class).setup().get();
        Druid.init(act);
        assertTrue(Bluetooth.requestEnable());
        assertEquals(BluetoothAdapter.ACTION_REQUEST_ENABLE, shadowOf(act).getNextStartedActivity().getAction());
    }

    @Test public void nfc() {
        shadowOf(app.getPackageManager()).setSystemFeature(PackageManager.FEATURE_NFC, false);
        assertFalse(Nfc.isSupported());
        shadowOf(app.getPackageManager()).setSystemFeature(PackageManager.FEATURE_NFC, true);
        ShadowNfcAdapter.setNfcHardwareExists(true);
        assertTrue(Nfc.isSupported());
        shadowOf(android.nfc.NfcAdapter.getDefaultAdapter(app)).setEnabled(true);
        assertTrue(Nfc.isEnabled());
        Activity act = Robolectric.buildActivity(Activity.class).setup().get();
        Druid.init(act);
        assertTrue(Nfc.openSettings());
        assertEquals(Settings.ACTION_NFC_SETTINGS, shadowOf(act).getNextStartedActivity().getAction());
    }

    @Test public void cameraWithoutFactsAnswersUnknown() throws Exception {
        CameraManager cm = (CameraManager) app.getSystemService(Context.CAMERA_SERVICE);
        assertEquals(0, Camera.ids().length);
        shadowOf(cm).addCamera("9", ShadowCameraCharacteristics.newCameraCharacteristics());
        assertArrayEquals(new String[] { "9" }, Camera.ids());
        assertEquals(-1, Camera.facing("9"));
        assertFalse(Camera.hasFlash("9"));
        assertEquals(-1, Camera.sensorOrientation("9"));
        Camera.setTorch("9", true);
        assertTrue(shadowOf(cm).getTorchMode("9"));
        Camera.setTorch("9", false);
        assertFalse(shadowOf(cm).getTorchMode("9"));
    }

    @Test(expected = IllegalArgumentException.class)
    public void cameraThatDoesNotExist() throws Exception { Camera.facing("nope"); }
}
