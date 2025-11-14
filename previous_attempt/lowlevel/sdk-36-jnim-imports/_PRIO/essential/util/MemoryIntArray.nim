import jnim

jclass android.util.MemoryIntArray* of JVMObject:
  proc isWritable*(): jboolean
  proc get*(index: jint): jint
  proc set*(index: jint, value: jint)
  proc size*(): jint
  proc close*()
  proc isClosed*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc getMaxSize*(): jint {.`static`.}
  CREATOR*: Parcelable.Creator[MemoryIntArray] {.`static`.}

