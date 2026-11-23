package dev.druid;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;
import static org.robolectric.Shadows.shadowOf;

import android.Manifest;
import android.os.Bundle;
import android.speech.RecognizerIntent;
import android.speech.SpeechRecognizer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.junit.After;
import org.junit.Test;
import org.robolectric.shadow.api.Shadow;
import org.robolectric.shadows.ShadowSpeechRecognizer;

public class RecognizerTest extends DruidTestBase {
    @After public void cancel() throws Exception { Recognizer.cancel(); }

    private static Bundle results(String... texts) {
        Bundle b = new Bundle();
        b.putStringArrayList(SpeechRecognizer.RESULTS_RECOGNITION, new ArrayList<>(Arrays.asList(texts)));
        return b;
    }

    @Test public void needsTheMicrophonePermission() throws Exception {
        shadowOf(app).denyPermissions(Manifest.permission.RECORD_AUDIO);
        try {
            Recognizer.start("en-US", true, 1);
            fail();
        } catch (SecurityException expected) {}
        assertFalse(Recognizer.isListening());
    }

    @Test public void listensAndReportsEachStep() throws Exception {
        shadowOf(app).grantPermissions(Manifest.permission.RECORD_AUDIO);
        Recognizer.isAvailable();
        Recognizer.start("fr-FR", true, 4);
        idle();                                  // the listener is set through the main looper
        assertTrue(Recognizer.isListening());
        SpeechRecognizer r = ShadowSpeechRecognizer.getLatestSpeechRecognizer();
        ShadowSpeechRecognizer s = Shadow.extract(r);
        assertEquals("fr-FR", s.getLastRecognizerIntent().getStringExtra(RecognizerIntent.EXTRA_LANGUAGE));
        assertTrue(s.getLastRecognizerIntent().getBooleanExtra(RecognizerIntent.EXTRA_PARTIAL_RESULTS, false));
        s.triggerOnReadyForSpeech(new Bundle());
        s.triggerOnPartialResults(results("allume"));
        s.triggerOnEndOfSpeech();
        s.triggerOnResults(results("allume la lumière", "allume les lumières"));
        s.triggerOnError(SpeechRecognizer.ERROR_NO_MATCH);
        List<String[]> ev = events("speech");
        assertArrayEquals(new String[] { "speech", "4", "ready" }, ev.get(0));
        assertArrayEquals(new String[] { "speech", "4", "partial", "allume" }, ev.get(1));
        assertArrayEquals(new String[] { "speech", "4", "end" }, ev.get(2));
        assertArrayEquals(new String[] { "speech", "4", "result", "allume la lumière", "allume les lumières" }, ev.get(3));
        assertArrayEquals(new String[] { "speech", "4", "error", "7" }, ev.get(4));
        Recognizer.stop();
        Recognizer.cancel();
        assertFalse(Recognizer.isListening());
        assertTrue(s.isDestroyed());
    }

    @Test public void emptyResultsAreStillAnEvent() throws Exception {
        shadowOf(app).grantPermissions(Manifest.permission.RECORD_AUDIO);
        Recognizer.start("", false, 2);
        idle();
        ShadowSpeechRecognizer s = Shadow.extract(ShadowSpeechRecognizer.getLatestSpeechRecognizer());
        s.triggerOnResults(new Bundle());
        assertArrayEquals(new String[] { "speech", "2", "result" }, events("speech").get(0));
    }
}
