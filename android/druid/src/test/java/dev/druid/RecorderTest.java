package dev.druid;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;
import static org.robolectric.Shadows.shadowOf;

import android.Manifest;
import android.media.MediaRecorder;
import java.io.File;
import java.util.List;
import org.junit.After;
import org.junit.Test;
import org.robolectric.shadows.ShadowMediaRecorder;

public class RecorderTest extends DruidTestBase {
    private String path() { return new File(app.getCacheDir(), "memo.m4a").getPath(); }

    @After public void stop() { if (Recorder.isRecording()) Recorder.stop(); }

    @Test public void needsTheMicrophonePermission() throws Exception {
        shadowOf(app).denyPermissions(Manifest.permission.RECORD_AUDIO);
        try {
            Recorder.start(path(), 0, 44100, 128000);
            fail();
        } catch (SecurityException e) {
            assertTrue(e.getMessage().contains("RECORD_AUDIO"));
        }
        assertFalse(Recorder.isRecording());
    }

    @Test public void recordsAacFromTheMicAndReportsTheEnd() throws Exception {
        shadowOf(app).grantPermissions(Manifest.permission.RECORD_AUDIO);
        Recorder.start(path(), 0, 22050, 64000);
        assertTrue(Recorder.isRecording());
        ShadowMediaRecorder s = shadowOf(Recorder.current());
        assertEquals(MediaRecorder.AudioSource.MIC, s.getAudioSource());
        assertEquals(MediaRecorder.AudioEncoder.AAC, s.getAudioEncoder());
        assertEquals(22050, s.getAudioSamplingRate());
        assertEquals(64000, s.getAudioEncodingBitRate());
        assertEquals(1, s.getAudioChannels());
        assertEquals(ShadowMediaRecorder.STATE_RECORDING, s.getState());
        assertTrue(Recorder.amplitude() >= 0);
        try {
            Recorder.start(path(), 0, 44100, 128000);
            fail();
        } catch (IllegalStateException expected) {}
        assertTrue(Recorder.stop() >= 0);
        assertFalse(Recorder.isRecording());
        assertEquals(0, Recorder.amplitude());
        List<String[]> ev = events("recording");
        assertEquals("stopped", ev.get(0)[1]);
        assertEquals(path(), ev.get(0)[2]);
    }

    @Test public void theLimitEndsIt() throws Exception {
        shadowOf(app).grantPermissions(Manifest.permission.RECORD_AUDIO);
        Recorder.start(path(), 5000, 44100, 128000);
        MediaRecorder r = Recorder.current();
        Recorder.finish(r, "limit", "");
        assertEquals("limit", events("recording").get(0)[1]);
        assertFalse(Recorder.isRecording());
        Recorder.finish(r, "error", "late");              // a stale callback: nothing
        assertEquals(0, events("recording").size());
    }

    @Test public void stopWithoutRecordingThrows() {
        try {
            Recorder.stop();
            fail();
        } catch (IllegalStateException expected) {}
    }
}
