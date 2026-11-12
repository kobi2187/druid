import jnim

jclass android.uwb.UwbAddress* of JVMObject:
  proc fromBytes*(address: seq[jbyte]): UwbAddress {.`static`.}
  proc toBytes*(): seq[jbyte]
  proc size*(): jint
  proc toString*(): string
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  SHORT_ADDRESS_BYTE_LENGTH*: jint {.`static`.}
  EXTENDED_ADDRESS_BYTE_LENGTH*: jint {.`static`.}
  CREATOR*: Creator[UwbAddress] {.`static`.}

