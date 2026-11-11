import jnim

jclass android.bluetooth.SdpMasRecord* of JVMObject:
  proc describeContents*(): jint
  proc getMasInstanceId*(): jint
  proc getL2capPsm*(): jint
  proc getRfcommCannelNumber*(): jint
  proc getProfileVersion*(): jint
  proc getSupportedFeatures*(): jint
  proc getSupportedMessageTypes*(): jint
  proc msgSupported*(msg: jint): jboolean
  proc getServiceName*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Parcelable.Creator {.`static`.}

jclass android.bluetooth.MessageType* of JVMObject:
  EMAIL*: jint {.`static`.}
  SMS_GSM*: jint {.`static`.}
  SMS_CDMA*: jint {.`static`.}
  MMS*: jint {.`static`.}

