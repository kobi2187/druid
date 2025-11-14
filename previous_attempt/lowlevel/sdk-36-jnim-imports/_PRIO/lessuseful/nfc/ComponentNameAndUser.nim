import jnim

jclass android.nfc.ComponentNameAndUser* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc getUserId*(): jint
  proc getComponentName*(): ComponentName
  proc toString*(): string
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  CREATOR*: Parcelable.Creator[ComponentNameAndUser] {.`static`.}

