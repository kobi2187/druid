package dev.druid;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.content.Context;
import android.media.AudioDeviceInfo;
import android.media.AudioManager;
import java.util.Collections;
import org.junit.Test;
import org.robolectric.shadows.AudioDeviceInfoBuilder;

public class AudioTest extends DruidTestBase {
    private AudioManager am() { return (AudioManager) app.getSystemService(Context.AUDIO_SERVICE); }

    @Test public void volumes() {
        shadowOf(am()).setStreamMaxVolume(15);
        assertEquals(15, Audio.maxVolume(AudioManager.STREAM_MUSIC));
        assertTrue(Audio.minVolume(AudioManager.STREAM_MUSIC) >= 0);
        Audio.setVolume(AudioManager.STREAM_MUSIC, 9, false);
        assertEquals(9, Audio.volume(AudioManager.STREAM_MUSIC));
        Audio.adjustVolume(AudioManager.STREAM_MUSIC, AudioManager.ADJUST_RAISE, false);
        assertEquals(10, Audio.volume(AudioManager.STREAM_MUSIC));
        Audio.adjustVolume(AudioManager.STREAM_MUSIC, AudioManager.ADJUST_LOWER, true);
        assertEquals(9, Audio.volume(AudioManager.STREAM_MUSIC));
    }

    @Test public void ringerAndMicrophone() {
        Audio.setRingerMode(AudioManager.RINGER_MODE_SILENT);
        assertEquals(AudioManager.RINGER_MODE_SILENT, Audio.ringerMode());
        Audio.setMicrophoneMute(true);
        assertTrue(Audio.isMicrophoneMute());
        Audio.setMicrophoneMute(false);
        assertFalse(Audio.isMicrophoneMute());
        assertFalse(Audio.isMusicActive());
        assertFalse(Audio.isSpeakerphoneOn());
    }

    @Test public void headphones() {
        shadowOf(am()).setOutputDevices(Collections.singletonList(
            AudioDeviceInfoBuilder.newBuilder().setType(AudioDeviceInfo.TYPE_BUILTIN_SPEAKER).build()));
        assertFalse(Audio.headphonesConnected());
        shadowOf(am()).setOutputDevices(Collections.singletonList(
            AudioDeviceInfoBuilder.newBuilder().setType(AudioDeviceInfo.TYPE_BLUETOOTH_A2DP).build()));
        assertTrue(Audio.headphonesConnected());
    }

    @Test public void outputHintsAreNumbers() {
        int[] h = Audio.outputHints();
        assertEquals(2, h.length);
        assertTrue(h[0] >= 0 && h[1] >= 0);
    }
}
