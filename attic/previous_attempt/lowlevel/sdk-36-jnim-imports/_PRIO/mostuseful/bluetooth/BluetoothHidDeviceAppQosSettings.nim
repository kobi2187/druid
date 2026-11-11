import jnim

jclass android.bluetooth.BluetoothHidDeviceAppQosSettings* of JVMObject:
  proc getServiceType*(): jint
  proc getTokenRate*(): jint
  proc getTokenBucketSize*(): jint
  proc getPeakBandwidth*(): jint
  proc getLatency*(): jint
  proc getDelayVariation*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  SERVICE_NO_TRAFFIC*: jint {.`static`.}
  SERVICE_BEST_EFFORT*: jint {.`static`.}
  SERVICE_GUARANTEED*: jint {.`static`.}
  MAX*: jint {.`static`.}
  CREATOR*: Creator[BluetoothHidDeviceAppQosSettings] {.`static`.}

