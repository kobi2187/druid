package dev.druid;

import android.content.Context;
import android.hardware.biometrics.BiometricPrompt;
import android.os.Build;
import android.os.CancellationSignal;
import java.util.HashMap;
import java.util.concurrent.Executor;

/**
 * Fingerprint / face confirmation with the system's BiometricPrompt (Android 9+).
 * The outcome is a "biometric" event: (request id, "succeeded"|"failed"|"error", code, message).
 */
public final class Biometric {
    private Biometric() {}

    /**
     * 0 ready, 11 none enrolled, 12 no hardware, 1 hardware unavailable, -1 unknown
     * (BiometricManager.BIOMETRIC_* codes; -2 before Android 10).
     */
    public static int canAuthenticate() {
        if (Build.VERSION.SDK_INT < 29) return -2;
        android.hardware.biometrics.BiometricManager bm = (android.hardware.biometrics.BiometricManager)
            Druid.context().getSystemService(Context.BIOMETRIC_SERVICE);
        if (bm == null) return 12;
        return Build.VERSION.SDK_INT >= 30
            ? bm.canAuthenticate(android.hardware.biometrics.BiometricManager.Authenticators.BIOMETRIC_WEAK)
            : bm.canAuthenticate();
    }

    private static final HashMap<Integer, CancellationSignal> running = new HashMap<>();

    /** Shows the prompt; false when this Android has no BiometricPrompt (before 9). */
    public static boolean authenticate(int requestId, String title, String subtitle, String cancelText) throws Exception {
        if (Build.VERSION.SDK_INT < 28) return false;
        android.app.Activity a = Druid.activity();
        Context c = a != null ? a : Druid.context();
        Executor main = c.getMainExecutor();
        return Druid.onMain(() -> {
            BiometricPrompt.Builder b = new BiometricPrompt.Builder(c).setTitle(title);
            if (subtitle != null && !subtitle.isEmpty()) b.setSubtitle(subtitle);
            b.setNegativeButton(cancelText == null || cancelText.isEmpty() ? "Cancel" : cancelText, main,
                (d, w) -> Druid.post("biometric", requestId, "error", 13, "cancelled"));
            CancellationSignal cancel = new CancellationSignal();
            synchronized (running) { running.put(requestId, cancel); }
            b.build().authenticate(cancel, main, new BiometricPrompt.AuthenticationCallback() {
                @Override public void onAuthenticationSucceeded(BiometricPrompt.AuthenticationResult r) {
                    done(requestId);
                    Druid.post("biometric", requestId, "succeeded", 0, "");
                }
                @Override public void onAuthenticationFailed() {
                    Druid.post("biometric", requestId, "failed", 0, "");
                }
                @Override public void onAuthenticationError(int code, CharSequence msg) {
                    done(requestId);
                    Druid.post("biometric", requestId, "error", code, msg == null ? "" : msg.toString());
                }
            });
            return true;
        });
    }

    private static void done(int id) { synchronized (running) { running.remove(id); } }

    public static void cancel(int requestId) {
        CancellationSignal s;
        synchronized (running) { s = running.remove(requestId); }
        if (s != null) s.cancel();
    }
}
