package dev.druid;

import android.media.AudioAttributes;
import android.media.MediaPlayer;
import java.util.HashMap;

/**
 * Plays audio files and streams (MediaPlayer). Each player is a handle;
 * "player" events report (handle, "prepared"|"completed"|"error", detail).
 */
public final class Player {
    private Player() {}

    private static final HashMap<Integer, MediaPlayer> players = new HashMap<>();
    private static int next = 1;

    /** Loads {@code source} (a path, file://, content:// or http(s):// URL) and prepares it in the background. */
    public static synchronized int open(String source, boolean loop) throws Exception {
        MediaPlayer mp = new MediaPlayer();
        final int id = next++;
        try {
            mp.setAudioAttributes(new AudioAttributes.Builder()
                .setUsage(AudioAttributes.USAGE_MEDIA)
                .setContentType(AudioAttributes.CONTENT_TYPE_MUSIC).build());
            if (source.contains("://")) mp.setDataSource(Druid.context(), android.net.Uri.parse(source));
            else mp.setDataSource(source);
            mp.setLooping(loop);
            mp.setOnPreparedListener(p -> Druid.post("player", id, "prepared", p.getDuration()));
            mp.setOnCompletionListener(p -> Druid.post("player", id, "completed", 0));
            mp.setOnErrorListener((p, what, extra) -> { Druid.post("player", id, "error", what); return true; });
            mp.prepareAsync();
        } catch (Exception e) {
            mp.release();
            throw e;
        }
        players.put(id, mp);
        return id;
    }

    /** The MediaPlayer behind {@code id} (tests drive it through Robolectric's shadow). */
    static synchronized MediaPlayer get(int id) {
        MediaPlayer mp = players.get(id);
        if (mp == null) throw new IllegalArgumentException("no player " + id);
        return mp;
    }

    public static void play(int id) { get(id).start(); }
    public static void pause(int id) { get(id).pause(); }
    public static void seek(int id, int ms) { get(id).seekTo(ms); }
    public static void setVolume(int id, float volume) { get(id).setVolume(volume, volume); }
    public static boolean isPlaying(int id) { return get(id).isPlaying(); }
    public static int position(int id) { return get(id).getCurrentPosition(); }
    public static int duration(int id) { return get(id).getDuration(); }

    public static synchronized void close(int id) {
        MediaPlayer mp = players.remove(id);
        if (mp != null) mp.release();
    }

    public static synchronized void closeAll() {
        for (MediaPlayer mp : players.values()) mp.release();
        players.clear();
    }

    public static synchronized int count() { return players.size(); }
}
