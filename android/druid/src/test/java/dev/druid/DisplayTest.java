package dev.druid;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.content.res.Configuration;
import android.view.Surface;
import org.junit.Test;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowDisplay;

public class DisplayTest extends DruidTestBase {
    @Test @Config(qualifiers = "w411dp-h891dp-port-xxhdpi")
    public void metricsOfAPhone() {
        float[] m = Display.metrics();
        assertEquals(9, m.length);
        assertEquals(411 * 3, m[0], 1);
        assertEquals(891 * 3, m[1], 1);
        assertEquals(3.0f, m[2], 1e-4);
        assertEquals(480, m[3], 0);
        assertEquals(1.0f, m[4], 1e-4);
        assertTrue(m[5] > 0);
        assertEquals(0, m[6], 0);
        assertEquals(Configuration.ORIENTATION_PORTRAIT, Display.orientation());
    }

    @Test @Config(qualifiers = "land")
    public void landscape() {
        assertEquals(Configuration.ORIENTATION_LANDSCAPE, Display.orientation());
    }

    @Test public void rotationRefreshAndFontScale() {
        ShadowDisplay d = shadowOf(ShadowDisplay.getDefaultDisplay());
        d.setRotation(Surface.ROTATION_270);
        d.setRefreshRate(120f);
        app.getResources().getConfiguration().fontScale = 1.3f;
        float[] m = Display.metrics();
        assertEquals(270, m[6], 0);
        assertEquals(120f, m[5], 1e-4);
        assertEquals(1.3f, m[4], 1e-4);
        d.setRotation(Surface.ROTATION_90);
        assertEquals(90, Display.metrics()[6], 0);
        d.setRotation(Surface.ROTATION_180);
        assertEquals(180, Display.metrics()[6], 0);
    }
}
