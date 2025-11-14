# audio.nim - Audio utilities

import android, options

type
  AudioStreamType* = enum
    Voice, System, Ring, Music, Alarm, Notification, DTMF
    
  AudioSource* = enum
    Default, Mic, VoiceRecognition, VoiceCommunication, Camcorder
    
  AudioFormat* = enum
    MP3, AAC, WAV, OGG, FLAC, PCM
    
  AudioEncodingQuality* = enum
    Low, Medium, High
    
  RecordState* = enum
    Idle, Recording, Paused, Stopped
    
  PlaybackState* = enum
    Idle, Preparing, Playing, Paused, Stopped, Completed
    
  AudioEncoder* = enum
    AAC, AMR, PCM16
    
  AudioConfig* = object
    audioSource*: AudioSource
    channels*: int
    sampleRate*: int      # Hz
    bitRate*: int         # bps
    encoder*: AudioEncoder
    
  AudioFocusType* = enum
    Gain, GainTransient, GainTransientMayDuck,
    Loss, LossTransient, LossTransientCanDuck
    
  AudioFocusResult* = enum
    Granted, Failed, DelayedForFocusLoss
    
  AudioManager* = ref object of Manager
    audioRecorders: Table[string, tuple[recorder: pointer, state: RecordState]]
    audioPlayers: Table[string, tuple[player: pointer, state: PlaybackState]]
    systemAudioManager: pointer  # JNI reference

# Constructor
proc newAudioManager*(context: Context): AudioManager
  ## Creates a new audio manager

# System audio
proc getStreamVolume*(m: AudioManager, streamType: AudioStreamType): int
  ## Gets volume for stream type
  ## API 26+: Uses AudioManager.getStreamVolume
  
proc getMaxStreamVolume*(m: AudioManager, streamType: AudioStreamType): int
  ## Gets maximum volume for stream type
  ## API 26+: Uses AudioManager.getStreamMaxVolume
  
proc setStreamVolume*(m: AudioManager, streamType: AudioStreamType, volume: int, showUI: bool = false): bool
  ## Sets volume for stream type
  ## API 26+: Uses AudioManager.setStreamVolume
  
proc isStreamMuted*(m: AudioManager, streamType: AudioStreamType): bool
  ## Checks if stream is muted
  ## API 26+: Uses AudioManager.isStreamMute
  
proc setStreamMute*(m: AudioManager, streamType: AudioStreamType, mute: bool): bool
  ## Mutes/unmutes stream
  ## API 26+: Uses AudioManager.adjustStreamVolume with ADJUST_MUTE/UNMUTE

# Audio focus
proc requestAudioFocus*(m: AudioManager, 
                      streamType: AudioStreamType,
                      focusGain: AudioFocusType,
                      focusLossListener: proc(focusChange: AudioFocusType)): AudioFocusResult
  ## Requests audio focus
  ## API 26+: Uses AudioFocusRequest
  
proc abandonAudioFocus*(m: AudioManager, 
                       focusLossListener: proc(focusChange: AudioFocusType)): bool
  ## Abandons audio focus
  ## API 26+: Uses AudioManager.abandonAudioFocusRequest

# Audio recording
proc startRecording*(m: AudioManager, 
                   recorderId: string,
                   config: AudioConfig,
                   outputFile: string): bool
  ## Starts audio recording
  ## API 26+: Uses MediaRecorder
  ## Requires RECORD_AUDIO permission
  
proc pauseRecording*(m: AudioManager, recorderId: string): bool
  ## Pauses audio recording
  ## API 26+: Uses MediaRecorder.pause
  
proc resumeRecording*(m: AudioManager, recorderId: string): bool
  ## Resumes audio recording
  ## API 26+: Uses MediaRecorder.resume
  
proc stopRecording*(m: AudioManager, recorderId: string): bool
  ## Stops audio recording
  ## API 26+: Uses MediaRecorder.stop
  
proc getRecordingAmplitude*(m: AudioManager, recorderId: string): int
  ## Gets current recording amplitude
  ## API 26+: Uses MediaRecorder.getMaxAmplitude
  
proc releaseRecorder*(m: AudioManager, recorderId: string): bool
  ## Releases recorder resources
  ## API 26+: Uses MediaRecorder.release

# Audio playback
proc createPlayer*(m: AudioManager, 
                 playerId: string,
                 streamType: AudioStreamType = Music): bool
  ## Creates audio player
  ## API 26+: Uses MediaPlayer
  
proc setDataSource*(m: AudioManager, 
                  playerId: string,
                  filePath: string): bool
  ## Sets file data source
  ## API 26+: Uses MediaPlayer.setDataSource
  
proc setStreamDataSource*(m: AudioManager, 
                        playerId: string,
                        url: string): bool
  ## Sets streaming data source
  ## API 26+: Uses MediaPlayer.setDataSource with URL
  ## Requires INTERNET permission
  
proc prepare*(m: AudioManager, playerId: string): bool
  ## Prepares player
  ## API 26+: Uses MediaPlayer.prepare
  
proc prepareAsync*(m: AudioManager, 
                 playerId: string,
                 onPrepared: proc()): bool
  ## Prepares player asynchronously
  ## API 26+: Uses MediaPlayer.prepareAsync
  
proc start*(m: AudioManager, playerId: string): bool
  ## Starts playback
  ## API 26+: Uses MediaPlayer.start
  
proc pause*(m: AudioManager, playerId: string): bool
  ## Pauses playback
  ## API 26+: Uses MediaPlayer.pause
  
proc stop*(m: AudioManager, playerId: string): bool
  ## Stops playback
  ## API 26+: Uses MediaPlayer.stop
  
proc seekTo*(m: AudioManager, playerId: string, positionMs: int): bool
  ## Seeks to position
  ## API 26+: Uses MediaPlayer.seekTo
  
proc getDuration*(m: AudioManager, playerId: string): int
  ## Gets total duration in milliseconds
  ## API 26+: Uses MediaPlayer.getDuration
  
proc getCurrentPosition*(m: AudioManager, playerId: string): int
  ## Gets current position in milliseconds
  ## API 26+: Uses MediaPlayer.getCurrentPosition
  
proc isPlaying*(m: AudioManager, playerId: string): bool
  ## Checks if player is playing
  ## API 26+: Uses MediaPlayer.isPlaying
  
proc releasePlayer*(m: AudioManager, playerId: string): bool
  ## Releases player resources
  ## API 26+: Uses MediaPlayer.release