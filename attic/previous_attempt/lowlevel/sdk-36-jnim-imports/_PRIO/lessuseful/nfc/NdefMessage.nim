import jnim

jclass android.nfc.NdefMessage* of JVMObject:
  proc getRecords*(): seq[NdefRecord]
  proc getByteArrayLength*(): jint
  proc toByteArray*(): seq[jbyte]
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc toString*(): string
  proc dumpDebug*(proto: ProtoOutputStream)
  CREATOR*: Parcelable.Creator[NdefMessage] {.`static`.}

