import jnim

jclass android.bluetooth.BluetoothHeadset* of JVMObject:
  proc close*()
  proc onServiceConnected*(service: IBinder)
  proc onServiceDisconnected*()
  proc getAdapter*(): BluetoothAdapter
  proc connect*(device: BluetoothDevice): jboolean
  proc disconnect*(device: BluetoothDevice): jboolean
  proc getConnectedDevices*(): List[BluetoothDevice]
  proc getDevicesMatchingConnectionStates*(states: seq[jint]): List[BluetoothDevice]
  proc getConnectionState*(device: BluetoothDevice): jint
  proc setConnectionPolicy*(device: BluetoothDevice, connectionPolicy: jint): jboolean
  proc getPriority*(device: BluetoothDevice): jint
  proc getConnectionPolicy*(device: BluetoothDevice): jint
  proc isNoiseReductionSupported*(device: BluetoothDevice): jboolean
  proc isVoiceRecognitionSupported*(device: BluetoothDevice): jboolean
  proc startVoiceRecognition*(device: BluetoothDevice): jboolean
  proc stopVoiceRecognition*(device: BluetoothDevice): jboolean
  proc isAudioConnected*(device: BluetoothDevice): jboolean
  proc getAudioState*(device: BluetoothDevice): jint
  proc setAudioRouteAllowed*(allowed: jboolean): jint
  proc getAudioRouteAllowed*(): jint
  proc setForceScoAudio*(forced: jboolean)
  proc connectAudio*(): jint
  proc disconnectAudio*(): jint
  proc startScoUsingVirtualVoiceCall*(): jboolean
  proc stopScoUsingVirtualVoiceCall*(): jboolean
  proc sendVendorSpecificResultCode*(device: BluetoothDevice, command: string, arg: string): jboolean
  proc setActiveDevice*(device: BluetoothDevice): jboolean
  proc getActiveDevice*(): BluetoothDevice
  proc isInbandRingingEnabled*(): jboolean
  ACTION_CONNECTION_STATE_CHANGED*: string {.`static`.}
  ACTION_AUDIO_STATE_CHANGED*: string {.`static`.}
  ACTION_ACTIVE_DEVICE_CHANGED*: string {.`static`.}
  ACTION_VENDOR_SPECIFIC_HEADSET_EVENT*: string {.`static`.}
  EXTRA_VENDOR_SPECIFIC_HEADSET_EVENT_CMD*: string {.`static`.}
  EXTRA_VENDOR_SPECIFIC_HEADSET_EVENT_CMD_TYPE*: string {.`static`.}
  AT_CMD_TYPE_READ*: jint {.`static`.}
  AT_CMD_TYPE_TEST*: jint {.`static`.}
  AT_CMD_TYPE_SET*: jint {.`static`.}
  AT_CMD_TYPE_BASIC*: jint {.`static`.}
  AT_CMD_TYPE_ACTION*: jint {.`static`.}
  EXTRA_VENDOR_SPECIFIC_HEADSET_EVENT_ARGS*: string {.`static`.}
  VENDOR_SPECIFIC_HEADSET_EVENT_COMPANY_ID_CATEGORY*: string {.`static`.}
  VENDOR_RESULT_CODE_COMMAND_ANDROID*: string {.`static`.}
  VENDOR_SPECIFIC_HEADSET_EVENT_XAPL*: string {.`static`.}
  VENDOR_SPECIFIC_HEADSET_EVENT_IPHONEACCEV*: string {.`static`.}
  VENDOR_SPECIFIC_HEADSET_EVENT_IPHONEACCEV_BATTERY_LEVEL*: jint {.`static`.}
  VENDOR_SPECIFIC_HEADSET_EVENT_XEVENT*: string {.`static`.}
  VENDOR_SPECIFIC_HEADSET_EVENT_XEVENT_BATTERY_LEVEL*: string {.`static`.}
  VENDOR_SPECIFIC_HEADSET_EVENT_CGMI*: string {.`static`.}
  VENDOR_SPECIFIC_HEADSET_EVENT_CGMM*: string {.`static`.}
  VENDOR_SPECIFIC_HEADSET_EVENT_CGMR*: string {.`static`.}
  VENDOR_SPECIFIC_HEADSET_EVENT_CGSN*: string {.`static`.}
  STATE_AUDIO_DISCONNECTED*: jint {.`static`.}
  STATE_AUDIO_CONNECTING*: jint {.`static`.}
  STATE_AUDIO_CONNECTED*: jint {.`static`.}
  ACTION_HF_INDICATORS_VALUE_CHANGED*: string {.`static`.}
  EXTRA_HF_INDICATORS_IND_ID*: string {.`static`.}
  EXTRA_HF_INDICATORS_IND_VALUE*: string {.`static`.}

