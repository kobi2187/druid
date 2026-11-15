package dev.druid;

import android.content.Context;
import android.graphics.ImageFormat;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CameraManager;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.TotalCaptureResult;
import android.hardware.camera2.params.StreamConfigurationMap;
import android.media.Image;
import android.media.ImageReader;
import android.os.Handler;
import android.os.HandlerThread;
import android.util.Size;
import java.io.FileOutputStream;
import java.nio.ByteBuffer;
import java.util.Arrays;

/**
 * Pictures and live frames from Camera2, with no UI: the app draws (RUI shows
 * frames as a texture). Needs the CAMERA permission.
 *
 * <p>{@link #takePhoto}: the camera warms up (auto-exposure and focus settle on
 * a small stream), then one JPEG is written to a file; a "photo" event says
 * (request id, "ok", path) or (request id, "error", message).
 *
 * <p>{@link #startFrames}: frames stream into a buffer; {@link #latestFrame}
 * hands the newest one over as I420 (Y, then U, then V planes, tightly packed)
 * with a header, and the Nim side converts it to RGBA. Only the newest frame is
 * kept: a slow reader skips frames instead of falling behind.
 */
public final class CameraCapture {
    private CameraCapture() {}

    private static HandlerThread thread;
    private static Handler handler;

    /** Camera callbacks run here, off the main thread. */
    static synchronized Handler handler() {
        if (handler == null) {
            thread = new HandlerThread("druid-camera");
            thread.start();
            handler = new Handler(thread.getLooper());
        }
        return handler;
    }

    private static CameraManager cm() {
        return (CameraManager) Druid.context().getSystemService(Context.CAMERA_SERVICE);
    }

    /** The default camera: the first back-facing one, else the first. */
    public static String defaultCamera() throws CameraAccessException {
        String[] ids = cm().getCameraIdList();
        for (String id : ids) {
            Integer f = cm().getCameraCharacteristics(id).get(CameraCharacteristics.LENS_FACING);
            if (f != null && f == CameraCharacteristics.LENS_FACING_BACK) return id;
        }
        if (ids.length == 0) throw new IllegalStateException("this device has no camera");
        return ids[0];
    }

    /** The largest of {@code sizes} whose longer side is at most {@code maxEdge} (0: the largest), else the smallest. */
    static Size choose(Size[] sizes, int maxEdge) {
        if (sizes == null || sizes.length == 0) return new Size(640, 480);
        Size best = null, smallest = sizes[0];
        for (Size s : sizes) {
            long area = (long) s.getWidth() * s.getHeight();
            if (area < (long) smallest.getWidth() * smallest.getHeight()) smallest = s;
            if (maxEdge > 0 && Math.max(s.getWidth(), s.getHeight()) > maxEdge) continue;
            if (best == null || area > (long) best.getWidth() * best.getHeight()) best = s;
        }
        return best != null ? best : smallest;
    }

    /** Android throws at openCamera; checked first so nothing is left half made. */
    private static void requirePermission() {
        if (Druid.context().checkSelfPermission(android.Manifest.permission.CAMERA)
                != android.content.pm.PackageManager.PERMISSION_GRANTED) {
            throw new SecurityException("needs the CAMERA permission");
        }
    }

    private static Size[] sizes(String id, int format) throws CameraAccessException {
        StreamConfigurationMap map = cm().getCameraCharacteristics(id)
            .get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP);
        return map == null ? null : map.getOutputSizes(format);
    }

    private static int sensorOrientation(String id) throws CameraAccessException {
        Integer o = cm().getCameraCharacteristics(id).get(CameraCharacteristics.SENSOR_ORIENTATION);
        return o == null ? 0 : o;
    }

    // ---- photos ----

    /** One photo in progress: the camera, its two readers, and where it goes. */
    static final class Shot {
        final int requestId;
        final String path;
        CameraDevice device;
        CameraCaptureSession session;
        ImageReader preview, jpeg;
        int warmFrames;
        boolean captured, done;
        Shot(int requestId, String path) { this.requestId = requestId; this.path = path; }

        synchronized void finish(String outcome, String detail) {
            if (done) return;
            done = true;
            try { if (session != null) session.close(); } catch (RuntimeException ignored) {}
            try { if (device != null) device.close(); } catch (RuntimeException ignored) {}
            if (preview != null) preview.close();
            if (jpeg != null) jpeg.close();
            Druid.post("photo", requestId, outcome, detail);
        }
    }

    /** Frames of auto-exposure to wait for at most, before taking the picture anyway. */
    static final int MAX_WARM_FRAMES = 30;

    /**
     * Takes a picture with camera {@code cameraId} ("" for the default) and writes it
     * to {@code path} as JPEG, no larger than {@code maxEdge} pixels on its longer
     * side (0: the camera's largest). The answer is a "photo" event.
     */
    public static void takePhoto(String cameraId, String path, int maxEdge, int requestId) throws Exception {
        requirePermission();
        String id = cameraId == null || cameraId.isEmpty() ? defaultCamera() : cameraId;
        Size big = choose(sizes(id, ImageFormat.JPEG), maxEdge);
        Size small = choose(sizes(id, ImageFormat.YUV_420_888), 640);
        int orientation = sensorOrientation(id);
        Shot shot = new Shot(requestId, path);
        shot.jpeg = ImageReader.newInstance(big.getWidth(), big.getHeight(), ImageFormat.JPEG, 1);
        shot.preview = ImageReader.newInstance(small.getWidth(), small.getHeight(), ImageFormat.YUV_420_888, 2);
        shot.preview.setOnImageAvailableListener(r -> {
            Image i = r.acquireLatestImage();
            if (i != null) i.close();
        }, handler());
        shot.jpeg.setOnImageAvailableListener(r -> {
            Image i = r.acquireLatestImage();
            if (i == null) return;
            try {
                ByteBuffer buf = i.getPlanes()[0].getBuffer();
                byte[] bytes = new byte[buf.remaining()];
                buf.get(bytes);
                deliverJpeg(shot, bytes);
            } finally {
                i.close();
            }
        }, handler());
        // Throws SecurityException at once without the CAMERA permission.
        try {
            cm().openCamera(id, new CameraDevice.StateCallback() {
                @Override public void onOpened(CameraDevice d) {
                    shot.device = d;
                    try { configure(shot, orientation); }
                    catch (Exception e) { shot.finish("error", e.toString()); }
                }
                @Override public void onDisconnected(CameraDevice d) { d.close(); shot.finish("error", "camera disconnected"); }
                @Override public void onError(CameraDevice d, int error) { d.close(); shot.finish("error", "camera error " + error); }
            }, handler());
        } catch (Exception e) {
            shot.preview.close();
            shot.jpeg.close();
            throw e;
        }
    }

    @SuppressWarnings("deprecation")
    private static void configure(Shot shot, int orientation) throws CameraAccessException {
        shot.device.createCaptureSession(
            Arrays.asList(shot.preview.getSurface(), shot.jpeg.getSurface()),
            new CameraCaptureSession.StateCallback() {
                @Override public void onConfigured(CameraCaptureSession s) {
                    shot.session = s;
                    try { warmUp(shot, orientation); }
                    catch (Exception e) { shot.finish("error", e.toString()); }
                }
                @Override public void onConfigureFailed(CameraCaptureSession s) {
                    shot.finish("error", "the camera could not be configured");
                }
            }, handler());
    }

    /** A repeating request on the small stream until exposure settles, then the picture. */
    private static void warmUp(Shot shot, int orientation) throws CameraAccessException {
        CaptureRequest.Builder b = shot.device.createCaptureRequest(CameraDevice.TEMPLATE_PREVIEW);
        b.addTarget(shot.preview.getSurface());
        b.set(CaptureRequest.CONTROL_MODE, CaptureRequest.CONTROL_MODE_AUTO);
        shot.session.setRepeatingRequest(b.build(), new CameraCaptureSession.CaptureCallback() {
            @Override public void onCaptureCompleted(CameraCaptureSession s, CaptureRequest r, TotalCaptureResult result) {
                Integer ae = result.get(CaptureResult.CONTROL_AE_STATE);
                warmFrame(shot, orientation, ae);
            }
        }, handler());
    }

    /** One frame of warm-up seen; takes the picture once exposure has settled or enough frames passed. */
    static void warmFrame(Shot shot, int orientation, Integer aeState) {
        synchronized (shot) {
            if (shot.captured || shot.done) return;
            shot.warmFrames++;
            boolean settled = aeState == null
                || aeState == CaptureResult.CONTROL_AE_STATE_CONVERGED
                || aeState == CaptureResult.CONTROL_AE_STATE_FLASH_REQUIRED
                || aeState == CaptureResult.CONTROL_AE_STATE_LOCKED;
            if (!settled && shot.warmFrames < MAX_WARM_FRAMES) return;
            shot.captured = true;
        }
        try {
            shot.session.stopRepeating();
            CaptureRequest.Builder b = shot.device.createCaptureRequest(CameraDevice.TEMPLATE_STILL_CAPTURE);
            b.addTarget(shot.jpeg.getSurface());
            b.set(CaptureRequest.JPEG_ORIENTATION, orientation);
            b.set(CaptureRequest.JPEG_QUALITY, (byte) 92);
            shot.session.capture(b.build(), null, handler());
        } catch (Exception e) {
            shot.finish("error", e.toString());
        }
    }

    /** The JPEG arrived: written to its file, and the shot finished. */
    static void deliverJpeg(Shot shot, byte[] bytes) {
        try (FileOutputStream out = new FileOutputStream(shot.path)) {
            out.write(bytes);
            shot.finish("ok", shot.path);
        } catch (Exception e) {
            shot.finish("error", e.toString());
        }
    }

    // ---- frames ----

    /** A stream of frames: the camera, its reader, and the newest frame. */
    static final class Stream {
        CameraDevice device;
        CameraCaptureSession session;
        ImageReader reader;
        int requestId, rotation;
        long seq;
        byte[] latest;           // header + I420
        boolean stopped;
    }

    private static Stream stream;

    /** Header of {@link #latestFrame}: sequence (8 bytes), width, height, rotation (4 each), big-endian. */
    public static final int FRAME_HEADER = 20;

    /**
     * Starts streaming frames from {@code cameraId} ("" for the default) at about
     * {@code width} x {@code height}. A "camera" event says (request id, "started",
     * "WxH") or (request id, "error", message).
     */
    public static synchronized void startFrames(String cameraId, int width, int height, int requestId) throws Exception {
        stopFrames();
        requirePermission();
        String id = cameraId == null || cameraId.isEmpty() ? defaultCamera() : cameraId;
        Size size = choose(sizes(id, ImageFormat.YUV_420_888), Math.max(width, height));
        Stream s = new Stream();
        s.requestId = requestId;
        s.rotation = sensorOrientation(id);
        s.reader = ImageReader.newInstance(size.getWidth(), size.getHeight(), ImageFormat.YUV_420_888, 2);
        s.reader.setOnImageAvailableListener(r -> {
            Image i = r.acquireLatestImage();
            if (i == null) return;
            try { deliverFrame(s, i); } finally { i.close(); }
        }, handler());
        stream = s;
        try {
            open(id, s, size);
        } catch (Exception e) {
            stream = null;
            s.stopped = true;
            s.reader.close();
            throw e;
        }
    }

    private static void open(String id, Stream s, Size size) throws Exception {
        cm().openCamera(id, new CameraDevice.StateCallback() {
            @Override public void onOpened(CameraDevice d) {
                synchronized (CameraCapture.class) {
                    if (s.stopped) { d.close(); return; }
                    s.device = d;
                }
                try { streamSession(s, size); }
                catch (Exception e) { streamError(s, e.toString()); }
            }
            @Override public void onDisconnected(CameraDevice d) { d.close(); streamError(s, "camera disconnected"); }
            @Override public void onError(CameraDevice d, int error) { d.close(); streamError(s, "camera error " + error); }
        }, handler());
    }

    @SuppressWarnings("deprecation")
    private static void streamSession(Stream s, Size size) throws CameraAccessException {
        s.device.createCaptureSession(Arrays.asList(s.reader.getSurface()), new CameraCaptureSession.StateCallback() {
            @Override public void onConfigured(CameraCaptureSession session) {
                synchronized (CameraCapture.class) {
                    if (s.stopped) { session.close(); return; }
                    s.session = session;
                }
                try {
                    CaptureRequest.Builder b = s.device.createCaptureRequest(CameraDevice.TEMPLATE_PREVIEW);
                    b.addTarget(s.reader.getSurface());
                    b.set(CaptureRequest.CONTROL_MODE, CaptureRequest.CONTROL_MODE_AUTO);
                    session.setRepeatingRequest(b.build(), null, handler());
                    Druid.post("camera", s.requestId, "started", size.getWidth() + "x" + size.getHeight());
                } catch (Exception e) {
                    streamError(s, e.toString());
                }
            }
            @Override public void onConfigureFailed(CameraCaptureSession session) {
                streamError(s, "the camera could not be configured");
            }
        }, handler());
    }

    private static void streamError(Stream s, String message) {
        Druid.post("camera", s.requestId, "error", message);
        synchronized (CameraCapture.class) {
            if (stream == s) stopFrames();
        }
    }

    /** A frame arrived: packed into I420 behind the header, replacing the previous one. */
    static void deliverFrame(Stream s, Image image) {
        int w = image.getWidth(), h = image.getHeight();
        byte[] out = new byte[FRAME_HEADER + w * h * 3 / 2];
        Image.Plane[] p = image.getPlanes();
        int off = FRAME_HEADER;
        off = copyPlane(p[0], w, h, out, off);
        off = copyPlane(p[1], w / 2, h / 2, out, off);
        copyPlane(p[2], w / 2, h / 2, out, off);
        store(s, w, h, out);
    }

    /** Copies one plane, dropping row padding and pixel stride, into {@code out} at {@code off}. */
    static int copyPlane(Image.Plane plane, int w, int h, byte[] out, int off) {
        ByteBuffer buf = plane.getBuffer();
        int rowStride = plane.getRowStride(), pixelStride = plane.getPixelStride();
        for (int y = 0; y < h; y++) {
            int row = y * rowStride;
            if (pixelStride == 1) {
                buf.position(row);
                buf.get(out, off, w);
                off += w;
            } else {
                for (int x = 0; x < w; x++) out[off++] = buf.get(row + x * pixelStride);
            }
        }
        return off;
    }

    /** Puts a packed frame (header space + I420) in place as the newest. */
    static synchronized void store(Stream s, int w, int h, byte[] packed) {
        if (s.stopped) return;
        s.seq++;
        ByteBuffer.wrap(packed, 0, FRAME_HEADER).putLong(s.seq).putInt(w).putInt(h).putInt(s.rotation);
        s.latest = packed;
    }

    /**
     * The newest frame if it is newer than {@code sinceSeq}, else null: a
     * {@link #FRAME_HEADER}-byte header, then I420.
     */
    public static synchronized byte[] latestFrame(long sinceSeq) {
        Stream s = stream;
        if (s == null || s.latest == null || s.seq <= sinceSeq) return null;
        return s.latest;
    }

    public static synchronized boolean isStreaming() { return stream != null && !stream.stopped; }

    public static synchronized void stopFrames() {
        Stream s = stream;
        stream = null;
        if (s == null) return;
        s.stopped = true;
        try { if (s.session != null) s.session.close(); } catch (RuntimeException ignored) {}
        try { if (s.device != null) s.device.close(); } catch (RuntimeException ignored) {}
        s.reader.close();
    }

    /** For tests: the stream in progress. */
    static synchronized Stream currentStream() { return stream; }
}
