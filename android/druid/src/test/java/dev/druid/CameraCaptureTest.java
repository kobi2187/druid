package dev.druid;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;
import static org.robolectric.Shadows.shadowOf;

import android.Manifest;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CameraManager;
import android.hardware.camera2.CaptureResult;
import android.util.Size;
import java.io.File;
import java.nio.ByteBuffer;
import java.nio.file.Files;
import java.util.List;
import org.junit.After;
import org.junit.Test;
import org.robolectric.shadows.ShadowCameraCharacteristics;

public class CameraCaptureTest extends DruidTestBase {
    private void addCamera(String id, int facing, int orientation) {
        CameraManager cm = (CameraManager) app.getSystemService(android.content.Context.CAMERA_SERVICE);
        CameraCharacteristics c = ShadowCameraCharacteristics.newCameraCharacteristics();
        shadowOf(c).set(CameraCharacteristics.LENS_FACING, facing);
        shadowOf(c).set(CameraCharacteristics.SENSOR_ORIENTATION, orientation);
        shadowOf(cm).addCamera(id, c);
    }

    private void idleCamera() {
        shadowOf(CameraCapture.handler().getLooper()).idle();
        idle();
    }

    @After public void stop() { CameraCapture.stopFrames(); }

    @Test public void choosesTheLargestSizeWithinTheEdge() {
        Size[] s = { new Size(1920, 1080), new Size(640, 480), new Size(320, 240) };
        assertEquals(new Size(640, 480), CameraCapture.choose(s, 700));
        assertEquals(new Size(1920, 1080), CameraCapture.choose(s, 0));
        assertEquals(new Size(320, 240), CameraCapture.choose(s, 100));   // none fits: the smallest
        assertEquals(new Size(640, 480), CameraCapture.choose(null, 100));
    }

    @Test public void theDefaultCameraIsTheFirstBackOne() throws Exception {
        addCamera("1", CameraCharacteristics.LENS_FACING_FRONT, 270);
        addCamera("5", CameraCharacteristics.LENS_FACING_BACK, 90);
        assertEquals("5", CameraCapture.defaultCamera());
    }

    @Test public void noCameraNoDefault() throws Exception {
        try {
            CameraCapture.defaultCamera();
            fail();
        } catch (IllegalStateException expected) {}
    }

    @Test public void needsTheCameraPermission() throws Exception {
        addCamera("0", CameraCharacteristics.LENS_FACING_BACK, 90);
        shadowOf(app).denyPermissions(Manifest.permission.CAMERA);
        try {
            CameraCapture.takePhoto("", new File(app.getCacheDir(), "x.jpg").getPath(), 0, 1);
            fail();
        } catch (SecurityException expected) {}
        try {
            CameraCapture.startFrames("", 640, 480, 2);
            fail();
        } catch (SecurityException expected) {}
        assertFalse(CameraCapture.isStreaming());
    }

    @Test public void aPhotoOpensTheCameraAndWaitsForExposure() throws Exception {
        if (api() < 28) return;                   // Robolectric's camera device is incomplete before 9
        addCamera("0", CameraCharacteristics.LENS_FACING_BACK, 90);
        shadowOf(app).grantPermissions(Manifest.permission.CAMERA);
        CameraCapture.takePhoto("", new File(app.getCacheDir(), "x.jpg").getPath(), 1024, 3);
        idleCamera();
        // Robolectric's camera never delivers images: no answer yet, and no error.
        for (String[] e : events("photo")) assertFalse("unexpected " + String.join(",", e), e[2].equals("error"));
    }

    @Test public void anUnknownCameraThrows() throws Exception {
        shadowOf(app).grantPermissions(Manifest.permission.CAMERA);
        try {
            CameraCapture.takePhoto("7", new File(app.getCacheDir(), "x.jpg").getPath(), 0, 1);
            fail();
        } catch (Exception expected) {}
    }

    @Test public void theJpegIsWrittenAndReported() throws Exception {
        File f = new File(app.getCacheDir(), "shot.jpg");
        CameraCapture.Shot shot = new CameraCapture.Shot(9, f.getPath());
        byte[] jpeg = { (byte) 0xFF, (byte) 0xD8, 1, 2, 3, (byte) 0xFF, (byte) 0xD9 };
        CameraCapture.deliverJpeg(shot, jpeg);
        assertArrayEquals(jpeg, Files.readAllBytes(f.toPath()));
        List<String[]> ev = events("photo");
        assertEquals(1, ev.size());
        assertArrayEquals(new String[] { "photo", "9", "ok", f.getPath() }, ev.get(0));
        CameraCapture.deliverJpeg(shot, jpeg);             // once only
        assertEquals(0, events("photo").size());
    }

    @Test public void anUnwritablePathIsAnError() {
        CameraCapture.Shot shot = new CameraCapture.Shot(4, "/no/such/dir/x.jpg");
        CameraCapture.deliverJpeg(shot, new byte[] { 1 });
        List<String[]> ev = events("photo");
        assertEquals("error", ev.get(0)[2]);
        assertTrue(ev.get(0)[3].contains("FileNotFoundException"));
    }

    @Test public void warmUpWaitsForExposureThenGivesUp() {
        CameraCapture.Shot shot = new CameraCapture.Shot(5, "/x.jpg");
        CameraCapture.warmFrame(shot, 90, CaptureResult.CONTROL_AE_STATE_SEARCHING);
        assertEquals(1, shot.warmFrames);
        assertFalse(shot.captured);
        for (int k = 1; k < CameraCapture.MAX_WARM_FRAMES; k++) {
            CameraCapture.warmFrame(shot, 90, CaptureResult.CONTROL_AE_STATE_SEARCHING);
        }
        assertTrue(shot.captured);                       // waited long enough: takes it anyway
        // No session here, so taking it fails -- and says so.
        assertEquals("error", events("photo").get(0)[2]);
        CameraCapture.Shot settled = new CameraCapture.Shot(6, "/y.jpg");
        CameraCapture.warmFrame(settled, 90, CaptureResult.CONTROL_AE_STATE_CONVERGED);
        assertTrue(settled.captured);
        CameraCapture.Shot unknown = new CameraCapture.Shot(7, "/z.jpg");
        CameraCapture.warmFrame(unknown, 90, null);       // no auto-exposure: at once
        assertTrue(unknown.captured);
    }

    @Test public void framesStreamAndTheNewestIsHandedOver() throws Exception {
        if (api() < 28) return;                   // Robolectric's camera device is incomplete before 9
        addCamera("0", CameraCharacteristics.LENS_FACING_BACK, 90);
        shadowOf(app).grantPermissions(Manifest.permission.CAMERA);
        CameraCapture.startFrames("", 640, 480, 11);
        idleCamera();
        assertTrue(CameraCapture.isStreaming());
        List<String[]> ev = events("camera");
        assertEquals(1, ev.size());
        assertArrayEquals(new String[] { "camera", "11", "started", "640x480" }, ev.get(0));
        assertNull(CameraCapture.latestFrame(0));
        CameraCapture.Stream s = CameraCapture.currentStream();
        assertNotNull(s);
        byte[] packed = new byte[CameraCapture.FRAME_HEADER + 4 * 2 * 3 / 2];
        packed[CameraCapture.FRAME_HEADER] = 42;
        CameraCapture.store(s, 4, 2, packed);
        byte[] got = CameraCapture.latestFrame(0);
        ByteBuffer h = ByteBuffer.wrap(got);
        assertEquals(1L, h.getLong());
        assertEquals(4, h.getInt());
        assertEquals(2, h.getInt());
        assertEquals(90, h.getInt());
        assertEquals(42, got[CameraCapture.FRAME_HEADER]);
        assertNull(CameraCapture.latestFrame(1));          // nothing newer
        CameraCapture.stopFrames();
        assertFalse(CameraCapture.isStreaming());
        assertNull(CameraCapture.latestFrame(0));
        CameraCapture.store(s, 4, 2, packed);              // late frames are dropped
        assertNull(CameraCapture.latestFrame(0));
    }

    @Test public void startingAgainReplacesTheStream() throws Exception {
        if (api() < 28) return;                   // Robolectric's camera device is incomplete before 9
        addCamera("0", CameraCharacteristics.LENS_FACING_BACK, 90);
        shadowOf(app).grantPermissions(Manifest.permission.CAMERA);
        CameraCapture.startFrames("0", 320, 240, 1);
        CameraCapture.Stream first = CameraCapture.currentStream();
        CameraCapture.startFrames("0", 320, 240, 2);
        assertTrue(first.stopped);
        idleCamera();
        List<String[]> ev = events("camera");
        assertEquals("2", ev.get(ev.size() - 1)[1]);        // the first may have started before it was replaced
        assertEquals(2, CameraCapture.currentStream().requestId);
    }
}
