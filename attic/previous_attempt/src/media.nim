# media.nim - Media operations

import android, options

type
  MediaType* = enum
    Audio, Video, Image
    
  AudioEncodingFormat* = enum
    AAC, AMR, MP3, OPUS, FLAC, PCM
    
  VideoEncodingFormat* = enum
    H264, H265, VP8, VP9, MPEG4
    
  AudioSource* = enum
    Default, 
    Mic, 
    VoiceRecognition,
    VoiceCommunication,
    Camcorder
    
  RecorderState* = enum
    Idle, Initialized, Preparing, Recording, Paused, Stopped, Released
    
  PlaybackState* = enum
    Idle, Initialized, Preparing, Prepared, Started, Paused, Stopped, Released
    
  AudioFocusType* = enum
    Gain,               # Long-term focus
    GainTransient,      # Short-term focus
    GainTransientMayDuck, # Short-term focus but others can play quietly
    Loss,               # Lost focus
    LossTransient,      # Temporary loss of focus
    LossTransientCanDuck # Temporary loss but can play quietly
    
  AudioRecorderConfig* = object
    audioSource*: AudioSource
    sampleRateHz*: int
    channelCount*: int
    encodingFormat*: AudioEncodingFormat
    bitRate*: int
    maxDurationMs*: Option[int]
    
  MediaRecorder* = ref object
    state*: RecorderState
    outputFile*: string
    config*: AudioRecorderConfig
    errorCode*: Option[int]
    onInfoCallback*: Option[proc(what: int, extra: int)]
    onErrorCallback*: Option[proc(what: int, extra: int)]
    impl: pointer  # JNI reference
    
  MediaPlayer* = ref object
    state*: PlaybackState
    volume*: float
    isLooping*: bool
    currentPosition*: int  # milliseconds
    duration*: int         # milliseconds
    onCompletionCallback*: Option[proc()]
    onErrorCallback*: Option[proc(what: int, extra: int)]
    impl: pointer  # JNI reference
    
  AudioFocusChangeListener* = proc(focusChange: AudioFocusType)
    
  MediaManager* = ref object of Manager
    activeRecorders: Table[string, MediaRecorder]
    activePlayers: Table[string, MediaPlayer]
    audioFocusListeners: Table[string, AudioFocusChangeListener]
    audioManager: pointer  # JNI reference

# Constructor
proc newMediaManager*(context: Context): MediaManager
  ## Creates a new media manager

# Audio recorder
proc createAudioRecorder*(m: MediaManager, 
                         recorderId: string,
                         config: AudioRecorderConfig): Option[MediaRecorder]
  ## Creates a new audio recorder
  ## API 26+: Uses MediaRecorder with modern API
  ## Requires RECORD_AUDIO permission
  
proc startRecording*(recorder: MediaRecorder): bool
  ## Starts audio recording
  
proc stopRecording*(recorder: MediaRecorder): bool
  ## Stops audio recording
  
proc pauseRecording*(recorder: MediaRecorder): bool
  ## Pauses audio recording
  ## API 24+: Uses pause()
  ## Not available on earlier API levels
  
proc resumeRecording*(recorder: MediaRecorder): bool
  ## Resumes audio recording
  ## API 24+: Uses resume()
  ## Not available on earlier API levels
  
proc releaseRecorder*(m: MediaManager, recorderId: string)
  ## Releases recorder resources

# Media player
proc createPlayer*(m: MediaManager, 
                  playerId: string,
                  filePath: string): Option[MediaPlayer]
  ## Creates a media player for file
  ## API 26+: Uses MediaPlayer with modern API
  
proc createStreamingPlayer*(m: MediaManager,
                          playerId: string,
                          url: string): Option[MediaPlayer]
  ## Creates a media player for streaming
  ## API 26+: Uses MediaPlayer with modern API
  ## Requires INTERNET permission
  
proc startPlayback*(player: MediaPlayer): bool
  ## Starts media playback
  
proc pausePlayback*(player: MediaPlayer): bool
  ## Pauses media playback
  
proc stopPlayback*(player: MediaPlayer): bool
  ## Stops media playback
  
proc seekTo*(player: MediaPlayer, positionMs: int): bool
  ## Seeks to position in milliseconds
  ## API 26+: Uses seekTo with SEEK_NEXT_SYNC
  
proc setVolume*(player: MediaPlayer, volume: float): bool
  ## Sets playback volume (0.0-1.0)
  
proc releasePlayer*(m: MediaManager, playerId: string)
  ## Releases player resources

# Audio focus
proc requestAudioFocus*(m: MediaManager, 
                       focusType: AudioFocusType,
                       listener: AudioFocusChangeListener): Option[string]
  ## Requests audio focus
  ## Returns focus request ID if granted
  ## API 26+: Uses AudioFocusRequest.Builder
  ## Pre-API 26: Uses requestAudioFocus
  
proc abandonAudioFocus*(m: MediaManager, requestId: string): bool
  ## Abandons audio focus
  ## API 26+: Uses abandonAudioFocusRequest
  ## Pre-API 26: Uses abandonAudioFocus