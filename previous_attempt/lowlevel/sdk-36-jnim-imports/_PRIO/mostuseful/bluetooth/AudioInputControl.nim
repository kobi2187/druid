import jnim

jclass android.bluetooth.AudioInputControl* of JVMObject:
  proc registerCallback*(executor: Executor, callback: AudioInputCallback)
  proc unregisterCallback*(callback: AudioInputCallback)
  proc getAudioInputType*(): jint
  proc getGainSettingUnit*(): jint
  proc getGainSettingMin*(): jint
  proc getGainSettingMax*(): jint
  proc getDescription*(): string
  proc isDescriptionWritable*(): jboolean
  proc setDescription*(description: string): jboolean
  proc getAudioInputStatus*(): jint
  proc getGainSetting*(): jint
  proc setGainSetting*(gainSetting: jint): jboolean
  proc getGainMode*(): jint
  proc setGainMode*(gainMode: jint): jboolean
  proc getMute*(): jint
  proc setMute*(mute: jint): jboolean
  AUDIO_INPUT_TYPE_UNSPECIFIED*: jint {.`static`.}
  AUDIO_INPUT_TYPE_BLUETOOTH*: jint {.`static`.}
  AUDIO_INPUT_TYPE_MICROPHONE*: jint {.`static`.}
  AUDIO_INPUT_TYPE_ANALOG*: jint {.`static`.}
  AUDIO_INPUT_TYPE_DIGITAL*: jint {.`static`.}
  AUDIO_INPUT_TYPE_RADIO*: jint {.`static`.}
  AUDIO_INPUT_TYPE_STREAMING*: jint {.`static`.}
  AUDIO_INPUT_TYPE_AMBIENT*: jint {.`static`.}
  AUDIO_INPUT_STATUS_INACTIVE*: jint {.`static`.}
  AUDIO_INPUT_STATUS_ACTIVE*: jint {.`static`.}
  AUDIO_INPUT_STATUS_UNKNOWN*: jint {.`static`.}
  MUTE_NOT_MUTED*: jint {.`static`.}
  MUTE_MUTED*: jint {.`static`.}
  MUTE_DISABLED*: jint {.`static`.}
  GAIN_MODE_MANUAL_ONLY*: jint {.`static`.}
  GAIN_MODE_AUTOMATIC_ONLY*: jint {.`static`.}
  GAIN_MODE_MANUAL*: jint {.`static`.}
  GAIN_MODE_AUTOMATIC*: jint {.`static`.}

