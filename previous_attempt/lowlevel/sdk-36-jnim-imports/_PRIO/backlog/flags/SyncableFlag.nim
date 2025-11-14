import jnim

jclass android.flags.SyncableFlag* of JVMObject:
  proc getNamespace*(): string
  proc getName*(): string
  proc getValue*(): string
  proc isDynamic*(): jboolean
  proc isOverridden*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Parcelable.Creator[SyncableFlag] {.`static`.}

