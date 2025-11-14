import jnim

jclass android.nfc.WlcListenerDeviceInfo* of JVMObject:
  proc getProductId*(): jint
  proc getTemperature*(): jdouble
  proc getBatteryLevel*(): jdouble
  proc getState*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  STATE_DISCONNECTED*: jint {.`static`.}
  STATE_CONNECTED_CHARGING*: jint {.`static`.}
  STATE_CONNECTED_DISCHARGING*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[WlcListenerDeviceInfo] {.`static`.}

