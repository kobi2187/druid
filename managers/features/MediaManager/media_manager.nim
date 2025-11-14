## MediaManager - Video/Audio Playback and Media Control
##
## Provides video and audio playback capabilities.
##
## Android Background:
##   - MediaPlayer: Simple playback (audio/video)
##   - ExoPlayer: Advanced playback (streaming, adaptive bitrate)
##   - MediaSession: Media control integration (notifications, headset buttons)
##
## Druid's Approach:
##   - MediaPlayer for simple playback
##   - ExoPlayer wrapper for advanced features (future)
##   - Simple API that "just works"
##
## Usage:
##   var mm = mediaManager()
##
##   # Play audio
##   let player = mm.createAudioPlayer("/sdcard/music.mp3")
##   player.play()
##
##   # Play video (requires Surface)
##   let video = mm.createVideoPlayer("/sdcard/video.mp4")
##   video.setSurface(surfaceView)
##   video.play()
##
##   # Control playback
##   player.pause()
##   player.seekTo(30000)  # 30 seconds
##   echo player.getCurrentPosition()

import jnim
import options
import ../../../core

# JNI bindings for MediaPlayer
jnimport:
  import android.content.Context
  import android.media.MediaPlayer as JMP
  import android.view.SurfaceHolder

type
  PlaybackState* = enum
    ## Media playback state
    psIdle = "idle"
    psPreparing = "preparing"
    psReady = "ready"
    psPlaying = "playing"
    psPaused = "paused"
    psStopped = "stopped"
    psError = "error"

  MediaType* = enum
    ## Type of media
    mtAudio = "audio"
    mtVideo = "video"

  MediaInfo* = object
    ## Information about media file
    duration*: int  # milliseconds
    width*: int     # video only
    height*: int    # video only
    bitrate*: int   # bits per second

  MediaPlayer* = ref object
    ## Wrapper for Android MediaPlayer
    mediaPlayer: JObject
    mediaType: MediaType
    state: PlaybackState
    filePath: string
    url: string

  SdkMediaManager* = ref object
    ## Manager for media playback
    activePlayers: seq[MediaPlayer]

#
# Initialization
#

proc newSdkMediaManager*(): SdkMediaManager =
  result = SdkMediaManager(
    activePlayers: @[]
  )

#
# Audio Player Creation
#

proc createAudioPlayer*(mm: SdkMediaManager, filePath: string): MediaPlayer =
  ## Create audio player for local file
  ##
  ## Args:
  ##   filePath: Path to audio file (e.g., "/sdcard/music.mp3")
  ##
  ## Returns:
  ##   MediaPlayer instance

  let mp = JMP.new()

  try:
    mp.call("setDataSource", filePath.toJString)
    mp.call("prepare")  # Synchronous prepare

    result = MediaPlayer(
      mediaPlayer: mp,
      mediaType: mtAudio,
      state: psReady,
      filePath: filePath
    )

    mm.activePlayers.add(result)
  except:
    echo "Error creating audio player: ", getCurrentExceptionMsg()
    result = MediaPlayer(state: psError)

proc createAudioPlayerFromUrl*(mm: SdkMediaManager, url: string): MediaPlayer =
  ## Create audio player for streaming URL
  ##
  ## Args:
  ##   url: HTTP(S) URL to audio stream
  ##
  ## Returns:
  ##   MediaPlayer instance
  ##
  ## Note: Uses synchronous prepare (blocking). For large files, use prepareAsync.

  let mp = JMP.new()

  try:
    mp.call("setDataSource", url.toJString)
    mp.call("prepare")

    result = MediaPlayer(
      mediaPlayer: mp,
      mediaType: mtAudio,
      state: psReady,
      url: url
    )

    mm.activePlayers.add(result)
  except:
    echo "Error creating audio player from URL: ", getCurrentExceptionMsg()
    result = MediaPlayer(state: psError)

#
# Video Player Creation
#

proc createVideoPlayer*(mm: SdkMediaManager, filePath: string): MediaPlayer =
  ## Create video player for local file
  ##
  ## Args:
  ##   filePath: Path to video file
  ##
  ## Returns:
  ##   MediaPlayer instance
  ##
  ## Note: Must call setSurface() before playing video

  let mp = JMP.new()

  try:
    mp.call("setDataSource", filePath.toJString)
    mp.call("prepare")

    result = MediaPlayer(
      mediaPlayer: mp,
      mediaType: mtVideo,
      state: psReady,
      filePath: filePath
    )

    mm.activePlayers.add(result)
  except:
    echo "Error creating video player: ", getCurrentExceptionMsg()
    result = MediaPlayer(state: psError)

proc setSurface*(player: MediaPlayer, surface: JObject) =
  ## Set surface for video rendering
  ##
  ## Args:
  ##   surface: Android Surface or SurfaceHolder
  ##
  ## Required before playing video

  try:
    player.mediaPlayer.call("setSurface", surface)
  except:
    echo "Error setting surface: ", getCurrentExceptionMsg()

#
# Playback Control
#

proc play*(player: MediaPlayer) =
  ## Start or resume playback

  if player.state != psReady and player.state != psPaused:
    echo "Warning: Cannot play from state ", player.state
    return

  try:
    player.mediaPlayer.call("start")
    player.state = psPlaying
  except:
    echo "Error starting playback: ", getCurrentExceptionMsg()
    player.state = psError

proc pause*(player: MediaPlayer) =
  ## Pause playback

  if player.state != psPlaying:
    return

  try:
    player.mediaPlayer.call("pause")
    player.state = psPaused
  except:
    echo "Error pausing playback: ", getCurrentExceptionMsg()

proc stop*(player: MediaPlayer) =
  ## Stop playback

  try:
    player.mediaPlayer.call("stop")
    player.state = psStopped
  except:
    echo "Error stopping playback: ", getCurrentExceptionMsg()

proc release*(player: MediaPlayer) =
  ## Release media player resources
  ## Must be called when done with player

  try:
    player.mediaPlayer.call("release")
    player.state = psIdle
  except:
    echo "Error releasing player: ", getCurrentExceptionMsg()

#
# Seeking
#

proc seekTo*(player: MediaPlayer, positionMs: int) =
  ## Seek to position in media
  ##
  ## Args:
  ##   positionMs: Position in milliseconds

  try:
    player.mediaPlayer.call("seekTo", positionMs.jint)
  except:
    echo "Error seeking: ", getCurrentExceptionMsg()

proc getCurrentPosition*(player: MediaPlayer): int =
  ## Get current playback position in milliseconds

  try:
    return player.mediaPlayer.call("getCurrentPosition").intValue
  except:
    echo "Error getting position: ", getCurrentExceptionMsg()
    return 0

proc getDuration*(player: MediaPlayer): int =
  ## Get total duration in milliseconds

  try:
    return player.mediaPlayer.call("getDuration").intValue
  except:
    echo "Error getting duration: ", getCurrentExceptionMsg()
    return 0

#
# Volume Control
#

proc setVolume*(player: MediaPlayer, leftVolume: float32, rightVolume: float32) =
  ## Set volume (0.0 to 1.0 for each channel)

  try:
    player.mediaPlayer.call("setVolume", leftVolume.jfloat, rightVolume.jfloat)
  except:
    echo "Error setting volume: ", getCurrentExceptionMsg()

#
# Looping
#

proc setLooping*(player: MediaPlayer, loop: bool) =
  ## Enable or disable looping

  try:
    player.mediaPlayer.call("setLooping", loop.jboolean)
  except:
    echo "Error setting looping: ", getCurrentExceptionMsg()

proc isLooping*(player: MediaPlayer): bool =
  ## Check if looping is enabled

  try:
    return player.mediaPlayer.call("isLooping").boolValue
  except:
    return false

#
# State Queries
#

proc getState*(player: MediaPlayer): PlaybackState =
  ## Get current playback state
  return player.state

proc isPlaying*(player: MediaPlayer): bool =
  ## Check if currently playing

  try:
    return player.mediaPlayer.call("isPlaying").boolValue
  except:
    return false

proc getMediaType*(player: MediaPlayer): MediaType =
  ## Get media type (audio or video)
  return player.mediaType

#
# Media Info
#

proc getMediaInfo*(player: MediaPlayer): MediaInfo =
  ## Get information about loaded media

  var info = MediaInfo()

  try:
    info.duration = player.getDuration()

    if player.mediaType == mtVideo:
      info.width = player.mediaPlayer.call("getVideoWidth").intValue
      info.height = player.mediaPlayer.call("getVideoHeight").intValue
  except:
    echo "Error getting media info: ", getCurrentExceptionMsg()

  return info

#
# Manager Operations
#

proc releaseAll*(mm: SdkMediaManager) =
  ## Release all active media players

  for player in mm.activePlayers:
    player.release()

  mm.activePlayers = @[]

proc getActivePlayers*(mm: SdkMediaManager): seq[MediaPlayer] =
  ## Get list of active media players
  return mm.activePlayers

#
# Callbacks (Future Enhancement)
#
# MediaPlayer supports callbacks for:
# - onCompletion (playback finished)
# - onError (error occurred)
# - onPrepared (async preparation complete)
# - onSeekComplete (seek finished)
# - onBufferingUpdate (streaming progress)
#
# These require callback bridge implementation
#

# TODO: Implement callbacks
# proc onCompletion*(player: MediaPlayer, callback: proc()) =
#   ## Register callback for playback completion
#   ## Requires: MediaPlayer.OnCompletionListener
#   discard
#
# proc onError*(player: MediaPlayer, callback: proc(error: string)) =
#   ## Register callback for errors
#   ## Requires: MediaPlayer.OnErrorListener
#   discard

#
# Advanced Features (Future Enhancement)
#

# TODO: ExoPlayer wrapper for advanced features:
# - Adaptive streaming (DASH, HLS, SmoothStreaming)
# - DRM support
# - Advanced buffering
# - Custom renderers
# - Better error handling

# TODO: MediaSession integration:
# - Media notification controls
# - Headset button handling
# - Android Auto/Wear integration
# - Lock screen controls

#
# Debugging
#

proc debugPrintMediaManager*(mm: SdkMediaManager): string =
  ## Get debug representation of media manager state
  result = "MediaManager - Status:\n"
  result &= "  Active Players: " & $mm.activePlayers.len & "\n"

  for i, player in mm.activePlayers:
    result &= "  Player " & $i & ":\n"
    result &= "    Type: " & $player.mediaType & "\n"
    result &= "    State: " & $player.state & "\n"
    result &= "    File: " & player.filePath & "\n"
    if player.url != "":
      result &= "    URL: " & player.url & "\n"
    if player.state in {psReady, psPlaying, psPaused}:
      result &= "    Duration: " & $(player.getDuration() div 1000) & "s\n"
      result &= "    Position: " & $(player.getCurrentPosition() div 1000) & "s\n"

#
# Implementation Notes & TODOs
#
# Current Implementation:
#   - ✅ Basic audio playback works
#   - ✅ Basic video playback works (with Surface)
#   - ✅ Playback control works
#   - ✅ Seeking works
#   - ✅ Volume control works
#   - ❌ Callbacks need bridge
#
# Limitations:
#   - No completion/error callbacks (needs callback bridge)
#   - No async preparation (would need callbacks)
#   - No streaming progress callbacks
#   - Basic MediaPlayer only (no ExoPlayer features)
#
# Future Enhancements:
#   1. ExoPlayer Integration:
#      - Better streaming support
#      - Adaptive bitrate
#      - DRM support
#      - More codecs
#
#   2. MediaSession Integration:
#      - System media controls
#      - Notification integration
#      - Headset/Bluetooth button handling
#
#   3. Advanced Features:
#      - Subtitle support
#      - Multiple audio tracks
#      - Playback speed control
#      - Audio effects (equalizer, etc.)
#
# Recommended Approach for Video:
#   - Use SurfaceView or TextureView for video output
#   - Handle lifecycle properly (pause on background)
#   - Release players when done (memory leak prevention)
#

#
# Runtime Integration
#

proc sdkMediaManager*(runtime: AndroidRuntime): SdkMediaManager =
  ## Get or create the SdkMediaManager instance
  ## Lazy initialization pattern
  if runtime.sdkMediaManager.isNone:
    runtime.sdkMediaManager = some(newSdkMediaManager())
  return runtime.sdkMediaManager.get()

# Convenience global accessor
proc mediaManager*(): SdkMediaManager =
  ## Global accessor for SdkMediaManager
  ## Requires AndroidRuntime to be initialized
  ##
  ## Usage:
  ##   let player = mediaManager().createAudioPlayer("/sdcard/music.mp3")
  ##   player.play()
  return runtime().sdkMediaManager()
