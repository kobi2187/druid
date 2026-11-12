package dev.druid;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.app.ActivityManager;
import android.app.DownloadManager;
import android.content.Context;
import android.content.Intent;
import android.hardware.biometrics.BiometricManager;
import org.junit.Test;
import org.robolectric.shadow.api.Shadow;
import org.robolectric.shadows.ShadowBiometricManager;
import org.robolectric.shadows.ShadowMediaPlayer;
import org.robolectric.shadows.util.DataSource;

/** Player, Biometric, Downloads and Memory. */
public class MediaTest extends DruidTestBase {
    private int prepared(String path, int durationMs) throws Exception {
        ShadowMediaPlayer.addMediaInfo(DataSource.toDataSource(path), new ShadowMediaPlayer.MediaInfo(durationMs, 0));
        int id = Player.open(path, false);
        idle();
        return id;
    }

    @Test public void playerLifecycle() throws Exception {
        int id = prepared("/sdcard/a.ogg", 3000);
        assertArrayEquals(new String[] { "player", String.valueOf(id), "prepared", "3000" }, events("player").get(0));
        assertEquals(3000, Player.duration(id));
        Player.play(id);
        assertTrue(Player.isPlaying(id));
        Player.seek(id, 1000);
        idle();
        assertEquals(1000, Player.position(id));
        Player.setVolume(id, 0.5f);
        Player.pause(id);
        assertFalse(Player.isPlaying(id));
        assertEquals(1, Player.count());
        Player.close(id);
        assertEquals(0, Player.count());
        Player.close(id);                                   // twice: fine
    }

    @Test public void completionAndErrorAreEvents() throws Exception {
        int id = prepared("/sdcard/b.ogg", 100);
        events("player");
        Player.play(id);
        shadowOf(Player.get(id)).invokeCompletionListener();
        shadowOf(Player.get(id)).invokeErrorListener(1, 2);
        java.util.List<String[]> ev = events("player");
        assertEquals("completed", ev.get(0)[2]);
        assertEquals("error", ev.get(1)[2]);
        assertEquals("1", ev.get(1)[3]);
    }

    @Test public void loopingAndUris() throws Exception {
        String uri = "https://example.com/s.mp3";
        ShadowMediaPlayer.addMediaInfo(DataSource.toDataSource(app, android.net.Uri.parse(uri)),
                                       new ShadowMediaPlayer.MediaInfo(10, 0));
        int id = Player.open(uri, true);
        assertTrue(Player.get(id).isLooping());
    }

    @Test(expected = IllegalArgumentException.class)
    public void unknownPlayer() { Player.play(12345); }

    @Test public void biometricBeforeAndroid10() throws Exception {
        org.junit.Assume.assumeTrue(api() < 29);
        assertEquals(-2, Biometric.canAuthenticate());              // unknown: no BiometricManager
        assertEquals(api() >= 28, Biometric.authenticate(3, "T", "", ""));   // BiometricPrompt is 9+
        Biometric.cancel(3);
    }

    @Test public void biometricAvailability() {
        org.junit.Assume.assumeTrue(api() >= 29);
        BiometricManager bm = app.getSystemService(BiometricManager.class);
        ShadowBiometricManager s = Shadow.extract(bm);
        s.setCanAuthenticate(true);
        assertEquals(BiometricManager.BIOMETRIC_SUCCESS, Biometric.canAuthenticate());
        s.setCanAuthenticate(false);
        assertNotEquals(BiometricManager.BIOMETRIC_SUCCESS, Biometric.canAuthenticate());
    }

    @Test public void biometricPromptAndCancel() throws Exception {
        org.junit.Assume.assumeTrue(api() >= 28);
        assertTrue(Biometric.authenticate(7, "Unlock", "sub", "No"));
        assertTrue(Biometric.isRunning(7));
        Biometric.cancel(7);
        assertFalse(Biometric.isRunning(7));
        Biometric.cancel(7);                                // twice: fine
    }

    @Test public void biometricAnswersAreEvents() throws Exception {
        org.junit.Assume.assumeTrue(api() >= 28);
        Biometric.authenticate(8, "Unlock", "", "");
        android.hardware.biometrics.BiometricPrompt.AuthenticationCallback cb = Biometric.callbackFor(8);
        cb.onAuthenticationFailed();                        // one try: the prompt stays
        assertTrue(Biometric.isRunning(8));
        cb.onAuthenticationSucceeded(null);
        assertFalse(Biometric.isRunning(8));
        cb.onAuthenticationError(7, "Too many attempts");
        cb.onAuthenticationError(5, null);
        Biometric.cancelled(9);
        java.util.List<String[]> ev = events("biometric");
        assertArrayEquals(new String[] { "biometric", "8", "failed", "0", "" }, ev.get(0));
        assertArrayEquals(new String[] { "biometric", "8", "succeeded", "0", "" }, ev.get(1));
        assertArrayEquals(new String[] { "biometric", "8", "error", "7", "Too many attempts" }, ev.get(2));
        assertArrayEquals(new String[] { "biometric", "8", "error", "5", "" }, ev.get(3));
        assertArrayEquals(new String[] { "biometric", "9", "error", "13", "cancelled" }, ev.get(4));
    }

    @Test public void downloads() {
        long id = Downloads.enqueue("https://example.com/f.bin", "f.bin", "File", true);
        DownloadManager dm = (DownloadManager) app.getSystemService(Context.DOWNLOAD_SERVICE);
        DownloadManager.Request r = shadowOf(dm).getRequest(id);
        assertNotNull(r);
        long[] st = Downloads.status(id);
        assertEquals(3, st.length);
        assertNotNull(Downloads.localUri(id));
        app.sendBroadcast(new Intent(DownloadManager.ACTION_DOWNLOAD_COMPLETE).putExtra(DownloadManager.EXTRA_DOWNLOAD_ID, id));
        idle();
        assertEquals(String.valueOf(id), events("download").get(0)[1]);
        Downloads.remove(id);
        assertArrayEquals(new long[] { 0, 0, -1 }, Downloads.status(424242));
        assertEquals("", Downloads.localUri(424242));
    }

    @Test public void memory() {
        ActivityManager am = (ActivityManager) app.getSystemService(Context.ACTIVITY_SERVICE);
        shadowOf(am).setMemoryClass(256);
        shadowOf(am).setIsLowRamDevice(true);
        assertEquals(256, Memory.memoryClass());
        assertTrue(Memory.largeMemoryClass() >= 0);
        assertTrue(Memory.isLowRamDevice());
        long[] heap = Memory.javaHeap();
        assertTrue(heap[0] > 0 && heap[1] >= heap[0]);
        assertEquals(4, Memory.info().length);
    }
}
