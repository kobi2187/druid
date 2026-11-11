import jnim

jclass android.safetycenter.SafetyCenterEntry* of JVMObject:
  proc getId*(): string
  proc getTitle*(): CharSequence
  proc getSummary*(): CharSequence
  proc getSeverityLevel*(): jint
  proc getSeverityUnspecifiedIconType*(): jint
  proc isEnabled*(): jboolean
  proc getPendingIntent*(): PendingIntent
  proc getIconAction*(): IconAction
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  ENTRY_SEVERITY_LEVEL_UNKNOWN*: jint {.`static`.}
  ENTRY_SEVERITY_LEVEL_UNSPECIFIED*: jint {.`static`.}
  ENTRY_SEVERITY_LEVEL_OK*: jint {.`static`.}
  ENTRY_SEVERITY_LEVEL_RECOMMENDATION*: jint {.`static`.}
  ENTRY_SEVERITY_LEVEL_CRITICAL_WARNING*: jint {.`static`.}
  SEVERITY_UNSPECIFIED_ICON_TYPE_NO_ICON*: jint {.`static`.}
  SEVERITY_UNSPECIFIED_ICON_TYPE_PRIVACY*: jint {.`static`.}
  SEVERITY_UNSPECIFIED_ICON_TYPE_NO_RECOMMENDATION*: jint {.`static`.}
  CREATOR*: Creator[SafetyCenterEntry] {.`static`.}

jclass android.safetycenter.SafetyCenterEntry.Builder* of JVMObject:
  proc setId*(id: string): Builder
  proc setTitle*(title: CharSequence): Builder
  proc setSummary*(summary: CharSequence): Builder
  proc setSeverityLevel*(severityLevel: jint): Builder
  proc setSeverityUnspecifiedIconType*(severityUnspecifiedIconType: jint): Builder
  proc setEnabled*(enabled: jboolean): Builder
  proc setPendingIntent*(pendingIntent: PendingIntent): Builder
  proc setIconAction*(iconAction: IconAction): Builder
  proc setIconAction*(type: jint, pendingIntent: PendingIntent): Builder
  proc build*(): SafetyCenterEntry

jclass android.safetycenter.SafetyCenterEntry.IconAction* of JVMObject:
  proc getType*(): jint
  proc getPendingIntent*(): PendingIntent
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)

jclass android.safetycenter.Builder* of JVMObject:
  proc setId*(id: string): Builder
  proc setTitle*(title: CharSequence): Builder
  proc setSummary*(summary: CharSequence): Builder
  proc setSeverityLevel*(severityLevel: jint): Builder
  proc setSeverityUnspecifiedIconType*(severityUnspecifiedIconType: jint): Builder
  proc setEnabled*(enabled: jboolean): Builder
  proc setPendingIntent*(pendingIntent: PendingIntent): Builder
  proc setIconAction*(iconAction: IconAction): Builder
  proc setIconAction*(type: jint, pendingIntent: PendingIntent): Builder
  proc build*(): SafetyCenterEntry

jclass android.safetycenter.IconAction* of JVMObject:
  proc getType*(): jint
  proc getPendingIntent*(): PendingIntent
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  ICON_ACTION_TYPE_GEAR*: jint {.`static`.}
  ICON_ACTION_TYPE_INFO*: jint {.`static`.}
  CREATOR*: Creator[IconAction] {.`static`.}

