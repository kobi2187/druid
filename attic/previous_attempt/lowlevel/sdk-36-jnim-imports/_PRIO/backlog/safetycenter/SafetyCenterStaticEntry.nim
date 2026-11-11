import jnim

jclass android.safetycenter.SafetyCenterStaticEntry* of JVMObject:
  proc getTitle*(): CharSequence
  proc getSummary*(): CharSequence
  proc getPendingIntent*(): PendingIntent
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[SafetyCenterStaticEntry] {.`static`.}

jclass android.safetycenter.SafetyCenterStaticEntry.Builder* of JVMObject:
  proc setTitle*(title: CharSequence): Builder
  proc setSummary*(summary: CharSequence): Builder
  proc setPendingIntent*(pendingIntent: PendingIntent): Builder
  proc build*(): SafetyCenterStaticEntry

jclass android.safetycenter.Builder* of JVMObject:
  proc setTitle*(title: CharSequence): Builder
  proc setSummary*(summary: CharSequence): Builder
  proc setPendingIntent*(pendingIntent: PendingIntent): Builder
  proc build*(): SafetyCenterStaticEntry

