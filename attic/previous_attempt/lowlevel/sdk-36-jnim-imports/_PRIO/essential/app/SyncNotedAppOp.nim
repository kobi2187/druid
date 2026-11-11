import jnim

jclass android.app.SyncNotedAppOp* of JVMObject:
  proc getOp*(): string
  proc getOpMode*(): jint
  proc getAttributionTag*(): string
  proc getPackageName*(): string
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: android.os.Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[SyncNotedAppOp] {.`static`.}

