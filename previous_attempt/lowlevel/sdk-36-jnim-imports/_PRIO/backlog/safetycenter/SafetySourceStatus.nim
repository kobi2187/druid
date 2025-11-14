import jnim

jclass android.safetycenter.SafetySourceStatus* of JVMObject:
  proc getTitle*(): CharSequence
  proc getSummary*(): CharSequence
  proc getSeverityLevel*(): jint
  proc getPendingIntent*(): PendingIntent
  proc getIconAction*(): IconAction
  proc isEnabled*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CREATOR*: Creator[SafetySourceStatus] {.`static`.}

jclass android.safetycenter.SafetySourceStatus.IconAction* of JVMObject:
  proc getIconType*(): jint
  proc getPendingIntent*(): PendingIntent
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string

jclass android.safetycenter.SafetySourceStatus.Builder* of JVMObject:
  proc setPendingIntent*(pendingIntent: PendingIntent): Builder
  proc setIconAction*(iconAction: IconAction): Builder
  proc setEnabled*(enabled: jboolean): Builder
  proc build*(): SafetySourceStatus

jclass android.safetycenter.IconAction* of JVMObject:
  proc getIconType*(): jint
  proc getPendingIntent*(): PendingIntent
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CREATOR*: Creator[IconAction] {.`static`.}
  ICON_TYPE_GEAR*: jint {.`static`.}
  ICON_TYPE_INFO*: jint {.`static`.}

jclass android.safetycenter.Builder* of JVMObject:
  proc setPendingIntent*(pendingIntent: PendingIntent): Builder
  proc setIconAction*(iconAction: IconAction): Builder
  proc setEnabled*(enabled: jboolean): Builder
  proc build*(): SafetySourceStatus

