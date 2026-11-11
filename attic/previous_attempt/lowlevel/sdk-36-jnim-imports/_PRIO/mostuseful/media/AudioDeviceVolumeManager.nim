import jnim

jclass android.media.AudioDeviceVolumeManager* of JVMObject:
  proc enforceValidVolumeBehavior*(volumeBehavior: jint) {.`static`.}
  proc setDeviceVolumeBehavior*(device: AudioDeviceAttributes, deviceVolumeBehavior: jint)
  proc getDeviceVolumeBehavior*(device: AudioDeviceAttributes): jint
  proc isFullVolumeDevice*(): jboolean
  proc setDeviceAbsoluteVolumeBehavior*(device: AudioDeviceAttributes, volume: VolumeInfo, executor: Executor, vclistener: OnAudioDeviceVolumeChangedListener)
  proc setDeviceAbsoluteVolumeBehavior*(device: AudioDeviceAttributes, volume: VolumeInfo, handlesVolumeAdjustment: jboolean, executor: Executor, vclistener: OnAudioDeviceVolumeChangedListener)
  proc setDeviceAbsoluteMultiVolumeBehavior*(device: AudioDeviceAttributes, volumes: List[VolumeInfo], executor: Executor, vclistener: OnAudioDeviceVolumeChangedListener)
  proc setDeviceAbsoluteMultiVolumeBehavior*(device: AudioDeviceAttributes, volumes: List[VolumeInfo], handlesVolumeAdjustment: jboolean, executor: Executor, vclistener: OnAudioDeviceVolumeChangedListener)
  proc setDeviceAbsoluteVolumeAdjustOnlyBehavior*(device: AudioDeviceAttributes, volume: VolumeInfo, handlesVolumeAdjustment: jboolean, executor: Executor, vclistener: OnAudioDeviceVolumeChangedListener)
  proc setDeviceAbsoluteMultiVolumeAdjustOnlyBehavior*(device: AudioDeviceAttributes, volumes: List[VolumeInfo], handlesVolumeAdjustment: jboolean, executor: Executor, vclistener: OnAudioDeviceVolumeChangedListener)
  proc addOnDeviceVolumeBehaviorChangedListener*(executor: Executor, listener: OnDeviceVolumeBehaviorChangedListener)
  proc removeOnDeviceVolumeBehaviorChangedListener*(listener: OnDeviceVolumeBehaviorChangedListener)
  proc setDeviceVolume*(vi: VolumeInfo, ada: AudioDeviceAttributes)
  proc getDeviceVolume*(vi: VolumeInfo, ada: AudioDeviceAttributes): VolumeInfo
  proc setInputGainIndex*(ada: AudioDeviceAttributes, index: jint)
  proc getInputGainIndex*(ada: AudioDeviceAttributes): jint
  proc getMaxInputGainIndex*(): jint
  proc getMinInputGainIndex*(): jint
  proc isInputGainFixed*(ada: AudioDeviceAttributes): jboolean
  proc volumeBehaviorName*(behavior: jint): string {.`static`.}
  DEVICE_VOLUME_BEHAVIOR_UNSET*: jint {.`static`.}
  DEVICE_VOLUME_BEHAVIOR_VARIABLE*: jint {.`static`.}
  DEVICE_VOLUME_BEHAVIOR_FULL*: jint {.`static`.}
  DEVICE_VOLUME_BEHAVIOR_FIXED*: jint {.`static`.}
  DEVICE_VOLUME_BEHAVIOR_ABSOLUTE*: jint {.`static`.}
  DEVICE_VOLUME_BEHAVIOR_ABSOLUTE_MULTI_MODE*: jint {.`static`.}
  DEVICE_VOLUME_BEHAVIOR_ABSOLUTE_ADJUST_ONLY*: jint {.`static`.}
  ADJUST_MODE_NORMAL*: jint {.`static`.}
  ADJUST_MODE_START*: jint {.`static`.}
  ADJUST_MODE_END*: jint {.`static`.}


