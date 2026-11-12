package dev.druid;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.os.VibrationEffect;
import org.junit.Before;
import org.junit.Test;
import org.robolectric.shadows.ShadowVibrator;

public class VibrationTest extends DruidTestBase {
    private ShadowVibrator v;

    @Before public void vibrator() {
        v = shadowOf(Vibration.vibrator());
        v.setHasVibrator(true);
        v.setHasAmplitudeControl(true);
    }

    @Test public void capabilities() {
        assertTrue(Vibration.hasVibrator());
        assertEquals(api() >= 26, Vibration.hasAmplitudeControl());   // no amplitude before Android 8
        v.setHasVibrator(false);
        v.setHasAmplitudeControl(false);
        assertFalse(Vibration.hasVibrator());
        assertFalse(Vibration.hasAmplitudeControl());
    }

    @Test public void oneShot() {
        Vibration.vibrate(120, 200);
        assertTrue(v.isVibrating());
        assertEquals(120, v.getMilliseconds());
    }

    @Test public void zeroOrNegativeDurationDoesNothing() {
        Vibration.vibrate(0, -1);
        Vibration.vibrate(-5, -1);
        assertFalse(v.isVibrating());
    }

    @Test public void patternWithRepeat() {
        Vibration.pattern(new long[] { 0, 50, 25, 75 }, 1);
        assertArrayEquals(new long[] { 0, 50, 25, 75 }, v.getPattern());
        assertEquals(1, v.getRepeat());
        Vibration.pattern(new long[0], -1);       // empty: ignored
        assertArrayEquals(new long[] { 0, 50, 25, 75 }, v.getPattern());
    }

    @Test public void predefinedEffectBeforeAndroid10IsAPulse() {
        org.junit.Assume.assumeTrue(api() < 29);
        Vibration.effect(VibrationEffect.EFFECT_HEAVY_CLICK);
        assertEquals(60, v.getMilliseconds());
        Vibration.effect(VibrationEffect.EFFECT_CLICK);
        assertEquals(20, v.getMilliseconds());
    }

    @Test public void predefinedEffectOnAndroid10And11() {
        org.junit.Assume.assumeTrue(api() >= 29 && api() <= 30);
        Vibration.effect(VibrationEffect.EFFECT_HEAVY_CLICK);
        assertEquals(VibrationEffect.EFFECT_HEAVY_CLICK, v.getEffectId());
    }

    @Test public void predefinedEffect() throws Exception {
        org.junit.Assume.assumeTrue(api() >= 31);
        Vibration.effect(VibrationEffect.EFFECT_HEAVY_CLICK);
        // On recent SDKs the shadow records a predefined effect as a "prebaked"
        // segment rather than in getEffectId(); read the last one.
        java.lang.reflect.Field f = ShadowVibrator.class.getDeclaredField("vibrationEffectSegments");
        f.setAccessible(true);
        java.util.List<?> segments = (java.util.List<?>) f.get(null);
        String last = String.valueOf(segments.get(segments.size() - 1));
        assertTrue(last, last.contains("Prebaked") && last.contains("HEAVY_CLICK"));
    }

    @Test public void cancel() {
        Vibration.vibrate(1000, -1);
        Vibration.cancel();
        assertFalse(v.isVibrating());
        assertTrue(v.isCancelled());
    }
}
