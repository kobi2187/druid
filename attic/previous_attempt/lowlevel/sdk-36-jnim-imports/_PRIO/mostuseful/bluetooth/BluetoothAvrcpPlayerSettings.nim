import jnim

jclass android.bluetooth.BluetoothAvrcpPlayerSettings* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc getSettings*(): jint
  proc addSettingValue*(setting: jint, value: jint)
  proc getSettingValue*(setting: jint): jint
  SETTING_EQUALIZER*: jint {.`static`.}
  SETTING_REPEAT*: jint {.`static`.}
  SETTING_SHUFFLE*: jint {.`static`.}
  SETTING_SCAN*: jint {.`static`.}
  STATE_INVALID*: jint {.`static`.}
  STATE_OFF*: jint {.`static`.}
  STATE_ON*: jint {.`static`.}
  STATE_SINGLE_TRACK*: jint {.`static`.}
  STATE_ALL_TRACK*: jint {.`static`.}
  STATE_GROUP*: jint {.`static`.}
  CREATOR*: Creator[BluetoothAvrcpPlayerSettings] {.`static`.}

