package dev.druid;

import android.os.Bundle;
import android.speech.tts.TextToSpeech;
import android.speech.tts.UtteranceProgressListener;
import java.util.Locale;

/**
 * Text to speech. {@link #open} starts the engine; a "tts" event says
 * ("ready", "", status) or ("error", "", status). Then each utterance is
 * ("start" | "done" | "error", utterance id, code).
 */
public final class Tts {
    private Tts() {}

    private static TextToSpeech tts;
    private static volatile boolean ready;

    public static synchronized void open() throws Exception {
        if (tts != null) return;
        tts = Druid.onMain(() -> new TextToSpeech(Druid.context(), status -> {
            ready = status == TextToSpeech.SUCCESS;
            Druid.post("tts", ready ? "ready" : "error", "", status);
        }));
        tts.setOnUtteranceProgressListener(new UtteranceProgressListener() {
            @Override public void onStart(String id) { Druid.post("tts", "start", id, 0); }
            @Override public void onDone(String id) { Druid.post("tts", "done", id, 0); }
            @Override @SuppressWarnings("deprecation") public void onError(String id) { Druid.post("tts", "error", id, -1); }
            @Override public void onError(String id, int code) { Druid.post("tts", "error", id, code); }
            @Override public void onStop(String id, boolean interrupted) { Druid.post("tts", "stopped", id, 0); }
        });
    }

    private static TextToSpeech engine() {
        if (tts == null || !ready) throw new IllegalStateException("text to speech is not ready (open it, wait for \"ready\")");
        return tts;
    }

    public static boolean isReady() { return tts != null && ready; }

    /**
     * {@code languageTag} like "en-US": TextToSpeech.LANG_* -- 0 or more is
     * available, -1 its data is missing, -2 not supported.
     */
    public static int setLanguage(String languageTag) {
        return engine().setLanguage(Locale.forLanguageTag(languageTag));
    }

    /** Speaks {@code text}, after what is queued or ({@code flush}) instead of it. Returns false if refused. */
    public static boolean speak(String text, String utteranceId, boolean flush, float rate, float pitch) {
        TextToSpeech t = engine();
        t.setSpeechRate(rate);
        t.setPitch(pitch);
        return t.speak(text, flush ? TextToSpeech.QUEUE_FLUSH : TextToSpeech.QUEUE_ADD, new Bundle(), utteranceId)
            == TextToSpeech.SUCCESS;
    }

    public static boolean isSpeaking() { return tts != null && tts.isSpeaking(); }

    public static void stop() { if (tts != null) tts.stop(); }

    public static synchronized void close() {
        if (tts == null) return;
        tts.shutdown();
        tts = null;
        ready = false;
    }
}
