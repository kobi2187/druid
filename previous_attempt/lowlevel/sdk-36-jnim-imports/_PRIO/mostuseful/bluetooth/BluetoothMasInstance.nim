import jnim

jclass android.bluetooth.BluetoothMasInstance* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc getId*(): jint
  proc getName*(): string
  proc getChannel*(): jint
  proc getMsgTypes*(): jint
  proc msgSupported*(msg: jint): jboolean
  CREATOR*: Creator[BluetoothMasInstance] {.`static`.}

jclass android.bluetooth.MessageType* of JVMObject:
  EMAIL*: jint {.`static`.}
  SMS_GSM*: jint {.`static`.}
  SMS_CDMA*: jint {.`static`.}
  MMS*: jint {.`static`.}

