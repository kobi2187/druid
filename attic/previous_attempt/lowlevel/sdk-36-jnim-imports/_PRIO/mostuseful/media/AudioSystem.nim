import jnim

jclass android.media.AudioSystem* of JVMObject:
  proc getNumStreamTypes*(): jint {.`static`.}
  proc muteMicrophone*(on: jboolean): jint {.`static`.}
  proc isMicrophoneMuted*(): jboolean {.`static`.}
  proc modeToString*(mode: jint): string {.`static`.}
  proc audioFormatToBluetoothSourceCodec*(audioFormat: jint): jint {.`static`.}
  proc audioFormatToBluetoothLeAudioSourceCodec*(audioFormat: jint): jint {.`static`.}
  proc bluetoothA2dpCodecToAudioFormat*(btCodec: jint): jint {.`static`.}
  proc bluetoothLeCodecToAudioFormat*(btCodec: jint): jint {.`static`.}
  proc audioFormatToString*(audioFormat: jint): string {.`static`.}
  proc isStreamActive*(stream: jint, inPastMs: jint): jboolean {.`static`.}
  proc isStreamActiveRemotely*(stream: jint, inPastMs: jint): jboolean {.`static`.}
  proc isSourceActive*(source: jint): jboolean {.`static`.}
  proc newAudioSessionId*(): jint {.`static`.}
  proc newAudioPlayerId*(): jint {.`static`.}
  proc newAudioRecorderId*(): jint {.`static`.}
  proc setParameters*(keyValuePairs: string): jint {.`static`.}
  proc getParameters*(keys: string): string {.`static`.}
  proc setErrorCallback*(cb: ErrorCallback) {.`static`.}
  proc setDynamicPolicyCallback*(cb: DynamicPolicyCallback) {.`static`.}
  proc setRecordingCallback*(cb: AudioRecordingCallback) {.`static`.}
  proc setRoutingCallback*(cb: RoutingUpdateCallback) {.`static`.}
  proc setVolumeRangeInitRequestCallback*(cb: VolumeRangeInitRequestCallback) {.`static`.}
  proc audioSystemErrorToString*(error: jint): string {.`static`.}
  proc isInputDevice*(deviceType: jint): jboolean {.`static`.}
  proc isBluetoothDevice*(deviceType: jint): jboolean {.`static`.}
  proc isBluetoothOutDevice*(deviceType: jint): jboolean {.`static`.}
  proc isBluetoothInDevice*(deviceType: jint): jboolean {.`static`.}
  proc isBluetoothA2dpOutDevice*(deviceType: jint): jboolean {.`static`.}
  proc isBluetoothScoOutDevice*(deviceType: jint): jboolean {.`static`.}
  proc isBluetoothScoInDevice*(deviceType: jint): jboolean {.`static`.}
  proc isBluetoothScoDevice*(deviceType: jint): jboolean {.`static`.}
  proc isBluetoothLeOutDevice*(deviceType: jint): jboolean {.`static`.}
  proc isBluetoothLeInDevice*(deviceType: jint): jboolean {.`static`.}
  proc isBluetoothLeDevice*(deviceType: jint): jboolean {.`static`.}
  proc isRemoteSubmixDevice*(deviceType: jint): jboolean {.`static`.}
  proc deviceStateToString*(state: jint): string {.`static`.}
  proc getOutputDeviceName*(device: jint): string {.`static`.}
  proc getInputDeviceName*(device: jint): string {.`static`.}
  proc getDeviceName*(device: jint): string {.`static`.}
  proc forceUseConfigToString*(config: jint): string {.`static`.}
  proc forceUseUsageToString*(usage: jint): string {.`static`.}
  proc setStreamVolumeIndexAS*(stream: jint, index: jint, muted: jboolean, device: jint): jint {.`static`.}
  proc setDeviceConnectionState*(attributes: AudioDeviceAttributes, state: jint, codecFormat: jint): jint {.`static`.}
  proc setDeviceConnectionState*(attributes: AudioDeviceAttributes, state: jint, codecFormat: jint, deviceSwitch: jboolean): jint {.`static`.}
  proc setDeviceConnectionState*(state: jint, parcel: Parcel, codecFormat: jint, deviceSwitch: jboolean): jint {.`static`.}
  proc getDeviceConnectionState*(device: jint, device_address: string): jint {.`static`.}
  proc handleDeviceConfigChange*(device: jint, device_address: string, device_name: string, codecFormat: jint): jint {.`static`.}
  proc setPhoneState*(state: jint): jint {.`static`.}
  proc setPhoneState*(state: jint, uid: jint): jint {.`static`.}
  proc setForceUse*(usage: jint, config: jint): jint {.`static`.}
  proc getForceUse*(usage: jint): jint {.`static`.}
  proc setDeviceAbsoluteVolumeEnabled*(nativeDeviceType: jint, address: string, enabled: jboolean, streamToDriveAbs: jint): jint {.`static`.}
  proc initStreamVolume*(stream: jint, indexMin: jint, indexMax: jint): jint {.`static`.}
  proc getStreamVolumeIndex*(stream: jint, device: jint): jint {.`static`.}
  proc setVolumeIndexForAttributes*(attributes: AudioAttributes, index: jint, muted: jboolean, device: jint): jint {.`static`.}
  proc getVolumeIndexForAttributes*(attributes: AudioAttributes, device: jint): jint {.`static`.}
  proc getMinVolumeIndexForAttributes*(attributes: AudioAttributes): jint {.`static`.}
  proc getMaxVolumeIndexForAttributes*(attributes: AudioAttributes): jint {.`static`.}
  proc setMasterVolume*(value: jfloat): jint {.`static`.}
  proc getMasterVolume*(): jfloat {.`static`.}
  proc setMasterMute*(mute: jboolean): jint {.`static`.}
  proc getMasterMute*(): jboolean {.`static`.}
  proc getDevicesForStream*(stream: jint): jint {.`static`.}
  proc getDeviceMaskFromSet*(deviceSet: Set[Integer]): jint {.`static`.}
  proc deviceSetToString*(devices: Set[Integer]): string {.`static`.}
  proc getDevicesForAttributes*(attributes: AudioAttributes, forVolume: jboolean): ArrayList[AudioDeviceAttributes] {.`static`.}
  proc getMasterMono*(): jboolean {.`static`.}
  proc setMasterMono*(mono: jboolean): jint {.`static`.}
  proc setRttEnabled*(enabled: jboolean): jint {.`static`.}
  proc getMasterBalance*(): jfloat {.`static`.}
  proc setMasterBalance*(balance: jfloat): jint {.`static`.}
  proc getPrimaryOutputSamplingRate*(): jint {.`static`.}
  proc getPrimaryOutputFrameCount*(): jint {.`static`.}
  proc getOutputLatency*(stream: jint): jint {.`static`.}
  proc setLowRamDevice*(isLowRamDevice: jboolean, totalMemory: jlong): jint {.`static`.}
  proc checkAudioFlinger*(): jint {.`static`.}
  proc setAudioFlingerBinder*(audioFlinger: IBinder) {.`static`.}
  proc listAudioPorts*(ports: ArrayList[AudioPort], generation: seq[jint]): jint {.`static`.}
  proc getSupportedDeviceTypes*(flags: jint, internalDeviceTypes: IntArray): jint {.`static`.}
  proc createAudioPatch*(patch: seq[AudioPatch], sources: seq[AudioPortConfig], sinks: seq[AudioPortConfig]): jint {.`static`.}
  proc releaseAudioPatch*(patch: AudioPatch): jint {.`static`.}
  proc listAudioPatches*(patches: ArrayList[AudioPatch], generation: seq[jint]): jint {.`static`.}
  proc setAudioPortConfig*(config: AudioPortConfig): jint {.`static`.}
  proc startAudioSource*(config: AudioPortConfig, audioAttributes: AudioAttributes): jint {.`static`.}
  proc stopAudioSource*(handle: jint): jint {.`static`.}
  proc getAudioHwSyncForSession*(sessionId: jint): jint {.`static`.}
  proc registerPolicyMixes*(mixes: ArrayList[AudioMix], register: jboolean): jint {.`static`.}
  proc getRegisteredPolicyMixes*(devices: List[AudioMix]): jint {.`static`.}
  proc updatePolicyMixes*(mixes: seq[AudioMix], updatedMixingRules: seq[AudioMixingRule]): jint {.`static`.}
  proc setUidDeviceAffinities*(uid: jint, types: seq[jint], addresses: seq[string]): jint {.`static`.}
  proc removeUidDeviceAffinities*(uid: jint): jint {.`static`.}
  proc setUserIdDeviceAffinities*(userId: jint, types: seq[jint], addresses: seq[string]): jint {.`static`.}
  proc removeUserIdDeviceAffinities*(userId: jint): jint {.`static`.}
  proc systemReady*(): jint {.`static`.}
  proc getStreamVolumeDB*(stream: jint, index: jint, device: jint): jfloat {.`static`.}
  proc setSupportedSystemUsages*(systemUsages: seq[jint]): jint {.`static`.}
  proc setAllowedCapturePolicy*(uid: jint, flags: jint): jint {.`static`.}
  proc getDirectPlaybackSupport*(format: AudioFormat, attributes: AudioAttributes): jint {.`static`.}
  proc getMicrophones*(microphonesInfo: ArrayList[MicrophoneInfo]): jint {.`static`.}
  proc getSurroundFormats*(surroundFormats: Map[Integer, Boolean]): jint {.`static`.}
  proc getReportedSurroundFormats*(surroundFormats: ArrayList[Integer]): jint {.`static`.}
  proc getHwOffloadFormatsSupportedForBluetoothMedia*(deviceType: jint, formatList: ArrayList[Integer]): jint {.`static`.}
  proc setSurroundFormatEnabled*(audioFormat: jint, enabled: jboolean): jint {.`static`.}
  proc setActiveAssistantServicesUids*(uids: seq[jint]): jint {.`static`.}
  proc setAssistantServicesUids*(uids: seq[jint]): jint {.`static`.}
  proc setA11yServicesUids*(uids: seq[jint]): jint {.`static`.}
  proc setCurrentImeUid*(uid: jint): jint {.`static`.}
  proc isHapticPlaybackSupported*(): jboolean {.`static`.}
  proc isUltrasoundSupported*(): jboolean {.`static`.}
  proc setAudioHalPids*(pids: seq[jint]): jint {.`static`.}
  proc isCallScreeningModeSupported*(): jboolean {.`static`.}
  proc setDevicesRoleForStrategy*(strategy: jint, role: jint, devices: List[AudioDeviceAttributes]): jint {.`static`.}
  proc removeDevicesRoleForStrategy*(strategy: jint, role: jint, devices: List[AudioDeviceAttributes]): jint {.`static`.}
  proc removeDevicesRoleForStrategy*(strategy: jint, role: jint, types: seq[jint], addresses: seq[string]): jint {.`static`.}
  proc clearDevicesRoleForStrategy*(strategy: jint, role: jint): jint {.`static`.}
  proc getDevicesForRoleAndStrategy*(strategy: jint, role: jint, devices: List[AudioDeviceAttributes]): jint {.`static`.}
  proc setDevicesRoleForCapturePreset*(capturePreset: jint, role: jint, devices: List[AudioDeviceAttributes]): jint {.`static`.}
  proc addDevicesRoleForCapturePreset*(capturePreset: jint, role: jint, devices: List[AudioDeviceAttributes]): jint {.`static`.}
  proc removeDevicesRoleForCapturePreset*(capturePreset: jint, role: jint, devices: List[AudioDeviceAttributes]): jint {.`static`.}
  proc clearDevicesRoleForCapturePreset*(capturePreset: jint, role: jint): jint {.`static`.}
  proc getDevicesForRoleAndCapturePreset*(capturePreset: jint, role: jint, devices: List[AudioDeviceAttributes]): jint {.`static`.}
  proc setVibratorInfos*(vibrators: List[Vibrator]): jint {.`static`.}
  proc getSpatializer*(callback: INativeSpatializerCallback): ISpatializer {.`static`.}
  proc canBeSpatialized*(attributes: AudioAttributes, format: AudioFormat, devices: seq[AudioDeviceAttributes]): jboolean {.`static`.}
  proc getSoundDoseInterface*(callback: ISoundDoseCallback): ISoundDose {.`static`.}
  proc getDirectProfilesForAttributes*(attributes: AudioAttributes, audioProfilesList: ArrayList[AudioProfile]): jint {.`static`.}
  proc getValueForVibrateSetting*(existingValue: jint, vibrateType: jint, vibrateSetting: jint): jint {.`static`.}
  proc getDefaultStreamVolume*(streamType: jint): jint {.`static`.}
  proc streamToString*(stream: jint): string {.`static`.}
  proc getPlatformType*(context: Context): jint {.`static`.}
  proc isSingleVolume*(context: Context): jboolean {.`static`.}
  proc generateAudioDeviceTypesSet*(deviceList: List[AudioDeviceAttributes]): Set[Integer] {.`static`.}
  proc intersectionAudioDeviceTypes*(a: Set[Integer], b: Set[Integer]): Set[Integer] {.`static`.}
  proc isSingleAudioDeviceType*(types: Set[Integer], type: jint): jboolean {.`static`.}
  proc isLeAudioDeviceType*(type: jint): jboolean {.`static`.}
  proc getSupportedMixerAttributes*(deviceId: jint, mixerAttrs: List[AudioMixerAttributes]): jint {.`static`.}
  proc setPreferredMixerAttributes*(attributes: AudioAttributes, portId: jint, uid: jint, mixerAttributes: AudioMixerAttributes): jint {.`static`.}
  proc getPreferredMixerAttributes*(attributes: AudioAttributes, portId: jint, mixerAttributesList: List[AudioMixerAttributes]): jint {.`static`.}
  proc clearPreferredMixerAttributes*(attributes: AudioAttributes, portId: jint, uid: jint): jint {.`static`.}
  proc supportsBluetoothVariableLatency*(): jboolean {.`static`.}
  proc setBluetoothVariableLatencyEnabled*(enabled: jboolean): jint {.`static`.}
  proc isBluetoothVariableLatencyEnabled*(): jboolean {.`static`.}
  proc listenForSystemPropertyChange*(sysprop: string, callback: Runnable): jlong {.`static`.}
  proc triggerSystemPropertyUpdate*(handle: jlong) {.`static`.}
  proc registerAudioVolumeGroupCallback*(callback: INativeAudioVolumeGroupCallback): jint {.`static`.}
  proc unregisterAudioVolumeGroupCallback*(callback: INativeAudioVolumeGroupCallback): jint {.`static`.}
  STREAM_DEFAULT*: jint {.`static`.}
  STREAM_VOICE_CALL*: jint {.`static`.}
  STREAM_SYSTEM*: jint {.`static`.}
  STREAM_RING*: jint {.`static`.}
  STREAM_MUSIC*: jint {.`static`.}
  STREAM_ALARM*: jint {.`static`.}
  STREAM_NOTIFICATION*: jint {.`static`.}
  STREAM_BLUETOOTH_SCO*: jint {.`static`.}
  STREAM_SYSTEM_ENFORCED*: jint {.`static`.}
  STREAM_DTMF*: jint {.`static`.}
  STREAM_TTS*: jint {.`static`.}
  STREAM_ACCESSIBILITY*: jint {.`static`.}
  STREAM_ASSISTANT*: jint {.`static`.}
  NUM_STREAMS*: jint {.`static`.}
  OUT_CHANNEL_COUNT_MAX*: jint {.`static`.}
  SAMPLE_RATE_HZ_MAX*: jint {.`static`.}
  SAMPLE_RATE_HZ_MIN*: jint {.`static`.}
  FCC_24*: jint {.`static`.}
  STREAM_NAMES*: string {.`static`.}
  MODE_INVALID*: jint {.`static`.}
  MODE_CURRENT*: jint {.`static`.}
  MODE_NORMAL*: jint {.`static`.}
  MODE_RINGTONE*: jint {.`static`.}
  MODE_IN_CALL*: jint {.`static`.}
  MODE_IN_COMMUNICATION*: jint {.`static`.}
  MODE_CALL_SCREENING*: jint {.`static`.}
  MODE_CALL_REDIRECT*: jint {.`static`.}
  MODE_COMMUNICATION_REDIRECT*: jint {.`static`.}
  NUM_MODES*: jint {.`static`.}
  AUDIO_FORMAT_INVALID*: jint {.`static`.}
  AUDIO_FORMAT_DEFAULT*: jint {.`static`.}
  AUDIO_FORMAT_AAC*: jint {.`static`.}
  AUDIO_FORMAT_SBC*: jint {.`static`.}
  AUDIO_FORMAT_APTX*: jint {.`static`.}
  AUDIO_FORMAT_APTX_HD*: jint {.`static`.}
  AUDIO_FORMAT_LDAC*: jint {.`static`.}
  AUDIO_FORMAT_LC3*: jint {.`static`.}
  AUDIO_FORMAT_OPUS*: jint {.`static`.}
  ROUTE_EARPIECE*: jint {.`static`.}
  ROUTE_SPEAKER*: jint {.`static`.}
  ROUTE_BLUETOOTH*: jint {.`static`.}
  ROUTE_BLUETOOTH_SCO*: jint {.`static`.}
  ROUTE_HEADSET*: jint {.`static`.}
  ROUTE_BLUETOOTH_A2DP*: jint {.`static`.}
  ROUTE_ALL*: jint {.`static`.}
  AUDIO_SESSION_ALLOCATE*: jint {.`static`.}
  AUDIO_STATUS_OK*: jint {.`static`.}
  AUDIO_STATUS_ERROR*: jint {.`static`.}
  AUDIO_STATUS_SERVER_DIED*: jint {.`static`.}
  SUCCESS*: jint {.`static`.}
  ERROR*: jint {.`static`.}
  BAD_VALUE*: jint {.`static`.}
  INVALID_OPERATION*: jint {.`static`.}
  PERMISSION_DENIED*: jint {.`static`.}
  NO_INIT*: jint {.`static`.}
  DEAD_OBJECT*: jint {.`static`.}
  WOULD_BLOCK*: jint {.`static`.}
  DEVICE_NONE*: jint {.`static`.}
  DEVICE_BIT_IN*: jint {.`static`.}
  DEVICE_BIT_DEFAULT*: jint {.`static`.}
  DEVICE_OUT_EARPIECE*: jint {.`static`.}
  DEVICE_OUT_SPEAKER*: jint {.`static`.}
  DEVICE_OUT_WIRED_HEADSET*: jint {.`static`.}
  DEVICE_OUT_WIRED_HEADPHONE*: jint {.`static`.}
  DEVICE_OUT_BLUETOOTH_SCO*: jint {.`static`.}
  DEVICE_OUT_BLUETOOTH_SCO_HEADSET*: jint {.`static`.}
  DEVICE_OUT_BLUETOOTH_SCO_CARKIT*: jint {.`static`.}
  DEVICE_OUT_BLUETOOTH_A2DP*: jint {.`static`.}
  DEVICE_OUT_BLUETOOTH_A2DP_HEADPHONES*: jint {.`static`.}
  DEVICE_OUT_BLUETOOTH_A2DP_SPEAKER*: jint {.`static`.}
  DEVICE_OUT_AUX_DIGITAL*: jint {.`static`.}
  DEVICE_OUT_HDMI*: jint {.`static`.}
  DEVICE_OUT_ANLG_DOCK_HEADSET*: jint {.`static`.}
  DEVICE_OUT_DGTL_DOCK_HEADSET*: jint {.`static`.}
  DEVICE_OUT_USB_ACCESSORY*: jint {.`static`.}
  DEVICE_OUT_USB_DEVICE*: jint {.`static`.}
  DEVICE_OUT_REMOTE_SUBMIX*: jint {.`static`.}
  DEVICE_OUT_TELEPHONY_TX*: jint {.`static`.}
  DEVICE_OUT_LINE*: jint {.`static`.}
  DEVICE_OUT_HDMI_ARC*: jint {.`static`.}
  DEVICE_OUT_HDMI_EARC*: jint {.`static`.}
  DEVICE_OUT_SPDIF*: jint {.`static`.}
  DEVICE_OUT_FM*: jint {.`static`.}
  DEVICE_OUT_AUX_LINE*: jint {.`static`.}
  DEVICE_OUT_SPEAKER_SAFE*: jint {.`static`.}
  DEVICE_OUT_IP*: jint {.`static`.}
  DEVICE_OUT_MULTICHANNEL_GROUP*: jint {.`static`.}
  DEVICE_OUT_BUS*: jint {.`static`.}
  DEVICE_OUT_PROXY*: jint {.`static`.}
  DEVICE_OUT_USB_HEADSET*: jint {.`static`.}
  DEVICE_OUT_HEARING_AID*: jint {.`static`.}
  DEVICE_OUT_ECHO_CANCELLER*: jint {.`static`.}
  DEVICE_OUT_BLE_HEADSET*: jint {.`static`.}
  DEVICE_OUT_BLE_SPEAKER*: jint {.`static`.}
  DEVICE_OUT_BLE_BROADCAST*: jint {.`static`.}
  DEVICE_OUT_DEFAULT*: jint {.`static`.}
  DEVICE_OUT_ALL_USB*: jint {.`static`.}
  DEVICE_OUT_ALL_SET*: Set[Integer] {.`static`.}
  DEVICE_OUT_ALL_A2DP_SET*: Set[Integer] {.`static`.}
  DEVICE_OUT_ALL_SCO_SET*: Set[Integer] {.`static`.}
  DEVICE_OUT_ALL_USB_SET*: Set[Integer] {.`static`.}
  DEVICE_OUT_ALL_HDMI_SYSTEM_AUDIO_SET*: Set[Integer] {.`static`.}
  DEVICE_ALL_HDMI_SYSTEM_AUDIO_AND_SPEAKER_SET*: Set[Integer] {.`static`.}
  DEVICE_OUT_ALL_BLE_SET*: Set[Integer] {.`static`.}
  DEVICE_OUT_PICK_FOR_VOLUME_SET*: Set[Integer] {.`static`.}
  DEVICE_IN_COMMUNICATION*: jint {.`static`.}
  DEVICE_IN_AMBIENT*: jint {.`static`.}
  DEVICE_IN_BUILTIN_MIC*: jint {.`static`.}
  DEVICE_IN_BLUETOOTH_SCO_HEADSET*: jint {.`static`.}
  DEVICE_IN_WIRED_HEADSET*: jint {.`static`.}
  DEVICE_IN_AUX_DIGITAL*: jint {.`static`.}
  DEVICE_IN_HDMI*: jint {.`static`.}
  DEVICE_IN_VOICE_CALL*: jint {.`static`.}
  DEVICE_IN_TELEPHONY_RX*: jint {.`static`.}
  DEVICE_IN_BACK_MIC*: jint {.`static`.}
  DEVICE_IN_REMOTE_SUBMIX*: jint {.`static`.}
  DEVICE_IN_ANLG_DOCK_HEADSET*: jint {.`static`.}
  DEVICE_IN_DGTL_DOCK_HEADSET*: jint {.`static`.}
  DEVICE_IN_USB_ACCESSORY*: jint {.`static`.}
  DEVICE_IN_USB_DEVICE*: jint {.`static`.}
  DEVICE_IN_FM_TUNER*: jint {.`static`.}
  DEVICE_IN_TV_TUNER*: jint {.`static`.}
  DEVICE_IN_LINE*: jint {.`static`.}
  DEVICE_IN_SPDIF*: jint {.`static`.}
  DEVICE_IN_BLUETOOTH_A2DP*: jint {.`static`.}
  DEVICE_IN_LOOPBACK*: jint {.`static`.}
  DEVICE_IN_IP*: jint {.`static`.}
  DEVICE_IN_BUS*: jint {.`static`.}
  DEVICE_IN_PROXY*: jint {.`static`.}
  DEVICE_IN_USB_HEADSET*: jint {.`static`.}
  DEVICE_IN_BLUETOOTH_BLE*: jint {.`static`.}
  DEVICE_IN_HDMI_ARC*: jint {.`static`.}
  DEVICE_IN_HDMI_EARC*: jint {.`static`.}
  DEVICE_IN_ECHO_REFERENCE*: jint {.`static`.}
  DEVICE_IN_BLE_HEADSET*: jint {.`static`.}
  DEVICE_IN_DEFAULT*: jint {.`static`.}
  DEVICE_IN_ALL_SET*: Set[Integer] {.`static`.}
  DEVICE_IN_ALL_SCO_SET*: Set[Integer] {.`static`.}
  DEVICE_IN_ALL_USB_SET*: Set[Integer] {.`static`.}
  DEVICE_IN_ALL_BLE_SET*: Set[Integer] {.`static`.}
  LEGACY_REMOTE_SUBMIX_ADDRESS*: string {.`static`.}
  DEVICE_STATE_UNAVAILABLE*: jint {.`static`.}
  DEVICE_STATE_AVAILABLE*: jint {.`static`.}
  DEVICE_OUT_EARPIECE_NAME*: string {.`static`.}
  DEVICE_OUT_SPEAKER_NAME*: string {.`static`.}
  DEVICE_OUT_WIRED_HEADSET_NAME*: string {.`static`.}
  DEVICE_OUT_WIRED_HEADPHONE_NAME*: string {.`static`.}
  DEVICE_OUT_BLUETOOTH_SCO_NAME*: string {.`static`.}
  DEVICE_OUT_BLUETOOTH_SCO_HEADSET_NAME*: string {.`static`.}
  DEVICE_OUT_BLUETOOTH_SCO_CARKIT_NAME*: string {.`static`.}
  DEVICE_OUT_BLUETOOTH_A2DP_NAME*: string {.`static`.}
  DEVICE_OUT_BLUETOOTH_A2DP_HEADPHONES_NAME*: string {.`static`.}
  DEVICE_OUT_BLUETOOTH_A2DP_SPEAKER_NAME*: string {.`static`.}
  DEVICE_OUT_AUX_DIGITAL_NAME*: string {.`static`.}
  DEVICE_OUT_HDMI_NAME*: string {.`static`.}
  DEVICE_OUT_ANLG_DOCK_HEADSET_NAME*: string {.`static`.}
  DEVICE_OUT_DGTL_DOCK_HEADSET_NAME*: string {.`static`.}
  DEVICE_OUT_USB_ACCESSORY_NAME*: string {.`static`.}
  DEVICE_OUT_USB_DEVICE_NAME*: string {.`static`.}
  DEVICE_OUT_REMOTE_SUBMIX_NAME*: string {.`static`.}
  DEVICE_OUT_TELEPHONY_TX_NAME*: string {.`static`.}
  DEVICE_OUT_LINE_NAME*: string {.`static`.}
  DEVICE_OUT_HDMI_ARC_NAME*: string {.`static`.}
  DEVICE_OUT_HDMI_EARC_NAME*: string {.`static`.}
  DEVICE_OUT_SPDIF_NAME*: string {.`static`.}
  DEVICE_OUT_FM_NAME*: string {.`static`.}
  DEVICE_OUT_AUX_LINE_NAME*: string {.`static`.}
  DEVICE_OUT_SPEAKER_SAFE_NAME*: string {.`static`.}
  DEVICE_OUT_IP_NAME*: string {.`static`.}
  DEVICE_OUT_MULTICHANNEL_GROUP_NAME*: string {.`static`.}
  DEVICE_OUT_BUS_NAME*: string {.`static`.}
  DEVICE_OUT_PROXY_NAME*: string {.`static`.}
  DEVICE_OUT_USB_HEADSET_NAME*: string {.`static`.}
  DEVICE_OUT_HEARING_AID_NAME*: string {.`static`.}
  DEVICE_OUT_ECHO_CANCELLER_NAME*: string {.`static`.}
  DEVICE_OUT_BLE_HEADSET_NAME*: string {.`static`.}
  DEVICE_OUT_BLE_SPEAKER_NAME*: string {.`static`.}
  DEVICE_OUT_BLE_BROADCAST_NAME*: string {.`static`.}
  DEVICE_IN_COMMUNICATION_NAME*: string {.`static`.}
  DEVICE_IN_AMBIENT_NAME*: string {.`static`.}
  DEVICE_IN_BUILTIN_MIC_NAME*: string {.`static`.}
  DEVICE_IN_BLUETOOTH_SCO_HEADSET_NAME*: string {.`static`.}
  DEVICE_IN_WIRED_HEADSET_NAME*: string {.`static`.}
  DEVICE_IN_AUX_DIGITAL_NAME*: string {.`static`.}
  DEVICE_IN_TELEPHONY_RX_NAME*: string {.`static`.}
  DEVICE_IN_BACK_MIC_NAME*: string {.`static`.}
  DEVICE_IN_REMOTE_SUBMIX_NAME*: string {.`static`.}
  DEVICE_IN_ANLG_DOCK_HEADSET_NAME*: string {.`static`.}
  DEVICE_IN_DGTL_DOCK_HEADSET_NAME*: string {.`static`.}
  DEVICE_IN_USB_ACCESSORY_NAME*: string {.`static`.}
  DEVICE_IN_USB_DEVICE_NAME*: string {.`static`.}
  DEVICE_IN_FM_TUNER_NAME*: string {.`static`.}
  DEVICE_IN_TV_TUNER_NAME*: string {.`static`.}
  DEVICE_IN_LINE_NAME*: string {.`static`.}
  DEVICE_IN_SPDIF_NAME*: string {.`static`.}
  DEVICE_IN_BLUETOOTH_A2DP_NAME*: string {.`static`.}
  DEVICE_IN_LOOPBACK_NAME*: string {.`static`.}
  DEVICE_IN_IP_NAME*: string {.`static`.}
  DEVICE_IN_BUS_NAME*: string {.`static`.}
  DEVICE_IN_PROXY_NAME*: string {.`static`.}
  DEVICE_IN_USB_HEADSET_NAME*: string {.`static`.}
  DEVICE_IN_BLUETOOTH_BLE_NAME*: string {.`static`.}
  DEVICE_IN_ECHO_REFERENCE_NAME*: string {.`static`.}
  DEVICE_IN_HDMI_ARC_NAME*: string {.`static`.}
  DEVICE_IN_HDMI_EARC_NAME*: string {.`static`.}
  DEVICE_IN_BLE_HEADSET_NAME*: string {.`static`.}
  PHONE_STATE_OFFCALL*: jint {.`static`.}
  PHONE_STATE_RINGING*: jint {.`static`.}
  PHONE_STATE_INCALL*: jint {.`static`.}
  FORCE_NONE*: jint {.`static`.}
  FORCE_SPEAKER*: jint {.`static`.}
  FORCE_HEADPHONES*: jint {.`static`.}
  FORCE_BT_SCO*: jint {.`static`.}
  FORCE_BT_A2DP*: jint {.`static`.}
  FORCE_WIRED_ACCESSORY*: jint {.`static`.}
  FORCE_BT_CAR_DOCK*: jint {.`static`.}
  FORCE_BT_DESK_DOCK*: jint {.`static`.}
  FORCE_ANALOG_DOCK*: jint {.`static`.}
  FORCE_DIGITAL_DOCK*: jint {.`static`.}
  FORCE_NO_BT_A2DP*: jint {.`static`.}
  FORCE_SYSTEM_ENFORCED*: jint {.`static`.}
  FORCE_HDMI_SYSTEM_AUDIO_ENFORCED*: jint {.`static`.}
  FORCE_ENCODED_SURROUND_NEVER*: jint {.`static`.}
  FORCE_ENCODED_SURROUND_ALWAYS*: jint {.`static`.}
  FORCE_ENCODED_SURROUND_MANUAL*: jint {.`static`.}
  FORCE_BT_BLE*: jint {.`static`.}
  NUM_FORCE_CONFIG*: jint {.`static`.}
  FORCE_DEFAULT*: jint {.`static`.}
  FOR_COMMUNICATION*: jint {.`static`.}
  FOR_MEDIA*: jint {.`static`.}
  FOR_RECORD*: jint {.`static`.}
  FOR_DOCK*: jint {.`static`.}
  FOR_SYSTEM*: jint {.`static`.}
  FOR_HDMI_SYSTEM_AUDIO*: jint {.`static`.}
  FOR_ENCODED_SURROUND*: jint {.`static`.}
  FOR_VIBRATE_RINGING*: jint {.`static`.}
  DEVICE_ROLE_NONE*: jint {.`static`.}
  DEVICE_ROLE_PREFERRED*: jint {.`static`.}
  DEVICE_ROLE_DISABLED*: jint {.`static`.}
  SYNC_EVENT_NONE*: jint {.`static`.}
  SYNC_EVENT_PRESENTATION_COMPLETE*: jint {.`static`.}
  SYNC_EVENT_SHARE_AUDIO_HISTORY*: jint {.`static`.}
  AUDIO_HW_SYNC_INVALID*: jint {.`static`.}
  DIRECT_NOT_SUPPORTED*: jint {.`static`.}
  DIRECT_OFFLOAD_SUPPORTED*: jint {.`static`.}
  DIRECT_OFFLOAD_GAPLESS_SUPPORTED*: jint {.`static`.}
  DIRECT_BITSTREAM_SUPPORTED*: jint {.`static`.}
  OFFLOAD_NOT_SUPPORTED*: jint {.`static`.}
  OFFLOAD_SUPPORTED*: jint {.`static`.}
  OFFLOAD_GAPLESS_SUPPORTED*: jint {.`static`.}
  PLAY_SOUND_DELAY*: jint {.`static`.}
  IN_VOICE_COMM_FOCUS_ID*: string {.`static`.}
  DEFAULT_STREAM_VOLUME*: jint {.`static`.}
  PLATFORM_DEFAULT*: jint {.`static`.}
  PLATFORM_VOICE*: jint {.`static`.}
  PLATFORM_TELEVISION*: jint {.`static`.}
  PLATFORM_AUTOMOTIVE*: jint {.`static`.}
  DEFAULT_MUTE_STREAMS_AFFECTED*: jint {.`static`.}




