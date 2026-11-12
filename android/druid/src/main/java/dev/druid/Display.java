package dev.druid;

import android.content.Context;
import android.hardware.display.DisplayManager;
import android.util.DisplayMetrics;
import android.view.Surface;

/** The default display: its size, density and refresh rate. */
public final class Display {
    private Display() {}

    private static android.view.Display display() {
        DisplayManager dm = (DisplayManager) Druid.context().getSystemService(Context.DISPLAY_SERVICE);
        return dm.getDisplay(android.view.Display.DEFAULT_DISPLAY);
    }

    /**
     * {width px, height px, density (1.0 = 160 dpi), densityDpi, fontScale,
     * refresh rate Hz, rotation degrees, xdpi, ydpi}.
     */
    @SuppressWarnings("deprecation")
    public static float[] metrics() {
        DisplayMetrics m = new DisplayMetrics();
        android.view.Display d = display();
        float refresh = 60f;
        int rotation = 0;
        if (d != null) {
            d.getRealMetrics(m);
            refresh = d.getRefreshRate();
            switch (d.getRotation()) {
                case Surface.ROTATION_90: rotation = 90; break;
                case Surface.ROTATION_180: rotation = 180; break;
                case Surface.ROTATION_270: rotation = 270; break;
                default: rotation = 0;
            }
        } else {
            m.setTo(Druid.context().getResources().getDisplayMetrics());
        }
        float fontScale = Druid.context().getResources().getConfiguration().fontScale;
        return new float[] { m.widthPixels, m.heightPixels, m.density, m.densityDpi,
                             fontScale, refresh, rotation, m.xdpi, m.ydpi };
    }

    /** 1 portrait, 2 landscape (Configuration.ORIENTATION_*). */
    public static int orientation() {
        return Druid.context().getResources().getConfiguration().orientation;
    }
}
