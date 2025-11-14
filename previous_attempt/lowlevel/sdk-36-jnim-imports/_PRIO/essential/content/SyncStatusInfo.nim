import jnim

jclass android.content.SyncStatusInfo* of JVMObject:
  proc getLastFailureMesgAsInt*(def: jint): jint
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc getPeriodicSyncTimesSize*(): jint
  proc addPeriodicSyncTime*(time: jlong)
  proc setPeriodicSyncTime*(index: jint, when: jlong)
  proc getPeriodicSyncTime*(index: jint): jlong
  proc removePeriodicSyncTime*(index: jint)
  proc populateLastEventsInformation*(lastEventInformation: ArrayList[Pair<Long, String>])
  proc addEvent*(message: string)
  proc getEventCount*(): jint
  proc getEventTime*(i: jint): jlong
  proc getEvent*(i: jint): string
  proc setLastSuccess*(source: jint, lastSyncTime: jlong)
  proc setLastFailure*(source: jint, lastSyncTime: jlong, failureMessage: string)
  proc maybeResetTodayStats*(clockValid: jboolean, force: jboolean)
  authorityId*: jint
  lastTodayResetTime*: jlong
  totalStats*: Stats
  todayStats*: Stats
  yesterdayStats*: Stats
  lastSuccessTime*: jlong
  lastSuccessSource*: jint
  lastFailureTime*: jlong
  lastFailureSource*: jint
  lastFailureMesg*: string
  initialFailureTime*: jlong
  pending*: jboolean
  initialize*: jboolean
  perSourceLastSuccessTimes*: jlong
  perSourceLastFailureTimes*: jlong
  CREATOR*: Creator[SyncStatusInfo] {.`static`.}

jclass android.content.SyncStatusInfo.Stats* of JVMObject:
  proc copyTo*(to: Stats)
  proc clear*()
  proc writeToParcel*(parcel: Parcel)
  proc readFromParcel*(parcel: Parcel)

jclass android.content.Stats* of JVMObject:
  proc copyTo*(to: Stats)
  proc clear*()
  proc writeToParcel*(parcel: Parcel)
  proc readFromParcel*(parcel: Parcel)
  totalElapsedTime*: jlong
  numSyncs*: jint
  numSourcePoll*: jint
  numSourceOther*: jint
  numSourceLocal*: jint
  numSourceUser*: jint
  numSourcePeriodic*: jint
  numSourceFeed*: jint
  numFailures*: jint
  numCancels*: jint

