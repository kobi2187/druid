import jnim

jclass android.app.AsyncNotedAppOp* of JVMObject:
  proc getOp*(): string
  proc getNotingUid*(): jint
  proc getAttributionTag*(): string
  proc getMessage*(): string
  proc getTime*(): jlong
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: android.os.Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[AsyncNotedAppOp] {.`static`.}

