import jnim

jclass android.media.IAudioPolicyService* of IInterface:
  proc onNewAudioModulesAvailable*()
  proc setDeviceConnectionState*(state: jint, port: android.media.audio.common.AudioPort, encodedFormat: android.media.audio.common.AudioFormatDescription, deviceSwitch: jboolean)
  proc getDeviceConnectionState*(device: android.media.audio.common.AudioDevice): jint
  proc handleDeviceConfigChange*(device: android.media.audio.common.AudioDevice, deviceName: string, encodedFormat: android.media.audio.common.AudioFormatDescription)
  proc setPhoneState*(state: jint, uid: jint)
  proc setForceUse*(usage: jint, config: jint)
  proc getForceUse*(usage: jint): jint
  proc getOutput*(stream: jint): jint
  proc getOutputForAttr*(attr: android.media.audio.common.AudioAttributes, session: jint, attributionSource: android.content.AttributionSourceState, config: android.media.audio.common.AudioConfig, flags: jint, selectedDeviceIds: seq[jint]): android.media.GetOutputForAttrResponse
  proc startOutput*(portId: jint)
  proc stopOutput*(portId: jint)
  proc releaseOutput*(portId: jint)
  proc getInputForAttr*(attr: android.media.audio.common.AudioAttributes, input: jint, riid: jint, session: jint, attributionSource: android.content.AttributionSourceState, config: android.media.audio.common.AudioConfigBase, flags: jint, selectedDeviceId: jint): android.media.GetInputForAttrResponse
  proc startInput*(portId: jint)
  proc stopInput*(portId: jint)
  proc releaseInput*(portId: jint)
  proc setDeviceAbsoluteVolumeEnabled*(device: android.media.audio.common.AudioDevice, enabled: jboolean, streamToDriveAbs: jint)
  proc initStreamVolume*(stream: jint, indexMin: jint, indexMax: jint)
  proc setStreamVolumeIndex*(stream: jint, device: android.media.audio.common.AudioDeviceDescription, index: jint, muted: jboolean)
  proc getStreamVolumeIndex*(stream: jint, device: android.media.audio.common.AudioDeviceDescription): jint
  proc setVolumeIndexForAttributes*(attr: android.media.audio.common.AudioAttributes, device: android.media.audio.common.AudioDeviceDescription, index: jint, muted: jboolean)
  proc getVolumeIndexForAttributes*(attr: android.media.audio.common.AudioAttributes, device: android.media.audio.common.AudioDeviceDescription): jint
  proc getMaxVolumeIndexForAttributes*(attr: android.media.audio.common.AudioAttributes): jint
  proc getMinVolumeIndexForAttributes*(attr: android.media.audio.common.AudioAttributes): jint
  proc getStrategyForStream*(stream: jint): jint
  proc getDevicesForAttributes*(attr: android.media.audio.common.AudioAttributes, forVolume: jboolean): seq[android.media.audio.common.AudioDevice]
  proc getOutputForEffect*(desc: android.media.EffectDescriptor): jint
  proc registerEffect*(desc: android.media.EffectDescriptor, io: jint, strategy: jint, session: jint, id: jint)
  proc unregisterEffect*(id: jint)
  proc setEffectEnabled*(id: jint, enabled: jboolean)
  proc moveEffectsToIo*(ids: seq[jint], io: jint)
  proc isStreamActive*(stream: jint, inPastMs: jint): jboolean
  proc isStreamActiveRemotely*(stream: jint, inPastMs: jint): jboolean
  proc isSourceActive*(source: jint): jboolean
  proc queryDefaultPreProcessing*(audioSession: jint, count: android.media.audio.common.Int): seq[android.media.EffectDescriptor]
  proc addSourceDefaultEffect*(type: android.media.audio.common.AudioUuid, opPackageName: string, uuid: android.media.audio.common.AudioUuid, priority: jint, source: jint): jint
  proc addStreamDefaultEffect*(type: android.media.audio.common.AudioUuid, opPackageName: string, uuid: android.media.audio.common.AudioUuid, priority: jint, usage: jint): jint
  proc removeSourceDefaultEffect*(id: jint)
  proc removeStreamDefaultEffect*(id: jint)
  proc setSupportedSystemUsages*(systemUsages: seq[jint])
  proc setAllowedCapturePolicy*(uid: jint, capturePolicy: jint)
  proc getOffloadSupport*(info: android.media.audio.common.AudioOffloadInfo): jint
  proc isDirectOutputSupported*(config: android.media.audio.common.AudioConfigBase, attributes: android.media.audio.common.AudioAttributes): jboolean
  proc listAudioPorts*(role: jint, type: jint, count: android.media.audio.common.Int, ports: seq[android.media.AudioPortFw]): jint
  proc listDeclaredDevicePorts*(role: jint): seq[android.media.AudioPortFw]
  proc getAudioPort*(portId: jint): android.media.AudioPortFw
  proc createAudioPatch*(patch: android.media.AudioPatchFw, handle: jint): jint
  proc releaseAudioPatch*(handle: jint)
  proc listAudioPatches*(count: android.media.audio.common.Int, patches: seq[android.media.AudioPatchFw]): jint
  proc setAudioPortConfig*(config: android.media.AudioPortConfigFw)
  proc registerClient*(client: android.media.IAudioPolicyServiceClient)
  proc setAudioPortCallbacksEnabled*(enabled: jboolean)
  proc setAudioVolumeGroupCallbacksEnabled*(enabled: jboolean)
  proc acquireSoundTriggerSession*(): android.media.SoundTriggerSession
  proc releaseSoundTriggerSession*(session: jint)
  proc getPhoneState*(): jint
  proc registerPolicyMixes*(mixes: seq[android.media.AudioMix], registration: jboolean)
  proc getRegisteredPolicyMixes*(): java.util.List[android.media.AudioMix]
  proc updatePolicyMixes*(updates: seq[android.media.AudioMixUpdate])
  proc setUidDeviceAffinities*(uid: jint, devices: seq[android.media.audio.common.AudioDevice])
  proc removeUidDeviceAffinities*(uid: jint)
  proc setUserIdDeviceAffinities*(userId: jint, devices: seq[android.media.audio.common.AudioDevice])
  proc removeUserIdDeviceAffinities*(userId: jint)
  proc startAudioSource*(source: android.media.AudioPortConfigFw, attributes: android.media.audio.common.AudioAttributes): jint
  proc stopAudioSource*(portId: jint)
  proc setMasterMono*(mono: jboolean)
  proc getMasterMono*(): jboolean
  proc getStreamVolumeDB*(stream: jint, index: jint, device: android.media.audio.common.AudioDeviceDescription): jfloat
  proc getSurroundFormats*(count: android.media.audio.common.Int, formats: seq[android.media.audio.common.AudioFormatDescription], formatsEnabled: seq[jboolean])
  proc getReportedSurroundFormats*(count: android.media.audio.common.Int, formats: seq[android.media.audio.common.AudioFormatDescription])
  proc getHwOffloadFormatsSupportedForBluetoothMedia*(device: android.media.audio.common.AudioDeviceDescription): seq[android.media.audio.common.AudioFormatDescription]
  proc setSurroundFormatEnabled*(audioFormat: android.media.audio.common.AudioFormatDescription, enabled: jboolean)
  proc setAssistantServicesUids*(uids: seq[jint])
  proc setActiveAssistantServicesUids*(activeUids: seq[jint])
  proc setA11yServicesUids*(uids: seq[jint])
  proc setCurrentImeUid*(uid: jint)
  proc isHapticPlaybackSupported*(): jboolean
  proc isUltrasoundSupported*(): jboolean
  proc isHotwordStreamSupported*(lookbackAudio: jboolean): jboolean
  proc listAudioProductStrategies*(): seq[android.media.AudioProductStrategy]
  proc getProductStrategyFromAudioAttributes*(aa: android.media.audio.common.AudioAttributes, fallbackOnDefault: jboolean): jint
  proc listAudioVolumeGroups*(): seq[android.media.AudioVolumeGroup]
  proc getVolumeGroupFromAudioAttributes*(aa: android.media.audio.common.AudioAttributes, fallbackOnDefault: jboolean): jint
  proc setRttEnabled*(enabled: jboolean)
  proc isCallScreenModeSupported*(): jboolean
  proc setDevicesRoleForStrategy*(strategy: jint, role: jint, devices: seq[android.media.audio.common.AudioDevice])
  proc removeDevicesRoleForStrategy*(strategy: jint, role: jint, devices: seq[android.media.audio.common.AudioDevice])
  proc clearDevicesRoleForStrategy*(strategy: jint, role: jint)
  proc getDevicesForRoleAndStrategy*(strategy: jint, role: jint): seq[android.media.audio.common.AudioDevice]
  proc setDevicesRoleForCapturePreset*(audioSource: jint, role: jint, devices: seq[android.media.audio.common.AudioDevice])
  proc addDevicesRoleForCapturePreset*(audioSource: jint, role: jint, devices: seq[android.media.audio.common.AudioDevice])
  proc removeDevicesRoleForCapturePreset*(audioSource: jint, role: jint, devices: seq[android.media.audio.common.AudioDevice])
  proc clearDevicesRoleForCapturePreset*(audioSource: jint, role: jint)
  proc getDevicesForRoleAndCapturePreset*(audioSource: jint, role: jint): seq[android.media.audio.common.AudioDevice]
  proc registerSoundTriggerCaptureStateListener*(listener: android.media.ICaptureStateListener): jboolean
  proc getSpatializer*(callback: android.media.INativeSpatializerCallback): android.media.GetSpatializerResponse
  proc canBeSpatialized*(attr: android.media.audio.common.AudioAttributes, config: android.media.audio.common.AudioConfig, devices: seq[android.media.audio.common.AudioDevice]): jboolean
  proc getDirectPlaybackSupport*(attr: android.media.audio.common.AudioAttributes, config: android.media.audio.common.AudioConfig): jint
  proc getDirectProfilesForAttributes*(attr: android.media.audio.common.AudioAttributes): seq[android.media.audio.common.AudioProfile]
  proc getSupportedMixerAttributes*(portId: jint): seq[android.media.AudioMixerAttributesInternal]
  proc setPreferredMixerAttributes*(attr: android.media.audio.common.AudioAttributes, portId: jint, uid: jint, mixerAttr: android.media.AudioMixerAttributesInternal)
  proc getPreferredMixerAttributes*(attr: android.media.audio.common.AudioAttributes, portId: jint): android.media.AudioMixerAttributesInternal
  proc clearPreferredMixerAttributes*(attr: android.media.audio.common.AudioAttributes, portId: jint, uid: jint)
  proc getPermissionController*(): com.android.media.permission.INativePermissionController
  proc getMmapPolicyInfos*(policyType: jint): seq[android.media.audio.common.AudioMMapPolicyInfo]
  proc getMmapPolicyForDevice*(policyType: jint, policyInfo: android.media.audio.common.AudioMMapPolicyInfo)
  proc setEnableHardening*(shouldEnable: jboolean)
  DESCRIPTOR*: string {.`static`.}

jclass android.media.IAudioPolicyService.Default* of JVMObject:
  proc onNewAudioModulesAvailable*()
  proc setDeviceConnectionState*(state: jint, port: android.media.audio.common.AudioPort, encodedFormat: android.media.audio.common.AudioFormatDescription, deviceSwitch: jboolean)
  proc getDeviceConnectionState*(device: android.media.audio.common.AudioDevice): jint
  proc handleDeviceConfigChange*(device: android.media.audio.common.AudioDevice, deviceName: string, encodedFormat: android.media.audio.common.AudioFormatDescription)
  proc setPhoneState*(state: jint, uid: jint)
  proc setForceUse*(usage: jint, config: jint)
  proc getForceUse*(usage: jint): jint
  proc getOutput*(stream: jint): jint
  proc getOutputForAttr*(attr: android.media.audio.common.AudioAttributes, session: jint, attributionSource: android.content.AttributionSourceState, config: android.media.audio.common.AudioConfig, flags: jint, selectedDeviceIds: seq[jint]): android.media.GetOutputForAttrResponse
  proc startOutput*(portId: jint)
  proc stopOutput*(portId: jint)
  proc releaseOutput*(portId: jint)
  proc getInputForAttr*(attr: android.media.audio.common.AudioAttributes, input: jint, riid: jint, session: jint, attributionSource: android.content.AttributionSourceState, config: android.media.audio.common.AudioConfigBase, flags: jint, selectedDeviceId: jint): android.media.GetInputForAttrResponse
  proc startInput*(portId: jint)
  proc stopInput*(portId: jint)
  proc releaseInput*(portId: jint)
  proc setDeviceAbsoluteVolumeEnabled*(device: android.media.audio.common.AudioDevice, enabled: jboolean, streamToDriveAbs: jint)
  proc initStreamVolume*(stream: jint, indexMin: jint, indexMax: jint)
  proc setStreamVolumeIndex*(stream: jint, device: android.media.audio.common.AudioDeviceDescription, index: jint, muted: jboolean)
  proc getStreamVolumeIndex*(stream: jint, device: android.media.audio.common.AudioDeviceDescription): jint
  proc setVolumeIndexForAttributes*(attr: android.media.audio.common.AudioAttributes, device: android.media.audio.common.AudioDeviceDescription, index: jint, muted: jboolean)
  proc getVolumeIndexForAttributes*(attr: android.media.audio.common.AudioAttributes, device: android.media.audio.common.AudioDeviceDescription): jint
  proc getMaxVolumeIndexForAttributes*(attr: android.media.audio.common.AudioAttributes): jint
  proc getMinVolumeIndexForAttributes*(attr: android.media.audio.common.AudioAttributes): jint
  proc getStrategyForStream*(stream: jint): jint
  proc getDevicesForAttributes*(attr: android.media.audio.common.AudioAttributes, forVolume: jboolean): seq[android.media.audio.common.AudioDevice]
  proc getOutputForEffect*(desc: android.media.EffectDescriptor): jint
  proc registerEffect*(desc: android.media.EffectDescriptor, io: jint, strategy: jint, session: jint, id: jint)
  proc unregisterEffect*(id: jint)
  proc setEffectEnabled*(id: jint, enabled: jboolean)
  proc moveEffectsToIo*(ids: seq[jint], io: jint)
  proc isStreamActive*(stream: jint, inPastMs: jint): jboolean
  proc isStreamActiveRemotely*(stream: jint, inPastMs: jint): jboolean
  proc isSourceActive*(source: jint): jboolean
  proc queryDefaultPreProcessing*(audioSession: jint, count: android.media.audio.common.Int): seq[android.media.EffectDescriptor]
  proc addSourceDefaultEffect*(type: android.media.audio.common.AudioUuid, opPackageName: string, uuid: android.media.audio.common.AudioUuid, priority: jint, source: jint): jint
  proc addStreamDefaultEffect*(type: android.media.audio.common.AudioUuid, opPackageName: string, uuid: android.media.audio.common.AudioUuid, priority: jint, usage: jint): jint
  proc removeSourceDefaultEffect*(id: jint)
  proc removeStreamDefaultEffect*(id: jint)
  proc setSupportedSystemUsages*(systemUsages: seq[jint])
  proc setAllowedCapturePolicy*(uid: jint, capturePolicy: jint)
  proc getOffloadSupport*(info: android.media.audio.common.AudioOffloadInfo): jint
  proc isDirectOutputSupported*(config: android.media.audio.common.AudioConfigBase, attributes: android.media.audio.common.AudioAttributes): jboolean
  proc listAudioPorts*(role: jint, type: jint, count: android.media.audio.common.Int, ports: seq[android.media.AudioPortFw]): jint
  proc listDeclaredDevicePorts*(role: jint): seq[android.media.AudioPortFw]
  proc getAudioPort*(portId: jint): android.media.AudioPortFw
  proc createAudioPatch*(patch: android.media.AudioPatchFw, handle: jint): jint
  proc releaseAudioPatch*(handle: jint)
  proc listAudioPatches*(count: android.media.audio.common.Int, patches: seq[android.media.AudioPatchFw]): jint
  proc setAudioPortConfig*(config: android.media.AudioPortConfigFw)
  proc registerClient*(client: android.media.IAudioPolicyServiceClient)
  proc setAudioPortCallbacksEnabled*(enabled: jboolean)
  proc setAudioVolumeGroupCallbacksEnabled*(enabled: jboolean)
  proc acquireSoundTriggerSession*(): android.media.SoundTriggerSession
  proc releaseSoundTriggerSession*(session: jint)
  proc getPhoneState*(): jint
  proc registerPolicyMixes*(mixes: seq[android.media.AudioMix], registration: jboolean)
  proc getRegisteredPolicyMixes*(): java.util.List[android.media.AudioMix]
  proc updatePolicyMixes*(updates: seq[android.media.AudioMixUpdate])
  proc setUidDeviceAffinities*(uid: jint, devices: seq[android.media.audio.common.AudioDevice])
  proc removeUidDeviceAffinities*(uid: jint)
  proc setUserIdDeviceAffinities*(userId: jint, devices: seq[android.media.audio.common.AudioDevice])
  proc removeUserIdDeviceAffinities*(userId: jint)
  proc startAudioSource*(source: android.media.AudioPortConfigFw, attributes: android.media.audio.common.AudioAttributes): jint
  proc stopAudioSource*(portId: jint)
  proc setMasterMono*(mono: jboolean)
  proc getMasterMono*(): jboolean
  proc getStreamVolumeDB*(stream: jint, index: jint, device: android.media.audio.common.AudioDeviceDescription): jfloat
  proc getSurroundFormats*(count: android.media.audio.common.Int, formats: seq[android.media.audio.common.AudioFormatDescription], formatsEnabled: seq[jboolean])
  proc getReportedSurroundFormats*(count: android.media.audio.common.Int, formats: seq[android.media.audio.common.AudioFormatDescription])
  proc getHwOffloadFormatsSupportedForBluetoothMedia*(device: android.media.audio.common.AudioDeviceDescription): seq[android.media.audio.common.AudioFormatDescription]
  proc setSurroundFormatEnabled*(audioFormat: android.media.audio.common.AudioFormatDescription, enabled: jboolean)
  proc setAssistantServicesUids*(uids: seq[jint])
  proc setActiveAssistantServicesUids*(activeUids: seq[jint])
  proc setA11yServicesUids*(uids: seq[jint])
  proc setCurrentImeUid*(uid: jint)
  proc isHapticPlaybackSupported*(): jboolean
  proc isUltrasoundSupported*(): jboolean
  proc isHotwordStreamSupported*(lookbackAudio: jboolean): jboolean
  proc listAudioProductStrategies*(): seq[android.media.AudioProductStrategy]
  proc getProductStrategyFromAudioAttributes*(aa: android.media.audio.common.AudioAttributes, fallbackOnDefault: jboolean): jint
  proc listAudioVolumeGroups*(): seq[android.media.AudioVolumeGroup]
  proc getVolumeGroupFromAudioAttributes*(aa: android.media.audio.common.AudioAttributes, fallbackOnDefault: jboolean): jint
  proc setRttEnabled*(enabled: jboolean)
  proc isCallScreenModeSupported*(): jboolean
  proc setDevicesRoleForStrategy*(strategy: jint, role: jint, devices: seq[android.media.audio.common.AudioDevice])
  proc removeDevicesRoleForStrategy*(strategy: jint, role: jint, devices: seq[android.media.audio.common.AudioDevice])
  proc clearDevicesRoleForStrategy*(strategy: jint, role: jint)
  proc getDevicesForRoleAndStrategy*(strategy: jint, role: jint): seq[android.media.audio.common.AudioDevice]
  proc setDevicesRoleForCapturePreset*(audioSource: jint, role: jint, devices: seq[android.media.audio.common.AudioDevice])
  proc addDevicesRoleForCapturePreset*(audioSource: jint, role: jint, devices: seq[android.media.audio.common.AudioDevice])
  proc removeDevicesRoleForCapturePreset*(audioSource: jint, role: jint, devices: seq[android.media.audio.common.AudioDevice])
  proc clearDevicesRoleForCapturePreset*(audioSource: jint, role: jint)
  proc getDevicesForRoleAndCapturePreset*(audioSource: jint, role: jint): seq[android.media.audio.common.AudioDevice]
  proc registerSoundTriggerCaptureStateListener*(listener: android.media.ICaptureStateListener): jboolean
  proc getSpatializer*(callback: android.media.INativeSpatializerCallback): android.media.GetSpatializerResponse
  proc canBeSpatialized*(attr: android.media.audio.common.AudioAttributes, config: android.media.audio.common.AudioConfig, devices: seq[android.media.audio.common.AudioDevice]): jboolean
  proc getDirectPlaybackSupport*(attr: android.media.audio.common.AudioAttributes, config: android.media.audio.common.AudioConfig): jint
  proc getDirectProfilesForAttributes*(attr: android.media.audio.common.AudioAttributes): seq[android.media.audio.common.AudioProfile]
  proc getSupportedMixerAttributes*(portId: jint): seq[android.media.AudioMixerAttributesInternal]
  proc setPreferredMixerAttributes*(attr: android.media.audio.common.AudioAttributes, portId: jint, uid: jint, mixerAttr: android.media.AudioMixerAttributesInternal)
  proc getPreferredMixerAttributes*(attr: android.media.audio.common.AudioAttributes, portId: jint): android.media.AudioMixerAttributesInternal
  proc clearPreferredMixerAttributes*(attr: android.media.audio.common.AudioAttributes, portId: jint, uid: jint)
  proc getPermissionController*(): com.android.media.permission.INativePermissionController
  proc getMmapPolicyInfos*(policyType: jint): seq[android.media.audio.common.AudioMMapPolicyInfo]
  proc getMmapPolicyForDevice*(policyType: jint, policyInfo: android.media.audio.common.AudioMMapPolicyInfo)
  proc setEnableHardening*(shouldEnable: jboolean)
  proc asBinder*(): android.os.IBinder

jclass android.media.IAudioPolicyService.Stub* of JVMObject:
  proc asInterface*(obj: android.os.IBinder): android.media.IAudioPolicyService {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

jclass android.media.Default* of JVMObject:
  proc onNewAudioModulesAvailable*()
  proc setDeviceConnectionState*(state: jint, port: android.media.audio.common.AudioPort, encodedFormat: android.media.audio.common.AudioFormatDescription, deviceSwitch: jboolean)
  proc getDeviceConnectionState*(device: android.media.audio.common.AudioDevice): jint
  proc handleDeviceConfigChange*(device: android.media.audio.common.AudioDevice, deviceName: string, encodedFormat: android.media.audio.common.AudioFormatDescription)
  proc setPhoneState*(state: jint, uid: jint)
  proc setForceUse*(usage: jint, config: jint)
  proc getForceUse*(usage: jint): jint
  proc getOutput*(stream: jint): jint
  proc getOutputForAttr*(attr: android.media.audio.common.AudioAttributes, session: jint, attributionSource: android.content.AttributionSourceState, config: android.media.audio.common.AudioConfig, flags: jint, selectedDeviceIds: seq[jint]): android.media.GetOutputForAttrResponse
  proc startOutput*(portId: jint)
  proc stopOutput*(portId: jint)
  proc releaseOutput*(portId: jint)
  proc getInputForAttr*(attr: android.media.audio.common.AudioAttributes, input: jint, riid: jint, session: jint, attributionSource: android.content.AttributionSourceState, config: android.media.audio.common.AudioConfigBase, flags: jint, selectedDeviceId: jint): android.media.GetInputForAttrResponse
  proc startInput*(portId: jint)
  proc stopInput*(portId: jint)
  proc releaseInput*(portId: jint)
  proc setDeviceAbsoluteVolumeEnabled*(device: android.media.audio.common.AudioDevice, enabled: jboolean, streamToDriveAbs: jint)
  proc initStreamVolume*(stream: jint, indexMin: jint, indexMax: jint)
  proc setStreamVolumeIndex*(stream: jint, device: android.media.audio.common.AudioDeviceDescription, index: jint, muted: jboolean)
  proc getStreamVolumeIndex*(stream: jint, device: android.media.audio.common.AudioDeviceDescription): jint
  proc setVolumeIndexForAttributes*(attr: android.media.audio.common.AudioAttributes, device: android.media.audio.common.AudioDeviceDescription, index: jint, muted: jboolean)
  proc getVolumeIndexForAttributes*(attr: android.media.audio.common.AudioAttributes, device: android.media.audio.common.AudioDeviceDescription): jint
  proc getMaxVolumeIndexForAttributes*(attr: android.media.audio.common.AudioAttributes): jint
  proc getMinVolumeIndexForAttributes*(attr: android.media.audio.common.AudioAttributes): jint
  proc getStrategyForStream*(stream: jint): jint
  proc getDevicesForAttributes*(attr: android.media.audio.common.AudioAttributes, forVolume: jboolean): seq[android.media.audio.common.AudioDevice]
  proc getOutputForEffect*(desc: android.media.EffectDescriptor): jint
  proc registerEffect*(desc: android.media.EffectDescriptor, io: jint, strategy: jint, session: jint, id: jint)
  proc unregisterEffect*(id: jint)
  proc setEffectEnabled*(id: jint, enabled: jboolean)
  proc moveEffectsToIo*(ids: seq[jint], io: jint)
  proc isStreamActive*(stream: jint, inPastMs: jint): jboolean
  proc isStreamActiveRemotely*(stream: jint, inPastMs: jint): jboolean
  proc isSourceActive*(source: jint): jboolean
  proc queryDefaultPreProcessing*(audioSession: jint, count: android.media.audio.common.Int): seq[android.media.EffectDescriptor]
  proc addSourceDefaultEffect*(type: android.media.audio.common.AudioUuid, opPackageName: string, uuid: android.media.audio.common.AudioUuid, priority: jint, source: jint): jint
  proc addStreamDefaultEffect*(type: android.media.audio.common.AudioUuid, opPackageName: string, uuid: android.media.audio.common.AudioUuid, priority: jint, usage: jint): jint
  proc removeSourceDefaultEffect*(id: jint)
  proc removeStreamDefaultEffect*(id: jint)
  proc setSupportedSystemUsages*(systemUsages: seq[jint])
  proc setAllowedCapturePolicy*(uid: jint, capturePolicy: jint)
  proc getOffloadSupport*(info: android.media.audio.common.AudioOffloadInfo): jint
  proc isDirectOutputSupported*(config: android.media.audio.common.AudioConfigBase, attributes: android.media.audio.common.AudioAttributes): jboolean
  proc listAudioPorts*(role: jint, type: jint, count: android.media.audio.common.Int, ports: seq[android.media.AudioPortFw]): jint
  proc listDeclaredDevicePorts*(role: jint): seq[android.media.AudioPortFw]
  proc getAudioPort*(portId: jint): android.media.AudioPortFw
  proc createAudioPatch*(patch: android.media.AudioPatchFw, handle: jint): jint
  proc releaseAudioPatch*(handle: jint)
  proc listAudioPatches*(count: android.media.audio.common.Int, patches: seq[android.media.AudioPatchFw]): jint
  proc setAudioPortConfig*(config: android.media.AudioPortConfigFw)
  proc registerClient*(client: android.media.IAudioPolicyServiceClient)
  proc setAudioPortCallbacksEnabled*(enabled: jboolean)
  proc setAudioVolumeGroupCallbacksEnabled*(enabled: jboolean)
  proc acquireSoundTriggerSession*(): android.media.SoundTriggerSession
  proc releaseSoundTriggerSession*(session: jint)
  proc getPhoneState*(): jint
  proc registerPolicyMixes*(mixes: seq[android.media.AudioMix], registration: jboolean)
  proc getRegisteredPolicyMixes*(): java.util.List[android.media.AudioMix]
  proc updatePolicyMixes*(updates: seq[android.media.AudioMixUpdate])
  proc setUidDeviceAffinities*(uid: jint, devices: seq[android.media.audio.common.AudioDevice])
  proc removeUidDeviceAffinities*(uid: jint)
  proc setUserIdDeviceAffinities*(userId: jint, devices: seq[android.media.audio.common.AudioDevice])
  proc removeUserIdDeviceAffinities*(userId: jint)
  proc startAudioSource*(source: android.media.AudioPortConfigFw, attributes: android.media.audio.common.AudioAttributes): jint
  proc stopAudioSource*(portId: jint)
  proc setMasterMono*(mono: jboolean)
  proc getMasterMono*(): jboolean
  proc getStreamVolumeDB*(stream: jint, index: jint, device: android.media.audio.common.AudioDeviceDescription): jfloat
  proc getSurroundFormats*(count: android.media.audio.common.Int, formats: seq[android.media.audio.common.AudioFormatDescription], formatsEnabled: seq[jboolean])
  proc getReportedSurroundFormats*(count: android.media.audio.common.Int, formats: seq[android.media.audio.common.AudioFormatDescription])
  proc getHwOffloadFormatsSupportedForBluetoothMedia*(device: android.media.audio.common.AudioDeviceDescription): seq[android.media.audio.common.AudioFormatDescription]
  proc setSurroundFormatEnabled*(audioFormat: android.media.audio.common.AudioFormatDescription, enabled: jboolean)
  proc setAssistantServicesUids*(uids: seq[jint])
  proc setActiveAssistantServicesUids*(activeUids: seq[jint])
  proc setA11yServicesUids*(uids: seq[jint])
  proc setCurrentImeUid*(uid: jint)
  proc isHapticPlaybackSupported*(): jboolean
  proc isUltrasoundSupported*(): jboolean
  proc isHotwordStreamSupported*(lookbackAudio: jboolean): jboolean
  proc listAudioProductStrategies*(): seq[android.media.AudioProductStrategy]
  proc getProductStrategyFromAudioAttributes*(aa: android.media.audio.common.AudioAttributes, fallbackOnDefault: jboolean): jint
  proc listAudioVolumeGroups*(): seq[android.media.AudioVolumeGroup]
  proc getVolumeGroupFromAudioAttributes*(aa: android.media.audio.common.AudioAttributes, fallbackOnDefault: jboolean): jint
  proc setRttEnabled*(enabled: jboolean)
  proc isCallScreenModeSupported*(): jboolean
  proc setDevicesRoleForStrategy*(strategy: jint, role: jint, devices: seq[android.media.audio.common.AudioDevice])
  proc removeDevicesRoleForStrategy*(strategy: jint, role: jint, devices: seq[android.media.audio.common.AudioDevice])
  proc clearDevicesRoleForStrategy*(strategy: jint, role: jint)
  proc getDevicesForRoleAndStrategy*(strategy: jint, role: jint): seq[android.media.audio.common.AudioDevice]
  proc setDevicesRoleForCapturePreset*(audioSource: jint, role: jint, devices: seq[android.media.audio.common.AudioDevice])
  proc addDevicesRoleForCapturePreset*(audioSource: jint, role: jint, devices: seq[android.media.audio.common.AudioDevice])
  proc removeDevicesRoleForCapturePreset*(audioSource: jint, role: jint, devices: seq[android.media.audio.common.AudioDevice])
  proc clearDevicesRoleForCapturePreset*(audioSource: jint, role: jint)
  proc getDevicesForRoleAndCapturePreset*(audioSource: jint, role: jint): seq[android.media.audio.common.AudioDevice]
  proc registerSoundTriggerCaptureStateListener*(listener: android.media.ICaptureStateListener): jboolean
  proc getSpatializer*(callback: android.media.INativeSpatializerCallback): android.media.GetSpatializerResponse
  proc canBeSpatialized*(attr: android.media.audio.common.AudioAttributes, config: android.media.audio.common.AudioConfig, devices: seq[android.media.audio.common.AudioDevice]): jboolean
  proc getDirectPlaybackSupport*(attr: android.media.audio.common.AudioAttributes, config: android.media.audio.common.AudioConfig): jint
  proc getDirectProfilesForAttributes*(attr: android.media.audio.common.AudioAttributes): seq[android.media.audio.common.AudioProfile]
  proc getSupportedMixerAttributes*(portId: jint): seq[android.media.AudioMixerAttributesInternal]
  proc setPreferredMixerAttributes*(attr: android.media.audio.common.AudioAttributes, portId: jint, uid: jint, mixerAttr: android.media.AudioMixerAttributesInternal)
  proc getPreferredMixerAttributes*(attr: android.media.audio.common.AudioAttributes, portId: jint): android.media.AudioMixerAttributesInternal
  proc clearPreferredMixerAttributes*(attr: android.media.audio.common.AudioAttributes, portId: jint, uid: jint)
  proc getPermissionController*(): com.android.media.permission.INativePermissionController
  proc getMmapPolicyInfos*(policyType: jint): seq[android.media.audio.common.AudioMMapPolicyInfo]
  proc getMmapPolicyForDevice*(policyType: jint, policyInfo: android.media.audio.common.AudioMMapPolicyInfo)
  proc setEnableHardening*(shouldEnable: jboolean)
  proc asBinder*(): android.os.IBinder

jclass android.media.Stub* of Binder:
  proc asInterface*(obj: android.os.IBinder): android.media.IAudioPolicyService {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

