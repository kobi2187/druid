import jnim

jclass android.bluetooth.BluetoothHeadsetClient* of JVMObject:
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
  proc getConnectionPolicy*(device: BluetoothDevice): jint
  proc startVoiceRecognition*(device: BluetoothDevice): jboolean
  proc sendVendorAtCommand*(device: BluetoothDevice, vendorId: jint, atCommand: string): jboolean
  proc stopVoiceRecognition*(device: BluetoothDevice): jboolean
  proc getCurrentCalls*(device: BluetoothDevice): List[BluetoothHeadsetClientCall]
  proc getCurrentAgEvents*(device: BluetoothDevice): Bundle
  proc acceptCall*(device: BluetoothDevice, flag: jint): jboolean
  proc holdCall*(device: BluetoothDevice): jboolean
  proc rejectCall*(device: BluetoothDevice): jboolean
  proc terminateCall*(device: BluetoothDevice, call: BluetoothHeadsetClientCall): jboolean
  proc enterPrivateMode*(device: BluetoothDevice, index: jint): jboolean
  proc explicitCallTransfer*(device: BluetoothDevice): jboolean
  proc dial*(device: BluetoothDevice, number: string): BluetoothHeadsetClientCall
  proc sendDTMF*(device: BluetoothDevice, code: jbyte): jboolean
  proc getLastVoiceTagNumber*(device: BluetoothDevice): jboolean
  proc getAudioState*(device: BluetoothDevice): jint
  proc setAudioRouteAllowed*(device: BluetoothDevice, allowed: jboolean)
  proc getAudioRouteAllowed*(device: BluetoothDevice): jboolean
  proc connectAudio*(device: BluetoothDevice): jboolean
  proc disconnectAudio*(device: BluetoothDevice): jboolean
  proc getCurrentAgFeatures*(device: BluetoothDevice): Bundle
  proc getNetworkServiceState*(device: BluetoothDevice): NetworkServiceState
  ACTION_CONNECTION_STATE_CHANGED*: string {.`static`.}
  ACTION_AUDIO_STATE_CHANGED*: string {.`static`.}
  ACTION_AG_EVENT*: string {.`static`.}
  ACTION_CALL_CHANGED*: string {.`static`.}
  ACTION_RESULT*: string {.`static`.}
  ACTION_VENDOR_SPECIFIC_HEADSETCLIENT_EVENT*: string {.`static`.}
  ACTION_LAST_VTAG*: string {.`static`.}
  STATE_AUDIO_DISCONNECTED*: jint {.`static`.}
  STATE_AUDIO_CONNECTING*: jint {.`static`.}
  STATE_AUDIO_CONNECTED*: jint {.`static`.}
  EXTRA_AUDIO_WBS*: string {.`static`.}
  EXTRA_NETWORK_STATUS*: string {.`static`.}
  EXTRA_NETWORK_SIGNAL_STRENGTH*: string {.`static`.}
  EXTRA_NETWORK_ROAMING*: string {.`static`.}
  EXTRA_BATTERY_LEVEL*: string {.`static`.}
  EXTRA_OPERATOR_NAME*: string {.`static`.}
  EXTRA_VOICE_RECOGNITION*: string {.`static`.}
  EXTRA_IN_BAND_RING*: string {.`static`.}
  EXTRA_SUBSCRIBER_INFO*: string {.`static`.}
  EXTRA_CALL*: string {.`static`.}
  EXTRA_NUMBER*: string {.`static`.}
  EXTRA_RESULT_CODE*: string {.`static`.}
  EXTRA_CME_CODE*: string {.`static`.}
  EXTRA_VENDOR_ID*: string {.`static`.}
  EXTRA_VENDOR_EVENT_CODE*: string {.`static`.}
  EXTRA_VENDOR_EVENT_FULL_ARGS*: string {.`static`.}
  EXTRA_AG_FEATURE_3WAY_CALLING*: string {.`static`.}
  EXTRA_AG_FEATURE_VOICE_RECOGNITION*: string {.`static`.}
  EXTRA_AG_FEATURE_ATTACH_NUMBER_TO_VT*: string {.`static`.}
  EXTRA_AG_FEATURE_REJECT_CALL*: string {.`static`.}
  EXTRA_AG_FEATURE_ECC*: string {.`static`.}
  EXTRA_AG_FEATURE_RESPONSE_AND_HOLD*: string {.`static`.}
  EXTRA_AG_FEATURE_ACCEPT_HELD_OR_WAITING_CALL*: string {.`static`.}
  EXTRA_AG_FEATURE_RELEASE_HELD_OR_WAITING_CALL*: string {.`static`.}
  EXTRA_AG_FEATURE_RELEASE_AND_ACCEPT*: string {.`static`.}
  EXTRA_AG_FEATURE_MERGE*: string {.`static`.}
  EXTRA_AG_FEATURE_MERGE_AND_DETACH*: string {.`static`.}
  ACTION_RESULT_OK*: jint {.`static`.}
  ACTION_RESULT_ERROR*: jint {.`static`.}
  ACTION_RESULT_ERROR_NO_CARRIER*: jint {.`static`.}
  ACTION_RESULT_ERROR_BUSY*: jint {.`static`.}
  ACTION_RESULT_ERROR_NO_ANSWER*: jint {.`static`.}
  ACTION_RESULT_ERROR_DELAYED*: jint {.`static`.}
  ACTION_RESULT_ERROR_BLACKLISTED*: jint {.`static`.}
  ACTION_RESULT_ERROR_CME*: jint {.`static`.}
  CME_PHONE_FAILURE*: jint {.`static`.}
  CME_NO_CONNECTION_TO_PHONE*: jint {.`static`.}
  CME_OPERATION_NOT_ALLOWED*: jint {.`static`.}
  CME_OPERATION_NOT_SUPPORTED*: jint {.`static`.}
  CME_PHSIM_PIN_REQUIRED*: jint {.`static`.}
  CME_PHFSIM_PIN_REQUIRED*: jint {.`static`.}
  CME_PHFSIM_PUK_REQUIRED*: jint {.`static`.}
  CME_SIM_NOT_INSERTED*: jint {.`static`.}
  CME_SIM_PIN_REQUIRED*: jint {.`static`.}
  CME_SIM_PUK_REQUIRED*: jint {.`static`.}
  CME_SIM_FAILURE*: jint {.`static`.}
  CME_SIM_BUSY*: jint {.`static`.}
  CME_SIM_WRONG*: jint {.`static`.}
  CME_INCORRECT_PASSWORD*: jint {.`static`.}
  CME_SIM_PIN2_REQUIRED*: jint {.`static`.}
  CME_SIM_PUK2_REQUIRED*: jint {.`static`.}
  CME_MEMORY_FULL*: jint {.`static`.}
  CME_INVALID_INDEX*: jint {.`static`.}
  CME_NOT_FOUND*: jint {.`static`.}
  CME_MEMORY_FAILURE*: jint {.`static`.}
  CME_TEXT_STRING_TOO_LONG*: jint {.`static`.}
  CME_INVALID_CHARACTER_IN_TEXT_STRING*: jint {.`static`.}
  CME_DIAL_STRING_TOO_LONG*: jint {.`static`.}
  CME_INVALID_CHARACTER_IN_DIAL_STRING*: jint {.`static`.}
  CME_NO_NETWORK_SERVICE*: jint {.`static`.}
  CME_NETWORK_TIMEOUT*: jint {.`static`.}
  CME_EMERGENCY_SERVICE_ONLY*: jint {.`static`.}
  CME_NO_SIMULTANEOUS_VOIP_CS_CALLS*: jint {.`static`.}
  CME_NOT_SUPPORTED_FOR_VOIP*: jint {.`static`.}
  CME_SIP_RESPONSE_CODE*: jint {.`static`.}
  CME_NETWORK_PERSONALIZATION_PIN_REQUIRED*: jint {.`static`.}
  CME_NETWORK_PERSONALIZATION_PUK_REQUIRED*: jint {.`static`.}
  CME_NETWORK_SUBSET_PERSONALIZATION_PIN_REQUIRED*: jint {.`static`.}
  CME_NETWORK_SUBSET_PERSONALIZATION_PUK_REQUIRED*: jint {.`static`.}
  CME_SERVICE_PROVIDER_PERSONALIZATION_PIN_REQUIRED*: jint {.`static`.}
  CME_SERVICE_PROVIDER_PERSONALIZATION_PUK_REQUIRED*: jint {.`static`.}
  CME_CORPORATE_PERSONALIZATION_PIN_REQUIRED*: jint {.`static`.}
  CME_CORPORATE_PERSONALIZATION_PUK_REQUIRED*: jint {.`static`.}
  CME_HIDDEN_KEY_REQUIRED*: jint {.`static`.}
  CME_EAP_NOT_SUPPORTED*: jint {.`static`.}
  CME_INCORRECT_PARAMETERS*: jint {.`static`.}
  CALL_ACCEPT_NONE*: jint {.`static`.}
  CALL_ACCEPT_HOLD*: jint {.`static`.}
  CALL_ACCEPT_TERMINATE*: jint {.`static`.}
  ACTION_NETWORK_SERVICE_STATE_CHANGED*: string {.`static`.}
  EXTRA_NETWORK_SERVICE_STATE*: string {.`static`.}

jclass android.bluetooth.BluetoothHeadsetClient.NetworkServiceState* of JVMObject:
  proc getDevice*(): BluetoothDevice
  proc isServiceAvailable*(): jboolean
  proc getNetworkOperatorName*(): string
  proc getSignalStrength*(): jint
  proc isRoaming*(): jboolean
  proc writeToParcel*(output:Parcel, flags: jint)
  proc describeContents*(): jint

jclass android.bluetooth.NetworkServiceState* of JVMObject:
  proc getDevice*(): BluetoothDevice
  proc isServiceAvailable*(): jboolean
  proc getNetworkOperatorName*(): string
  proc getSignalStrength*(): jint
  proc isRoaming*(): jboolean
  proc writeToParcel*(output:Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[NetworkServiceState] {.`static`.}

