import jnim

jclass android.content.SyncResult* of JVMObject:
  proc hasHardError*(): jboolean
  proc hasSoftError*(): jboolean
  proc hasError*(): jboolean
  proc madeSomeProgress*(): jboolean
  proc clear*()
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  proc toDebugString*(): string
  syncAlreadyInProgress*: jboolean
  tooManyDeletions*: jboolean
  tooManyRetries*: jboolean
  databaseError*: jboolean
  fullSyncRequested*: jboolean
  partialSyncUnavailable*: jboolean
  moreRecordsToGet*: jboolean
  delayUntil*: jlong
  stats*: SyncStats
  ALREADY_IN_PROGRESS*: SyncResult {.`static`.}
  CREATOR*: Creator[SyncResult] {.`static`.}

