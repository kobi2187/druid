import jnim

jclass android.media.AudioRecordingMonitorImpl* of JVMObject:
  proc registerAudioRecordingCallback*(executor: Executor, cb: AudioManager.AudioRecordingCallback)
  proc unregisterAudioRecordingCallback*(cb: AudioManager.AudioRecordingCallback)
  proc getActiveRecordingConfiguration*(): AudioRecordingConfiguration

