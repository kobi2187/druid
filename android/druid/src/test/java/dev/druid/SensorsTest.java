package dev.druid;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import org.junit.Test;
import org.robolectric.shadows.SensorEventBuilder;
import org.robolectric.shadows.ShadowSensor;

public class SensorsTest extends DruidTestBase {
    private SensorManager sm() { return (SensorManager) app.getSystemService(Context.SENSOR_SERVICE); }

    @Test public void absentSensor() {
        assertFalse(Sensors.has(Sensor.TYPE_HEART_RATE));
        assertNull(Sensors.describe(Sensor.TYPE_HEART_RATE));
        assertNull(Sensors.specs(Sensor.TYPE_HEART_RATE));
        assertFalse(Sensors.start(Sensor.TYPE_HEART_RATE, SensorManager.SENSOR_DELAY_UI));
        assertFalse(Sensors.isRunning(Sensor.TYPE_HEART_RATE));
    }

    @Test public void presentSensorFacts() {
        Sensor light = ShadowSensor.newInstance(Sensor.TYPE_LIGHT);
        shadowOf(light).setName("Light X");
        shadowOf(light).setMaximumRange(1000f);
        shadowOf(sm()).addSensor(light);
        assertTrue(Sensors.has(Sensor.TYPE_LIGHT));
        assertEquals("Light X", Sensors.describe(Sensor.TYPE_LIGHT)[0]);
        assertEquals(1000f, Sensors.specs(Sensor.TYPE_LIGHT)[0], 0);
        assertEquals(4, Sensors.specs(Sensor.TYPE_LIGHT).length);
        boolean listed = false;
        for (int t : Sensors.types()) listed |= t == Sensor.TYPE_LIGHT;
        assertTrue(listed);
    }

    @Test public void readingsAreEventsUntilStopped() {
        Sensor gyro = ShadowSensor.newInstance(Sensor.TYPE_GYROSCOPE);
        shadowOf(sm()).addSensor(gyro);
        assertTrue(Sensors.start(Sensor.TYPE_GYROSCOPE, 20_000));
        assertTrue(Sensors.start(Sensor.TYPE_GYROSCOPE, 20_000));     // restart: one listener
        assertEquals(1, shadowOf(sm()).getListeners().size());
        shadowOf(sm()).sendSensorEventToListeners(SensorEventBuilder.newBuilder()
            .setSensor(gyro).setValues(new float[] { 1f, 2f, 3f }).setAccuracy(2).setTimestamp(42).build());
        java.util.List<String[]> ev = events("sensor");
        assertArrayEquals(new String[] { "sensor", "4", "2", "42", "1.0", "2.0", "3.0" }, ev.get(0));
        Sensors.stop(Sensor.TYPE_GYROSCOPE);
        assertFalse(Sensors.isRunning(Sensor.TYPE_GYROSCOPE));
        assertEquals(0, shadowOf(sm()).getListeners().size());
    }

    @Test public void stopAll() {
        shadowOf(sm()).addSensor(ShadowSensor.newInstance(Sensor.TYPE_ACCELEROMETER));
        shadowOf(sm()).addSensor(ShadowSensor.newInstance(Sensor.TYPE_PROXIMITY));
        Sensors.start(Sensor.TYPE_ACCELEROMETER, SensorManager.SENSOR_DELAY_GAME);
        Sensors.start(Sensor.TYPE_PROXIMITY, SensorManager.SENSOR_DELAY_NORMAL);
        Sensors.stopAll();
        assertEquals(0, shadowOf(sm()).getListeners().size());
    }
}
