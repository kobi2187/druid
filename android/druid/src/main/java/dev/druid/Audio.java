package dev.druid;

import android.content.Context;
import android.media.AudioDeviceInfo;
import android.media.AudioManager;

/** Volume and ringer. Streams are AudioManager.STREAM_* (3 music, 4 alarm, 5 notification, 2 ring, 0 voice call). */
public final class Audio {
    private Audio() {}

    private static AudioManager am() {
        return (AudioManager) Druid.context().getSystemService(Context.AUDIO_SERVICE);
    }

    public static int volume(int stream) { return am().getStreamVolume(stream); }
    public static int maxVolume(int stream) { return am().getStreamMaxVolume(stream); }
    public static int minVolume(int stream) {
        return android.os.Build.VERSION.SDK_INT >= 28 ? am().getStreamMinVolume(stream) : 0;
    }
    /** {@code showUi}: let the system show its volume slider. */
    public static void setVolume(int stream, int volume, boolean showUi) {
        am().setStreamVolume(stream, volume, showUi ? AudioManager.FLAG_SHOW_UI : 0);
    }
    public static void adjustVolume(int stream, int direction, boolean showUi) {
        am().adjustStreamVolume(stream, direction, showUi ? AudioManager.FLAG_SHOW_UI : 0);
    }
    /** 0 silent, 1 vibrate, 2 normal. */
    public static int ringerMode() { return am().getRingerMode(); }
    public static void setRingerMode(int mode) { am().setRingerMode(mode); }
    public static boolean isMusicActive() { return am().isMusicActive(); }
    public static boolean isMicrophoneMute() { return am().isMicrophoneMute(); }
    public static void setMicrophoneMute(boolean on) { am().setMicrophoneMute(on); }
    public static boolean isSpeakerphoneOn() { return am().isSpeakerphoneOn(); }

    /** Whether headphones (wired, USB or Bluetooth) are an output right now. */
    public static boolean headphonesConnected() {
        for (AudioDeviceInfo d : am().getDevices(AudioManager.GET_DEVICES_OUTPUTS)) {
            switch (d.getType()) {
                case AudioDeviceInfo.TYPE_WIRED_HEADPHONES:
                case AudioDeviceInfo.TYPE_WIRED_HEADSET:
                case AudioDeviceInfo.TYPE_USB_HEADSET:
                case AudioDeviceInfo.TYPE_BLUETOOTH_A2DP:
                    return true;
                default:
            }
        }
        return false;
    }

    /** The output sample rate and frames per buffer the device prefers ({rate, frames}); 0 when unknown. NDK audio (AAudio) wants these. */
    public static int[] outputHints() {
        AudioManager m = am();
        return new int[] { parse(m.getProperty(AudioManager.PROPERTY_OUTPUT_SAMPLE_RATE)),
                           parse(m.getProperty(AudioManager.PROPERTY_OUTPUT_FRAMES_PER_BUFFER)) };
    }

    private static int parse(String s) {
        try { return s == null ? 0 : Integer.parseInt(s); } catch (NumberFormatException e) { return 0; }
    }
}
