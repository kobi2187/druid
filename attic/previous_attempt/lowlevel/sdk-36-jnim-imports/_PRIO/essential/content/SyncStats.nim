import jnim

jclass android.content.SyncStats* of JVMObject:
  proc toString*(): string
  proc clear*()
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  numAuthExceptions*: jlong
  numIoExceptions*: jlong
  numParseExceptions*: jlong
  numConflictDetectedExceptions*: jlong
  numInserts*: jlong
  numUpdates*: jlong
  numDeletes*: jlong
  numEntries*: jlong
  numSkippedEntries*: jlong
  CREATOR*: Creator[SyncStats] {.`static`.}

