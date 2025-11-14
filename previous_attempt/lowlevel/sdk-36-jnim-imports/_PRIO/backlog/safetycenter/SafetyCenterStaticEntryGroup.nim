import jnim

jclass android.safetycenter.SafetyCenterStaticEntryGroup* of JVMObject:
  proc getTitle*(): CharSequence
  proc getStaticEntries*(): List[SafetyCenterStaticEntry]
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[SafetyCenterStaticEntryGroup] {.`static`.}

