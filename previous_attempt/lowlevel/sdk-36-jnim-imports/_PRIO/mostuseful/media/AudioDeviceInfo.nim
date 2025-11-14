import jnim

jclass android.media.AudioDeviceInfo* of JVMObject:
  proc enforceValidAudioDeviceTypeOut*(type: jint) {.`static`.}
  proc enforceValidAudioDeviceTypeIn*(type: jint) {.`static`.}
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc getPort*(): AudioDevicePort
  proc getInternalType*(): jint
  proc getId*(): jint
  proc getProductName*(): CharSequence
  proc getAddress*(): string
  proc isSource*(): jboolean
  proc isSink*(): jboolean
  proc getSampleRates*(): seq[jint]
  proc getChannelMasks*(): seq[jint]
  proc getChannelIndexMasks*(): seq[jint]
  proc getChannelCounts*(): seq[jint]
  proc getSpeakerLayoutChannelMask*(): jint
  proc getEncodings*(): seq[jint]
  proc getAudioProfiles*(): List[AudioProfile]
  proc getAudioDescriptors*(): List[AudioDescriptor]
  proc getEncapsulationModes*(): seq[jint]
  proc getEncapsulationMetadataTypes*(): seq[jint]
  proc getType*(): jint
  proc convertDeviceTypeToInternalDevice*(deviceType: jint): jint {.`static`.}
  proc convertInternalDeviceToDeviceType*(intDevice: jint): jint {.`static`.}
  proc convertDeviceTypeToInternalInputDevice*(deviceType: jint): jint {.`static`.}
  proc convertDeviceTypeToInternalInputDevice*(deviceType: jint, address: string): jint {.`static`.}
  TYPE_UNKNOWN*: jint {.`static`.}
  TYPE_BUILTIN_EARPIECE*: jint {.`static`.}
  TYPE_BUILTIN_SPEAKER*: jint {.`static`.}
  TYPE_WIRED_HEADSET*: jint {.`static`.}
  TYPE_WIRED_HEADPHONES*: jint {.`static`.}
  TYPE_LINE_ANALOG*: jint {.`static`.}
  TYPE_LINE_DIGITAL*: jint {.`static`.}
  TYPE_BLUETOOTH_SCO*: jint {.`static`.}
  TYPE_BLUETOOTH_A2DP*: jint {.`static`.}
  TYPE_HDMI*: jint {.`static`.}
  TYPE_HDMI_ARC*: jint {.`static`.}
  TYPE_USB_DEVICE*: jint {.`static`.}
  TYPE_USB_ACCESSORY*: jint {.`static`.}
  TYPE_DOCK*: jint {.`static`.}
  TYPE_FM*: jint {.`static`.}
  TYPE_BUILTIN_MIC*: jint {.`static`.}
  TYPE_FM_TUNER*: jint {.`static`.}
  TYPE_TV_TUNER*: jint {.`static`.}
  TYPE_TELEPHONY*: jint {.`static`.}
  TYPE_AUX_LINE*: jint {.`static`.}
  TYPE_IP*: jint {.`static`.}
  TYPE_BUS*: jint {.`static`.}
  TYPE_USB_HEADSET*: jint {.`static`.}
  TYPE_HEARING_AID*: jint {.`static`.}
  TYPE_BUILTIN_SPEAKER_SAFE*: jint {.`static`.}
  TYPE_REMOTE_SUBMIX*: jint {.`static`.}
  TYPE_BLE_HEADSET*: jint {.`static`.}
  TYPE_BLE_SPEAKER*: jint {.`static`.}
  TYPE_ECHO_REFERENCE*: jint {.`static`.}
  TYPE_HDMI_EARC*: jint {.`static`.}
  TYPE_BLE_BROADCAST*: jint {.`static`.}
  TYPE_DOCK_ANALOG*: jint {.`static`.}
  TYPE_MULTICHANNEL_GROUP*: jint {.`static`.}

