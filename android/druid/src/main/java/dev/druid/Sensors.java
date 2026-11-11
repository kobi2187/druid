package dev.druid;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Handler;
import android.os.Looper;
import java.util.HashMap;
import java.util.List;

/**
 * Hardware sensors by Sensor.TYPE_* (1 accelerometer, 4 gyroscope, 2 magnetic
 * field, 5 light, 8 proximity, 6 pressure, 9 gravity, 10 linear acceleration,
 * 11 rotation vector, 19 step counter). Readings arrive as "sensor" events:
 * type, accuracy, timestamp ns, values...
 */
public final class Sensors {
    private Sensors() {}

    private static SensorManager sm() {
        return (SensorManager) Druid.context().getSystemService(Context.SENSOR_SERVICE);
    }

    public static boolean has(int type) { return sm().getDefaultSensor(type) != null; }

    /** {name, vendor} of the default sensor of {@code type}, or null. */
    public static String[] describe(int type) {
        Sensor s = sm().getDefaultSensor(type);
        return s == null ? null : new String[] { s.getName(), s.getVendor() };
    }

    /** {max range, resolution, power mA, min delay us}, or null. */
    public static float[] specs(int type) {
        Sensor s = sm().getDefaultSensor(type);
        return s == null ? null : new float[] { s.getMaximumRange(), s.getResolution(), s.getPower(), s.getMinDelay() };
    }

    /** Types of every sensor on the device. */
    public static int[] types() {
        List<Sensor> all = sm().getSensorList(Sensor.TYPE_ALL);
        int[] t = new int[all.size()];
        for (int k = 0; k < t.length; k++) t[k] = all.get(k).getType();
        return t;
    }

    private static final HashMap<Integer, SensorEventListener> listeners = new HashMap<>();

    /** Starts readings; {@code delayUs} the wanted period (or SensorManager.SENSOR_DELAY_* 0..3). False if there is no such sensor. */
    public static synchronized boolean start(int type, int delayUs) {
        Sensor s = sm().getDefaultSensor(type);
        if (s == null) return false;
        stop(type);
        SensorEventListener l = new SensorEventListener() {
            @Override public void onSensorChanged(SensorEvent e) {
                Object[] f = new Object[3 + e.values.length];
                f[0] = e.sensor.getType();
                f[1] = e.accuracy;
                f[2] = e.timestamp;
                for (int k = 0; k < e.values.length; k++) f[3 + k] = e.values[k];
                Druid.post("sensor", f);
            }
            @Override public void onAccuracyChanged(Sensor sensor, int accuracy) {}
        };
        boolean ok = sm().registerListener(l, s, delayUs, new Handler(Looper.getMainLooper()));
        if (ok) listeners.put(type, l);
        return ok;
    }

    public static synchronized void stop(int type) {
        SensorEventListener l = listeners.remove(type);
        if (l != null) sm().unregisterListener(l);
    }

    public static synchronized void stopAll() {
        for (SensorEventListener l : listeners.values()) sm().unregisterListener(l);
        listeners.clear();
    }

    public static synchronized boolean isRunning(int type) { return listeners.containsKey(type); }
}
