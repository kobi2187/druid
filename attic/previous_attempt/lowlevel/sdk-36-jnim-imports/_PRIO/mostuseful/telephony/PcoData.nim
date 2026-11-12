import jnim

jclass android.telephony.PcoData* of JVMObject:
  proc writeToParcel*(output:Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  cid*: jint
  bearerProto*: string
  pcoId*: jint
  contents*: jbyte
  CREATOR*: Parcelable.Creator[PcoData] {.`static`.}

