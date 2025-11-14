import jnim

jclass android.content.SyncAdapterType* of JVMObject:
  proc supportsUploading*(): jboolean
  proc isUserVisible*(): jboolean
  proc allowParallelSyncs*(): jboolean
  proc isAlwaysSyncable*(): jboolean
  proc getSettingsActivity*(): string
  proc getPackageName*(): string
  proc newKey*(authority: string, accountType: string): SyncAdapterType {.`static`.}
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  authority*: string
  accountType*: string
  isKey*: jboolean
  CREATOR*: Creator[SyncAdapterType] {.`static`.}

