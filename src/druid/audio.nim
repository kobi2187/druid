## Volume, ringer mode and audio routing (playback is in player.nim).
##
## ```nim
## let a = audio()
## a.setVolume(asMusic, a.maxVolume(asMusic) div 2)
## if a.ringerMode == rmSilent: ...
## ```

import bridge

type
  Audio* = object
  AudioStream* = enum
    ## AudioManager.STREAM_*.
    asVoiceCall = 0, asSystem = 1, asRing = 2, asMusic = 3, asAlarm = 4, asNotification = 5
  RingerMode* = enum
    rmSilent = 0, rmVibrate = 1, rmNormal = 2
  VolumeDirection* = enum
    vdLower = -1, vdSame = 0, vdRaise = 1

proc audio*(): Audio = discard

proc volume*(_: Audio, stream = asMusic): int = bridged(0): callStatic(int, "Audio", "volume", ord(stream))
proc maxVolume*(_: Audio, stream = asMusic): int = bridged(0): callStatic(int, "Audio", "maxVolume", ord(stream))
proc minVolume*(_: Audio, stream = asMusic): int = bridged(0): callStatic(int, "Audio", "minVolume", ord(stream))
proc setVolume*(_: Audio, stream: AudioStream, volume: int, showUi = false) =
  ## `volume` in minVolume..maxVolume. Changing the ringer volume in Do Not Disturb needs notification-policy access.
  if druidStarted(): callStatic(void, "Audio", "setVolume", ord(stream), volume, showUi)
proc adjustVolume*(_: Audio, stream: AudioStream, direction: VolumeDirection, showUi = true) =
  if druidStarted(): callStatic(void, "Audio", "adjustVolume", ord(stream), ord(direction), showUi)
proc ringerMode*(_: Audio): RingerMode =
  bridged(rmNormal):
    let m = callStatic(int, "Audio", "ringerMode")
    if m in 0..2: RingerMode(m) else: rmNormal
proc setRingerMode*(_: Audio, mode: RingerMode) =
  if druidStarted(): callStatic(void, "Audio", "setRingerMode", ord(mode))
proc isMusicActive*(_: Audio): bool = bridged(false): callStatic(bool, "Audio", "isMusicActive")
proc isMicrophoneMute*(_: Audio): bool = bridged(false): callStatic(bool, "Audio", "isMicrophoneMute")
proc setMicrophoneMute*(_: Audio, on: bool) =
  if druidStarted(): callStatic(void, "Audio", "setMicrophoneMute", on)
proc isSpeakerphoneOn*(_: Audio): bool = bridged(false): callStatic(bool, "Audio", "isSpeakerphoneOn")
proc headphonesConnected*(_: Audio): bool =
  ## Wired, USB or Bluetooth headphones are an output.
  bridged(false): callStatic(bool, "Audio", "headphonesConnected")
proc outputHints*(_: Audio): tuple[sampleRate, framesPerBuffer: int] =
  ## What the device's output prefers; open an NDK (AAudio/OpenSL) stream with
  ## these for the lowest latency. 0 when unknown.
  bridged((0, 0)):
    let h = callStatic(seq[int32], "Audio", "outputHints")
    (int(h[0]), int(h[1]))
