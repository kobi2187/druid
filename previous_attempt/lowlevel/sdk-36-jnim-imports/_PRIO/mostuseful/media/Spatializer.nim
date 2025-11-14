import jnim

jclass android.media.Spatializer* of JVMObject:
  proc isEnabled*(): jboolean
  proc isAvailable*(): jboolean
  proc isAvailableForDevice*(device: AudioDeviceAttributes): jboolean
  proc hasHeadTracker*(device: AudioDeviceAttributes): jboolean
  proc setHeadTrackerEnabled*(enabled: jboolean, device: AudioDeviceAttributes)
  proc isHeadTrackerEnabled*(device: AudioDeviceAttributes): jboolean
  proc isHeadTrackerAvailable*(): jboolean
  proc addOnHeadTrackerAvailableListener*(executor: Executor, listener: OnHeadTrackerAvailableListener)
  proc removeOnHeadTrackerAvailableListener*(listener: OnHeadTrackerAvailableListener)
  proc headtrackingModeToString*(mode: jint): string {.`static`.}
  proc getImmersiveAudioLevel*(): jint
  proc setEnabled*(enabled: jboolean)
  proc canBeSpatialized*(attributes: AudioAttributes, format: AudioFormat): jboolean
  proc getSpatializedChannelMasks*(): List[Integer]
  proc addOnSpatializerStateChangedListener*(executor: Executor, listener: OnSpatializerStateChangedListener)
  proc removeOnSpatializerStateChangedListener*(listener: OnSpatializerStateChangedListener)
  proc getCompatibleAudioDevices*(): List[AudioDeviceAttributes]
  proc addCompatibleAudioDevice*(ada: AudioDeviceAttributes)
  proc removeCompatibleAudioDevice*(ada: AudioDeviceAttributes)
  proc getHeadTrackingMode*(): jint
  proc getDesiredHeadTrackingMode*(): jint
  proc getSupportedHeadTrackingModes*(): List[Integer]
  proc setDesiredHeadTrackingMode*(mode: jint)
  proc recenterHeadTracker*()
  proc addOnHeadTrackingModeChangedListener*(executor: Executor, listener: OnHeadTrackingModeChangedListener)
  proc removeOnHeadTrackingModeChangedListener*(listener: OnHeadTrackingModeChangedListener)
  proc setOnHeadToSoundstagePoseUpdatedListener*(executor: Executor, listener: OnHeadToSoundstagePoseUpdatedListener)
  proc clearOnHeadToSoundstagePoseUpdatedListener*()
  proc setGlobalTransform*(transform: seq[jfloat])
  proc setEffectParameter*(key: jint, value: seq[jbyte])
  proc getEffectParameter*(key: jint, value: seq[jbyte])
  proc getOutput*(): jint
  proc setOnSpatializerOutputChangedListener*(executor: Executor, listener: OnSpatializerOutputChangedListener)
  proc clearOnSpatializerOutputChangedListener*()
  SPATIALIZER_IMMERSIVE_LEVEL_OTHER*: jint {.`static`.}
  SPATIALIZER_IMMERSIVE_LEVEL_NONE*: jint {.`static`.}
  SPATIALIZER_IMMERSIVE_LEVEL_MULTICHANNEL*: jint {.`static`.}
  SPATIALIZER_IMMERSIVE_LEVEL_MCHAN_BED_PLUS_OBJECTS*: jint {.`static`.}
  HEAD_TRACKING_MODE_UNSUPPORTED*: jint {.`static`.}
  HEAD_TRACKING_MODE_DISABLED*: jint {.`static`.}
  HEAD_TRACKING_MODE_OTHER*: jint {.`static`.}
  HEAD_TRACKING_MODE_RELATIVE_WORLD*: jint {.`static`.}
  HEAD_TRACKING_MODE_RELATIVE_DEVICE*: jint {.`static`.}




