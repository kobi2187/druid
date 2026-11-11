package dev.druid;

import android.content.Context;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CameraManager;

/** The device's cameras and their facts, and the torch. */
public final class Camera {
    private Camera() {}

    private static CameraManager cm() {
        return (CameraManager) Druid.context().getSystemService(Context.CAMERA_SERVICE);
    }

    public static String[] ids() throws Exception { return cm().getCameraIdList(); }

    /** CameraCharacteristics.LENS_FACING_* (0 front, 1 back, 2 external), or -1. */
    public static int facing(String id) throws Exception {
        Integer f = cm().getCameraCharacteristics(id).get(CameraCharacteristics.LENS_FACING);
        return f == null ? -1 : f;
    }

    public static boolean hasFlash(String id) throws Exception {
        Boolean f = cm().getCameraCharacteristics(id).get(CameraCharacteristics.FLASH_INFO_AVAILABLE);
        return f != null && f;
    }

    /** Degrees the sensor image must be rotated to be upright on the natural display orientation, or -1. */
    public static int sensorOrientation(String id) throws Exception {
        Integer o = cm().getCameraCharacteristics(id).get(CameraCharacteristics.SENSOR_ORIENTATION);
        return o == null ? -1 : o;
    }

    /** Turns the flash of {@code id} on or off as a torch (no CAMERA permission needed). */
    public static void setTorch(String id, boolean on) throws Exception { cm().setTorchMode(id, on); }
}
