package dev.druid;

import android.content.Context;
import android.os.Build;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.os.VibratorManager;

/** Haptics. Needs android.permission.VIBRATE (a normal permission, granted at install). */
public final class Vibration {
    private Vibration() {}

    @SuppressWarnings("deprecation")
    static Vibrator vibrator() {
        Context c = Druid.context();
        if (Build.VERSION.SDK_INT >= 31) {
            VibratorManager vm = (VibratorManager) c.getSystemService(Context.VIBRATOR_MANAGER_SERVICE);
            if (vm != null) return vm.getDefaultVibrator();
        }
        return (Vibrator) c.getSystemService(Context.VIBRATOR_SERVICE);
    }

    public static boolean hasVibrator() {
        Vibrator v = vibrator();
        return v != null && v.hasVibrator();
    }

    public static boolean hasAmplitudeControl() {
        Vibrator v = vibrator();
        return v != null && Build.VERSION.SDK_INT >= 26 && v.hasAmplitudeControl();
    }

    /** {@code amplitude} 1..255, or -1 for the device default. */
    @SuppressWarnings("deprecation")
    public static void vibrate(long millis, int amplitude) {
        Vibrator v = vibrator();
        if (v == null || millis <= 0) return;
        if (Build.VERSION.SDK_INT >= 26) {
            v.vibrate(VibrationEffect.createOneShot(millis, amplitude == -1 ? VibrationEffect.DEFAULT_AMPLITUDE : amplitude));
        } else {
            v.vibrate(millis);
        }
    }

    /** Alternating off/on durations, starting with a pause; {@code repeat} -1 plays once, else the index to loop from. */
    @SuppressWarnings("deprecation")
    public static void pattern(long[] timings, int repeat) {
        Vibrator v = vibrator();
        if (v == null || timings.length == 0) return;
        if (Build.VERSION.SDK_INT >= 26) v.vibrate(VibrationEffect.createWaveform(timings, repeat));
        else v.vibrate(timings, repeat);
    }

    /** A predefined effect: 0 click, 1 double click, 2 tick, 5 heavy click (VibrationEffect.EFFECT_*). Falls back to a short pulse. */
    public static void effect(int id) {
        Vibrator v = vibrator();
        if (v == null) return;
        if (Build.VERSION.SDK_INT >= 29) v.vibrate(VibrationEffect.createPredefined(id));
        else vibrate(id == 5 ? 60 : 20, -1);
    }

    public static void cancel() {
        Vibrator v = vibrator();
        if (v != null) v.cancel();
    }
}
