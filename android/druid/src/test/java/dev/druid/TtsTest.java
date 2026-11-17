package dev.druid;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;
import static org.robolectric.Shadows.shadowOf;

import android.speech.tts.TextToSpeech;
import java.util.List;
import java.util.Locale;
import org.junit.After;
import org.junit.Test;
import org.robolectric.shadows.ShadowTextToSpeech;

public class TtsTest extends DruidTestBase {
    @After public void close() {
        Tts.close();
        ShadowTextToSpeech.reset();
    }

    private ShadowTextToSpeech opened(int status) throws Exception {
        Tts.open();
        TextToSpeech t = ShadowTextToSpeech.getLastTextToSpeechInstance();
        ShadowTextToSpeech s = shadowOf(t);
        s.getOnInitListener().onInit(status);
        return s;
    }

    @Test public void speaksOnceReady() throws Exception {
        try {
            Tts.speak("too early", "u0", false, 1, 1);
            fail();
        } catch (IllegalStateException expected) {}
        ShadowTextToSpeech s = opened(TextToSpeech.SUCCESS);
        assertArrayEquals(new String[] { "tts", "ready", "", "0" }, events("tts").get(0));
        assertTrue(Tts.isReady());
        assertTrue(Tts.speak("Hello from Nim", "u1", true, 1.5f, 0.8f));
        assertEquals("Hello from Nim", s.getLastSpokenText());
        assertEquals(TextToSpeech.QUEUE_FLUSH, s.getQueueMode());
        s.getUtteranceProgressListener().onStart("u1");
        s.getUtteranceProgressListener().onDone("u1");
        s.getUtteranceProgressListener().onError("u2", -4);
        s.getUtteranceProgressListener().onStop("u3", true);
        List<String[]> ev = events("tts");
        assertEquals("start|u1,done|u1,error|u2,stopped|u3",
            ev.get(0)[1] + "|" + ev.get(0)[2] + "," + ev.get(1)[1] + "|" + ev.get(1)[2] + ","
            + ev.get(2)[1] + "|" + ev.get(2)[2] + "," + ev.get(3)[1] + "|" + ev.get(3)[2]);
        assertEquals("-4", ev.get(2)[3]);
        Tts.stop();
        assertTrue(s.isStopped());
        assertFalse(Tts.isSpeaking());
        Tts.close();
        assertTrue(s.isShutdown());
        assertFalse(Tts.isReady());
    }

    @Test public void languages() throws Exception {
        opened(TextToSpeech.SUCCESS);
        ShadowTextToSpeech.addLanguageAvailability(Locale.FRANCE);
        assertTrue(Tts.setLanguage("fr-FR") >= 0);
        assertTrue(Tts.setLanguage("xx-YY") < 0);
    }

    @Test public void anEngineThatFailsSaysSo() throws Exception {
        opened(TextToSpeech.ERROR);
        assertArrayEquals(new String[] { "tts", "error", "", "-1" }, events("tts").get(0));
        assertFalse(Tts.isReady());
    }

    @Test public void openTwiceIsOneEngine() throws Exception {
        Tts.open();
        TextToSpeech first = ShadowTextToSpeech.getLastTextToSpeechInstance();
        Tts.open();
        assertEquals(first, ShadowTextToSpeech.getLastTextToSpeechInstance());
    }
}
