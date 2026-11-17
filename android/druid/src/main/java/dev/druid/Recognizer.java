package dev.druid;

import android.Manifest;
import android.content.Intent;
import android.os.Bundle;
import android.speech.RecognitionListener;
import android.speech.RecognizerIntent;
import android.speech.SpeechRecognizer;
import java.util.ArrayList;

/**
 * Speech to text with the system's recognizer, without its dialog. Needs
 * RECORD_AUDIO. A "speech" event per step: (id, "ready"), (id, "partial",
 * text), (id, "result", best, alternatives...), (id, "error", code),
 * (id, "end").
 */
public final class Recognizer {
    private Recognizer() {}

    private static SpeechRecognizer recognizer;

    public static boolean isAvailable() { return SpeechRecognizer.isRecognitionAvailable(Druid.context()); }

    public static synchronized void start(String languageTag, boolean partial, int id) throws Exception {
        Recorder.requirePermission(Manifest.permission.RECORD_AUDIO);
        cancel();
        Intent i = new Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH)
            .putExtra(RecognizerIntent.EXTRA_LANGUAGE_MODEL, RecognizerIntent.LANGUAGE_MODEL_FREE_FORM)
            .putExtra(RecognizerIntent.EXTRA_PARTIAL_RESULTS, partial)
            .putExtra(RecognizerIntent.EXTRA_MAX_RESULTS, 5);
        if (languageTag != null && !languageTag.isEmpty()) i.putExtra(RecognizerIntent.EXTRA_LANGUAGE, languageTag);
        recognizer = Druid.onMain(() -> {
            SpeechRecognizer r = SpeechRecognizer.createSpeechRecognizer(Druid.context());
            r.setRecognitionListener(listener(id));
            r.startListening(i);
            return r;
        });
    }

    static RecognitionListener listener(int id) {
        return new RecognitionListener() {
            @Override public void onReadyForSpeech(Bundle b) { Druid.post("speech", id, "ready"); }
            @Override public void onBeginningOfSpeech() {}
            @Override public void onRmsChanged(float db) {}
            @Override public void onBufferReceived(byte[] buffer) {}
            @Override public void onEndOfSpeech() { Druid.post("speech", id, "end"); }
            @Override public void onError(int code) { Druid.post("speech", id, "error", code); }
            @Override public void onResults(Bundle b) { texts(id, "result", b); }
            @Override public void onPartialResults(Bundle b) { texts(id, "partial", b); }
            @Override public void onEvent(int type, Bundle b) {}
        };
    }

    private static void texts(int id, String kind, Bundle b) {
        ArrayList<String> t = b == null ? null : b.getStringArrayList(SpeechRecognizer.RESULTS_RECOGNITION);
        ArrayList<Object> f = new ArrayList<>();
        f.add(id);
        f.add(kind);
        if (t != null) f.addAll(t);
        Druid.post("speech", f.toArray());
    }

    /** Stops listening and gives the result for what was heard. */
    public static synchronized void stop() throws Exception {
        SpeechRecognizer r = recognizer;
        if (r != null) Druid.onMain(r::stopListening);
    }

    /** Stops without a result. */
    public static synchronized void cancel() throws Exception {
        SpeechRecognizer r = recognizer;
        recognizer = null;
        if (r != null) Druid.onMain(() -> { r.cancel(); r.destroy(); });
    }

    public static synchronized boolean isListening() { return recognizer != null; }
}
