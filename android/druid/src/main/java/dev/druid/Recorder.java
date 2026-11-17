package dev.druid;

import android.Manifest;
import android.content.pm.PackageManager;
import android.media.MediaRecorder;
import android.os.Build;
import android.os.SystemClock;
import java.io.File;

/**
 * Records the microphone to a file (AAC in MPEG-4: .m4a). Needs RECORD_AUDIO.
 * A "recording" event reports how it ended: ("stopped" | "limit" | "error",
 * path, duration ms, detail) -- "limit" when maxDurationMs was reached.
 */
public final class Recorder {
    private Recorder() {}

    private static MediaRecorder rec;
    private static String path;
    private static long startedAt;

    static void requirePermission(String permission) {
        if (Druid.context().checkSelfPermission(permission) != PackageManager.PERMISSION_GRANTED) {
            throw new SecurityException("needs the " + permission.substring(permission.lastIndexOf('.') + 1) + " permission");
        }
    }

    @SuppressWarnings("deprecation")
    public static synchronized void start(String path, int maxDurationMs, int sampleRate, int bitRate) throws Exception {
        requirePermission(Manifest.permission.RECORD_AUDIO);
        if (rec != null) throw new IllegalStateException("already recording to " + Recorder.path);
        MediaRecorder r = Build.VERSION.SDK_INT >= 31 ? new MediaRecorder(Druid.context()) : new MediaRecorder();
        try {
            r.setAudioSource(MediaRecorder.AudioSource.MIC);
            r.setOutputFormat(MediaRecorder.OutputFormat.MPEG_4);
            r.setAudioEncoder(MediaRecorder.AudioEncoder.AAC);
            r.setAudioChannels(1);
            r.setAudioSamplingRate(sampleRate);
            r.setAudioEncodingBitRate(bitRate);
            r.setOutputFile(path);
            if (maxDurationMs > 0) r.setMaxDuration(maxDurationMs);
            r.setOnInfoListener((m, what, extra) -> {
                if (what == MediaRecorder.MEDIA_RECORDER_INFO_MAX_DURATION_REACHED) finish(m, "limit", "");
            });
            r.setOnErrorListener((m, what, extra) -> finish(m, "error", "MediaRecorder error " + what));
            r.prepare();
            r.start();
        } catch (Exception e) {
            r.release();
            throw e;
        }
        rec = r;
        Recorder.path = path;
        startedAt = SystemClock.elapsedRealtime();
    }

    /** Stops recording; returns how long it was, ms. Throws if not recording. */
    public static synchronized long stop() {
        if (rec == null) throw new IllegalStateException("not recording");
        return finish(rec, "stopped", "");
    }

    /** Ends recording {@code r} (if still current) and reports it. */
    static synchronized long finish(MediaRecorder r, String how, String detail) {
        if (r != rec) return 0;
        long ms = SystemClock.elapsedRealtime() - startedAt;
        String p = path;
        rec = null;
        path = null;
        try {
            r.stop();
        } catch (RuntimeException e) {     // stopped too soon: no valid file
            new File(p).delete();
            how = "error";
            detail = "nothing recorded";
        } finally {
            r.release();
        }
        Druid.post("recording", how, p, ms, detail);
        return ms;
    }

    public static synchronized boolean isRecording() { return rec != null; }

    /** The loudest sample since the last call, 0..32767 (0 when not recording). */
    public static synchronized int amplitude() { return rec == null ? 0 : rec.getMaxAmplitude(); }

    static synchronized MediaRecorder current() { return rec; }
}
