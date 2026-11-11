import jnim

jclass android.bluetooth.BluetoothLeAudio* of JVMObject:
  proc close*()
  proc onServiceConnected*(service: IBinder)
  proc onServiceDisconnected*()
  proc getAdapter*(): BluetoothAdapter
  proc connect*(device: BluetoothDevice): jboolean
  proc disconnect*(device: BluetoothDevice): jboolean
  proc getConnectedGroupLeadDevice*(groupId: jint): BluetoothDevice
  proc getConnectedDevices*(): List[BluetoothDevice]
  proc getDevicesMatchingConnectionStates*(states: seq[jint]): List[BluetoothDevice]
  proc getConnectionState*(device: BluetoothDevice): jint
  proc registerCallback*(executor: Executor, callback: Callback)
  proc unregisterCallback*(callback: Callback)
  proc setActiveDevice*(device: BluetoothDevice): jboolean
  proc getActiveDevices*(): List[BluetoothDevice]
  proc getGroupId*(device: BluetoothDevice): jint
  proc setVolume*(volume: jint)
  proc groupAddNode*(groupId: jint, device: BluetoothDevice): jboolean
  proc groupRemoveNode*(groupId: jint, device: BluetoothDevice): jboolean
  proc getAudioLocation*(device: BluetoothDevice): jint
  proc isInbandRingtoneEnabled*(groupId: jint): jboolean
  proc setConnectionPolicy*(device: BluetoothDevice, connectionPolicy: jint): jboolean
  proc getConnectionPolicy*(device: BluetoothDevice): jint
  proc getCodecStatus*(groupId: jint): BluetoothLeAudioCodecStatus
  proc setCodecConfigPreference*(groupId: jint, inputCodecConfig: BluetoothLeAudioCodecConfig, outputCodecConfig: BluetoothLeAudioCodecConfig)
  proc setBroadcastToUnicastFallbackGroup*(groupId: jint)
  proc getBroadcastToUnicastFallbackGroup*(): jint
  ACTION_LE_AUDIO_CONNECTION_STATE_CHANGED*: string {.`static`.}
  ACTION_LE_AUDIO_ACTIVE_DEVICE_CHANGED*: string {.`static`.}
  CONTEXT_TYPE_INVALID*: jint {.`static`.}
  CONTEXT_TYPE_UNSPECIFIED*: jint {.`static`.}
  CONTEXT_TYPE_CONVERSATIONAL*: jint {.`static`.}
  CONTEXT_TYPE_MEDIA*: jint {.`static`.}
  CONTEXT_TYPE_GAME*: jint {.`static`.}
  CONTEXT_TYPE_INSTRUCTIONAL*: jint {.`static`.}
  CONTEXT_TYPE_VOICE_ASSISTANTS*: jint {.`static`.}
  CONTEXT_TYPE_LIVE*: jint {.`static`.}
  CONTEXT_TYPE_SOUND_EFFECTS*: jint {.`static`.}
  CONTEXT_TYPE_NOTIFICATIONS*: jint {.`static`.}
  CONTEXT_TYPE_RINGTONE*: jint {.`static`.}
  CONTEXT_TYPE_ALERTS*: jint {.`static`.}
  CONTEXT_TYPE_EMERGENCY_ALARM*: jint {.`static`.}
  CONTEXTS_ALL*: jint {.`static`.}
  GROUP_ID_INVALID*: jint {.`static`.}
  AUDIO_LOCATION_INVALID*: jint {.`static`.}
  AUDIO_LOCATION_MONO*: jint {.`static`.}
  AUDIO_LOCATION_UNKNOWN*: jint {.`static`.}
  AUDIO_LOCATION_FRONT_LEFT*: jint {.`static`.}
  AUDIO_LOCATION_FRONT_RIGHT*: jint {.`static`.}
  AUDIO_LOCATION_FRONT_CENTER*: jint {.`static`.}
  AUDIO_LOCATION_LOW_FREQ_EFFECTS_ONE*: jint {.`static`.}
  AUDIO_LOCATION_BACK_LEFT*: jint {.`static`.}
  AUDIO_LOCATION_BACK_RIGHT*: jint {.`static`.}
  AUDIO_LOCATION_FRONT_LEFT_OF_CENTER*: jint {.`static`.}
  AUDIO_LOCATION_FRONT_RIGHT_OF_CENTER*: jint {.`static`.}
  AUDIO_LOCATION_BACK_CENTER*: jint {.`static`.}
  AUDIO_LOCATION_LOW_FREQ_EFFECTS_TWO*: jint {.`static`.}
  AUDIO_LOCATION_SIDE_LEFT*: jint {.`static`.}
  AUDIO_LOCATION_SIDE_RIGHT*: jint {.`static`.}
  AUDIO_LOCATION_TOP_FRONT_LEFT*: jint {.`static`.}
  AUDIO_LOCATION_TOP_FRONT_RIGHT*: jint {.`static`.}
  AUDIO_LOCATION_TOP_FRONT_CENTER*: jint {.`static`.}
  AUDIO_LOCATION_TOP_CENTER*: jint {.`static`.}
  AUDIO_LOCATION_TOP_BACK_LEFT*: jint {.`static`.}
  AUDIO_LOCATION_TOP_BACK_RIGHT*: jint {.`static`.}
  AUDIO_LOCATION_TOP_SIDE_LEFT*: jint {.`static`.}
  AUDIO_LOCATION_TOP_SIDE_RIGHT*: jint {.`static`.}
  AUDIO_LOCATION_TOP_BACK_CENTER*: jint {.`static`.}
  AUDIO_LOCATION_BOTTOM_FRONT_CENTER*: jint {.`static`.}
  AUDIO_LOCATION_BOTTOM_FRONT_LEFT*: jint {.`static`.}
  AUDIO_LOCATION_BOTTOM_FRONT_RIGHT*: jint {.`static`.}
  AUDIO_LOCATION_FRONT_LEFT_WIDE*: jint {.`static`.}
  AUDIO_LOCATION_FRONT_RIGHT_WIDE*: jint {.`static`.}
  AUDIO_LOCATION_LEFT_SURROUND*: jint {.`static`.}
  AUDIO_LOCATION_RIGHT_SURROUND*: jint {.`static`.}
  EXTRA_LE_AUDIO_GROUP_ID*: string {.`static`.}
  EXTRA_LE_AUDIO_DIRECTION*: string {.`static`.}
  EXTRA_LE_AUDIO_SOURCE_LOCATION*: string {.`static`.}
  EXTRA_LE_AUDIO_SINK_LOCATION*: string {.`static`.}
  EXTRA_LE_AUDIO_AVAILABLE_CONTEXTS*: string {.`static`.}
  GROUP_STATUS_ACTIVE*: jint {.`static`.}
  GROUP_STATUS_INACTIVE*: jint {.`static`.}
  GROUP_STREAM_STATUS_IDLE*: jint {.`static`.}
  GROUP_STREAM_STATUS_STREAMING*: jint {.`static`.}

