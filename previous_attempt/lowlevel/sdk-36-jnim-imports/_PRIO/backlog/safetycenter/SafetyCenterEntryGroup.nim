import jnim

jclass android.safetycenter.SafetyCenterEntryGroup* of JVMObject:
  proc getId*(): string
  proc getTitle*(): CharSequence
  proc getSummary*(): CharSequence
  proc getSeverityLevel*(): jint
  proc getSeverityUnspecifiedIconType*(): jint
  proc getEntries*(): List[SafetyCenterEntry]
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[SafetyCenterEntryGroup] {.`static`.}

jclass android.safetycenter.SafetyCenterEntryGroup.Builder* of JVMObject:
  proc setId*(id: string): Builder
  proc setTitle*(title: CharSequence): Builder
  proc setSummary*(summary: CharSequence): Builder
  proc setSeverityLevel*(severityLevel: jint): Builder
  proc setSeverityUnspecifiedIconType*(severityUnspecifiedIconType: jint): Builder
  proc setEntries*(entries: List[SafetyCenterEntry]): Builder
  proc build*(): SafetyCenterEntryGroup

jclass android.safetycenter.Builder* of JVMObject:
  proc setId*(id: string): Builder
  proc setTitle*(title: CharSequence): Builder
  proc setSummary*(summary: CharSequence): Builder
  proc setSeverityLevel*(severityLevel: jint): Builder
  proc setSeverityUnspecifiedIconType*(severityUnspecifiedIconType: jint): Builder
  proc setEntries*(entries: List[SafetyCenterEntry]): Builder
  proc build*(): SafetyCenterEntryGroup

