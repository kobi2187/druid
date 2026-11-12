import jnim

jclass android.app.ZenBypassingApp* of JVMObject:
  proc getPkg*(): string
  proc doAllChannelsBypass*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CREATOR*: Parcelable.Creator[ZenBypassingApp] {.`static`.}

