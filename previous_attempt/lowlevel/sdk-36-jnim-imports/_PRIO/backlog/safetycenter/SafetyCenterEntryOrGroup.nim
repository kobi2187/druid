import jnim

jclass android.safetycenter.SafetyCenterEntryOrGroup* of JVMObject:
  proc getEntry*(): SafetyCenterEntry
  proc getEntryGroup*(): SafetyCenterEntryGroup
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[SafetyCenterEntryOrGroup] {.`static`.}

