## SDK Audio Manager - Audio playback and recording
##
## Uses Android SDK MediaPlayer API (Java)
##
## Current implementation: Basic MediaPlayer wrapper
## Full vision (from niceapi.txt): Instance-based AudioStream objects with:
##   - Dual preference system (system vs instance)
##   - Strategy pattern (MediaPlayer/AudioTrack/OpenSL ES auto-select)
##   - Multiple concurrent streams
##   - Advanced controls (seek, volume per-stream, callbacks)
##
## Provides (basic):
## - Simple audio playback from files/URIs
## - Basic controls (play, pause, stop)
## - System audio queries (ringer mode, music active, volume)
##
## TODO: Implement full AudioStream object-based API (see niceapi.txt)
## TODO: Add AudioTrack support for streaming audio
## TODO: Add audio recording support
## TODO: Add OpenSL ES NDK variant for low-latency
## TODO: Add audio device detection (headphones, Bluetooth)
## TODO: Add audio focus management callbacks

import ../../../core
import ../../../art  # For API level detection
import jnim
import options
import tables

# jnimport:
#   import android.content.Context
#   import android.media.MediaPlayer
#   import android.media.AudioManager as JAM
#   import android.net.Uri
#   import java.io.File
# 
type
  RingerMode* = enum
    ## System ringer modes
    rmSilent = 0      ## Silent mode (no sound, no vibration)
    rmVibrate = 1     ## Vibrate mode
    rmNormal = 2      ## Normal mode (sound enabled)

  AudioStreamType* = enum
    ## Audio stream types
    astVoiceCall = 0      ## Voice call stream
    astSystem = 1         ## System sounds
    astRing = 2           ## Ringer stream
    astMusic = 3          ## Music playback
    astAlarm = 4          ## Alarm stream
    astNotification = 5   ## Notification stream
    astDtmf = 8           ## DTMF tones

  SimpleAudioPlayer* = ref object
    ## Simple audio player (basic implementation)
    ## TODO: Replace with full AudioStream from niceapi.txt
    mediaPlayer: jobject
    filePath: string
    isPlaying: bool

  SdkAudioManager* = ref object
    context: jobject
    audioManager: jobject
    apiLevel: int
    activePlayers: Table[string, SimpleAudioPlayer]
    # TODO: Add systemPrefs when implementing preference system
    # systemPrefs*: AudioSystemPrefs

proc init*(_: typedesc[SdkAudioManager]): SdkAudioManager =
  ## Initialize SdkAudioManager
  result = SdkAudioManager()
  result.context = getContext()
  result.apiLevel = detectApiLevel()
  result.activePlayers = initTable[string, SimpleAudioPlayer]()

  # Get AudioManager system service
  let serviceName = "audio".toJString
  result.audioManager = result.context.getSystemService(serviceName)

# System Audio Queries

proc getRingerMode*(am: SdkAudioManager): RingerMode =
  ## Get current system ringer mode
  ##
  ## Returns:
  ##   Current ringer mode
  ##
  ## Example:
  ##   case audio().getRingerMode():
  ##   of rmSilent:
  ##     echo "Phone is silent"
  ##   of rmVibrate:
  ##     echo "Phone is on vibrate"
  ##   of rmNormal:
  ##     echo "Phone ringer is on"

  let mode = am.audioManager.call("getRingerMode").intVal
  return RingerMode(mode)

proc setRingerMode*(am: SdkAudioManager, mode: RingerMode) =
  ## Set system ringer mode
  ##
  ## REQUIRES: android.permission.ACCESS_NOTIFICATION_POLICY (API 23+)
  ## On API 23+, may need Do Not Disturb permission
  ##
  ## Args:
  ##   mode: Desired ringer mode
  ##
  ## Example:
  ##   audio().setRingerMode(rmVibrate)

  am.audioManager.call("setRingerMode", mode.int.jint)

proc getStreamVolume*(am: SdkAudioManager, streamType: AudioStreamType): int =
  ## Get volume for audio stream type
  ##
  ## Args:
  ##   streamType: Type of audio stream
  ##
  ## Returns:
  ##   Volume level (0 to max)
  ##
  ## Example:
  ##   let musicVol = audio().getStreamVolume(astMusic)
  ##   echo "Music volume: ", musicVol

  return am.audioManager.call("getStreamVolume",
    streamType.int.jint).intVal

proc getStreamMaxVolume*(am: SdkAudioManager, streamType: AudioStreamType): int =
  ## Get maximum volume for audio stream type
  ##
  ## Args:
  ##   streamType: Type of audio stream
  ##
  ## Returns:
  ##   Maximum volume level
  ##
  ## Example:
  ##   let maxVol = audio().getStreamMaxVolume(astMusic)

  return am.audioManager.call("getStreamMaxVolume",
    streamType.int.jint).intVal

proc setStreamVolume*(am: SdkAudioManager,
                      streamType: AudioStreamType,
                      volume: int,
                      showUI: bool = false) =
  ## Set volume for audio stream type
  ##
  ## Args:
  ##   streamType: Type of audio stream
  ##   volume: Volume level (0 to max from getStreamMaxVolume)
  ##   showUI: Show volume UI to user
  ##
  ## Example:
  ##   let maxVol = audio().getStreamMaxVolume(astMusic)
  ##   audio().setStreamVolume(astMusic, maxVol div 2)  # Set to 50%

  let flags = if showUI: 1.jint else: 0.jint
  am.audioManager.call("setStreamVolume",
    streamType.int.jint,
    volume.jint,
    flags)

proc isMusicActive*(am: SdkAudioManager): bool =
  ## Check if music is currently playing (any app)
  ##
  ## Returns:
  ##   true if music is active
  ##
  ## Example:
  ##   if not audio().isMusicActive():
  ##     playBackgroundMusic()

  return am.audioManager.call("isMusicActive").boolVal

proc isSpeakerphoneOn*(am: SdkAudioManager): bool =
  ## Check if speakerphone is on
  ##
  ## Returns:
  ##   true if speakerphone is active
  if am.apiLevel >= 5:
    return am.audioManager.call("isSpeakerphoneOn").boolVal
  return false

proc setSpeakerphoneOn*(am: SdkAudioManager, on: bool) =
  ## Turn speakerphone on or off
  ##
  ## Args:
  ##   on: true to enable speakerphone
  ##
  ## Example:
  ##   audio().setSpeakerphoneOn(true)

  am.audioManager.call("setSpeakerphoneOn", on.jboolean)

# Simple Audio Playback
# TODO: Replace with full AudioStream object-based API

proc playSound*(am: SdkAudioManager, filePath: string): SimpleAudioPlayer =
  ## Play audio file (simple, fire-and-forget style)
  ##
  ## This is a SIMPLIFIED implementation. Full version from niceapi.txt
  ## would return controllable AudioStream object.
  ##
  ## Args:
  ##   filePath: Path to audio file
  ##
  ## Returns:
  ##   SimpleAudioPlayer (basic controls only)
  ##
  ## Example:
  ##   let player = audio().playSound("/sdcard/Music/song.mp3")
  ##
  ## TODO: Implement full AudioStream with preferences and callbacks

  # Create MediaPlayer
  let mediaPlayer = MediaPlayer.new()

  # Set data source
  mediaPlayer.call("setDataSource", filePath.toJString)

  # Prepare and start
  mediaPlayer.call("prepare")
  mediaPlayer.call("start")

  result = SimpleAudioPlayer(
    mediaPlayer: mediaPlayer,
    filePath: filePath,
    isPlaying: true
  )

proc playSoundUri*(am: SdkAudioManager, uri: string): SimpleAudioPlayer =
  ## Play audio from URI (http://, content://, etc.)
  ##
  ## Args:
  ##   uri: URI string
  ##
  ## Returns:
  ##   SimpleAudioPlayer
  ##
  ## Example:
  ##   let player = audio().playSoundUri("content://media/external/audio/media/123")

  let juri = Uri.call("parse", uri.toJString)
  let mediaPlayer = MediaPlayer.call("create", am.context, juri)

  if not mediaPlayer.isNil:
    mediaPlayer.call("start")

  result = SimpleAudioPlayer(
    mediaPlayer: mediaPlayer,
    filePath: uri,
    isPlaying: true
  )

proc pause*(player: SimpleAudioPlayer) =
  ## Pause playback
  ##
  ## Example:
  ##   player.pause()

  if not player.mediaPlayer.isNil and player.isPlaying:
    player.mediaPlayer.call("pause")
    player.isPlaying = false

proc resume*(player: SimpleAudioPlayer) =
  ## Resume playback
  ##
  ## Example:
  ##   player.resume()

  if not player.mediaPlayer.isNil and not player.isPlaying:
    player.mediaPlayer.call("start")
    player.isPlaying = true

proc stop*(player: SimpleAudioPlayer) =
  ## Stop playback and release resources
  ##
  ## Example:
  ##   player.stop()

  if not player.mediaPlayer.isNil:
    if player.isPlaying:
      player.mediaPlayer.call("stop")
    player.mediaPlayer.call("release")
    player.isPlaying = false

proc seekTo*(player: SimpleAudioPlayer, positionMs: int) =
  ## Seek to position in milliseconds
  ##
  ## Args:
  ##   positionMs: Position in milliseconds
  ##
  ## Example:
  ##   player.seekTo(30000)  # Seek to 30 seconds

  if not player.mediaPlayer.isNil:
    player.mediaPlayer.call("seekTo", positionMs.jint)

proc getDuration*(player: SimpleAudioPlayer): int =
  ## Get total duration in milliseconds
  ##
  ## Returns:
  ##   Duration in milliseconds, or -1 if unavailable
  ##
  ## Example:
  ##   let duration = player.getDuration()
  ##   echo "Duration: ", duration div 1000, " seconds"

  if not player.mediaPlayer.isNil:
    return player.mediaPlayer.call("getDuration").intVal
  return -1

proc getCurrentPosition*(player: SimpleAudioPlayer): int =
  ## Get current playback position in milliseconds
  ##
  ## Returns:
  ##   Current position in milliseconds
  ##
  ## Example:
  ##   let pos = player.getCurrentPosition()
  ##   echo "Position: ", pos div 1000, " seconds"

  if not player.mediaPlayer.isNil:
    return player.mediaPlayer.call("getCurrentPosition").intVal
  return 0

proc setVolume*(player: SimpleAudioPlayer, leftVolume, rightVolume: float32) =
  ## Set volume for this player (0.0 to 1.0)
  ##
  ## Args:
  ##   leftVolume: Left channel volume (0.0 - 1.0)
  ##   rightVolume: Right channel volume (0.0 - 1.0)
  ##
  ## Example:
  ##   player.setVolume(0.5, 0.5)  # 50% volume

  if not player.mediaPlayer.isNil:
    player.mediaPlayer.call("setVolume",
      leftVolume.jfloat,
      rightVolume.jfloat)

proc setLooping*(player: SimpleAudioPlayer, looping: bool) =
  ## Set whether playback should loop
  ##
  ## Args:
  ##   looping: true to loop indefinitely
  ##
  ## Example:
  ##   player.setLooping(true)

  if not player.mediaPlayer.isNil:
    player.mediaPlayer.call("setLooping", looping.jboolean)

proc isPlaying*(player: SimpleAudioPlayer): bool =
  ## Check if currently playing
  ##
  ## Returns:
  ##   true if playing
  ##
  ## Example:
  ##   if player.isPlaying():
  ##     echo "Audio is playing"

  if not player.mediaPlayer.isNil:
    return player.mediaPlayer.call("isPlaying").boolVal
  return false

# Lazy accessor for AndroidRuntime
proc sdkAudioManager*(runtime: AndroidRuntime): SdkAudioManager =
  ## Get or create SdkAudioManager instance
  if runtime.sdkAudioManager.isNone:
    runtime.sdkAudioManager = some(SdkAudioManager.init())
  return runtime.sdkAudioManager.get()

# Convenience global accessor
proc audio*(): SdkAudioManager =
  ## Global accessor for SdkAudioManager
  ## Requires AndroidRuntime to be initialized
  ##
  ## Example:
  ##   # System audio
  ##   let vol = audio().getStreamVolume(astMusic)
  ##   audio().setRingerMode(rmVibrate)
  ##
  ##   # Simple playback
  ##   let player = audio().playSound("/sdcard/Music/song.mp3")
  ##   player.pause()
  ##   player.resume()
  ##   player.stop()
  ##
  ## Note: This is a BASIC implementation.
  ## Full version (from niceapi.txt) will have:
  ##   - AudioStream objects with richer control
  ##   - Dual preference system
  ##   - Strategy pattern for API selection
  ##   - Completion callbacks
  ##   - Error callbacks
  return runtime().sdkAudioManager()

# TODO: Full AudioStream implementation from niceapi.txt
# type
#   AudioStream* = ref object
#     id: string
#     prefs*: AudioFilePrefs
#     strategy: AudioStrategy
#     state: PlaybackState
#
# proc play*(manager: AudioManager, file: string,
#           prefs = default(AudioFilePrefs)): AudioStream
# proc stop*(stream: AudioStream)
# proc pause*(stream: AudioStream)
# proc resume*(stream: AudioStream)
# proc seekTo*(stream: AudioStream, position: Duration)
# proc setVolume*(stream: AudioStream, volume: range[0..100])
# proc onComplete*(stream: AudioStream, callback: proc())
# proc onError*(stream: AudioStream, callback: proc(error: string))
