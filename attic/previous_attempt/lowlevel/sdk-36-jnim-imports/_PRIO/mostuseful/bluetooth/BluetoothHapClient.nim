import jnim

jclass android.bluetooth.BluetoothHapClient* of JVMObject:
  proc close*()
  proc onServiceConnected*(service: IBinder)
  proc onServiceDisconnected*()
  proc getAdapter*(): BluetoothAdapter
  proc registerCallback*(executor: Executor, callback: Callback)
  proc unregisterCallback*(callback: Callback)
  proc setConnectionPolicy*(device: BluetoothDevice, connectionPolicy: jint): jboolean
  proc getConnectionPolicy*(device: BluetoothDevice): jint
  proc getConnectedDevices*(): List[BluetoothDevice]
  proc getDevicesMatchingConnectionStates*(states: seq[jint]): List[BluetoothDevice]
  proc getConnectionState*(device: BluetoothDevice): jint
  proc getHapGroup*(device: BluetoothDevice): jint
  proc getActivePresetIndex*(device: BluetoothDevice): jint
  proc getActivePresetInfo*(device: BluetoothDevice): BluetoothHapPresetInfo
  proc selectPreset*(device: BluetoothDevice, presetIndex: jint)
  proc selectPresetForGroup*(groupId: jint, presetIndex: jint)
  proc switchToNextPreset*(device: BluetoothDevice)
  proc switchToNextPresetForGroup*(groupId: jint)
  proc switchToPreviousPreset*(device: BluetoothDevice)
  proc switchToPreviousPresetForGroup*(groupId: jint)
  proc getPresetInfo*(device: BluetoothDevice, presetIndex: jint): BluetoothHapPresetInfo
  proc getAllPresetInfo*(device: BluetoothDevice): List[BluetoothHapPresetInfo]
  proc getFeatures*(device: BluetoothDevice): jint
  proc getHearingAidType*(device: BluetoothDevice): jint
  proc supportsSynchronizedPresets*(device: BluetoothDevice): jboolean
  proc supportsIndependentPresets*(device: BluetoothDevice): jboolean
  proc supportsDynamicPresets*(device: BluetoothDevice): jboolean
  proc supportsWritablePresets*(device: BluetoothDevice): jboolean
  proc setPresetName*(device: BluetoothDevice, presetIndex: jint, name: string)
  proc setPresetNameForGroup*(groupId: jint, presetIndex: jint, name: string)
  ACTION_HAP_CONNECTION_STATE_CHANGED*: string {.`static`.}
  ACTION_HAP_DEVICE_AVAILABLE*: string {.`static`.}
  EXTRA_HAP_FEATURES*: string {.`static`.}
  PRESET_INDEX_UNAVAILABLE*: jint {.`static`.}
  TYPE_BINAURAL*: jint {.`static`.}
  TYPE_MONAURAL*: jint {.`static`.}
  TYPE_BANDED*: jint {.`static`.}
  TYPE_RFU*: jint {.`static`.}
  FEATURE_HEARING_AID_TYPE_MASK*: jint {.`static`.}
  FEATURE_SYNCHRONIZATED_PRESETS_MASK*: jint {.`static`.}
  FEATURE_INDEPENDENT_PRESETS_MASK*: jint {.`static`.}
  FEATURE_DYNAMIC_PRESETS_MASK*: jint {.`static`.}
  FEATURE_WRITABLE_PRESETS_MASK*: jint {.`static`.}

