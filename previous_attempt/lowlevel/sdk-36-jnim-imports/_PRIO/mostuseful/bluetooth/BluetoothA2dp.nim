import jnim

jclass android.bluetooth.BluetoothA2dp* of JVMObject:
  proc close*()
  proc onServiceConnected*(service: IBinder)
  proc onServiceDisconnected*()
  proc getAdapter*(): BluetoothAdapter
  proc finalize*()
  proc connect*(device: BluetoothDevice): jboolean
  proc disconnect*(device: BluetoothDevice): jboolean
  proc getConnectedDevices*(): List[BluetoothDevice]
  proc getDevicesMatchingConnectionStates*(states: seq[jint]): List[BluetoothDevice]
  proc getConnectionState*(device: BluetoothDevice): jint
  proc setActiveDevice*(device: BluetoothDevice): jboolean
  proc getActiveDevice*(): BluetoothDevice
  proc setPriority*(device: BluetoothDevice, priority: jint): jboolean
  proc setConnectionPolicy*(device: BluetoothDevice, connectionPolicy: jint): jboolean
  proc getPriority*(device: BluetoothDevice): jint
  proc getConnectionPolicy*(device: BluetoothDevice): jint
  proc setAvrcpAbsoluteVolume*(volume: jint)
  proc isA2dpPlaying*(device: BluetoothDevice): jboolean
  proc shouldSendVolumeKeys*(device: BluetoothDevice): jboolean
  proc getSupportedCodecTypes*(): Collection[BluetoothCodecType]
  proc getCodecStatus*(device: BluetoothDevice): BluetoothCodecStatus
  proc setCodecConfigPreference*(device: BluetoothDevice, codecConfig: BluetoothCodecConfig)
  proc enableOptionalCodecs*(device: BluetoothDevice)
  proc disableOptionalCodecs*(device: BluetoothDevice)
  proc isOptionalCodecsSupported*(device: BluetoothDevice): jint
  proc isOptionalCodecsEnabled*(device: BluetoothDevice): jint
  proc setOptionalCodecsEnabled*(device: BluetoothDevice, value: jint)
  proc getDynamicBufferSupport*(): jint
  proc getBufferConstraints*(): BufferConstraints
  proc setBufferLengthMillis*(codec: jint, value: jint): jboolean
  ACTION_CONNECTION_STATE_CHANGED*: string {.`static`.}
  ACTION_PLAYING_STATE_CHANGED*: string {.`static`.}
  ACTION_AVRCP_CONNECTION_STATE_CHANGED*: string {.`static`.}
  ACTION_ACTIVE_DEVICE_CHANGED*: string {.`static`.}
  ACTION_CODEC_CONFIG_CHANGED*: string {.`static`.}
  STATE_PLAYING*: jint {.`static`.}
  STATE_NOT_PLAYING*: jint {.`static`.}
  OPTIONAL_CODECS_SUPPORT_UNKNOWN*: jint {.`static`.}
  OPTIONAL_CODECS_NOT_SUPPORTED*: jint {.`static`.}
  OPTIONAL_CODECS_SUPPORTED*: jint {.`static`.}
  OPTIONAL_CODECS_PREF_UNKNOWN*: jint {.`static`.}
  OPTIONAL_CODECS_PREF_DISABLED*: jint {.`static`.}
  OPTIONAL_CODECS_PREF_ENABLED*: jint {.`static`.}
  DYNAMIC_BUFFER_SUPPORT_NONE*: jint {.`static`.}
  DYNAMIC_BUFFER_SUPPORT_A2DP_OFFLOAD*: jint {.`static`.}
  DYNAMIC_BUFFER_SUPPORT_A2DP_SOFTWARE_ENCODING*: jint {.`static`.}

