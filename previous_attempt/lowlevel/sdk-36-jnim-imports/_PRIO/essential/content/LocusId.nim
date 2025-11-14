import jnim

jclass android.content.LocusId* of JVMObject:
  proc getId*(): string
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc toString*(): string
  proc dump*(pw: PrintWriter)
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[LocusId] {.`static`.}

