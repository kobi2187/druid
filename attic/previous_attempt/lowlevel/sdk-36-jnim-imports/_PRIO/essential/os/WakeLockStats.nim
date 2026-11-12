import jnim

jclass android.os.WakeLockStats* of JVMObject:
  proc getWakeLocks*(): List[WakeLock]
  proc getAggregatedWakeLocks*(): List[WakeLock]
  proc writeToParcel*(output:Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  CREATOR*: Creator[WakeLockStats] {.`static`.}

jclass android.os.WakeLockStats.WakeLockData* of JVMObject:
  proc isDataValid*(): jboolean
  proc toString*(): string

jclass android.os.WakeLockStats.WakeLock* of JVMObject:
  proc isDataValid*(totalWakeLockData: WakeLockData, backgroundWakeLockData: WakeLockData): jboolean {.`static`.}
  proc toString*(): string

jclass android.os.WakeLockData* of JVMObject:
  proc isDataValid*(): jboolean
  proc toString*(): string
  EMPTY*: WakeLockData {.`static`.}
  timesAcquired*: jint
  totalTimeHeldMs*: jlong
  timeHeldMs*: jlong

jclass android.os.WakeLock* of JVMObject:
  proc isDataValid*(totalWakeLockData: WakeLockData, backgroundWakeLockData: WakeLockData): jboolean {.`static`.}
  proc toString*(): string
  NAME_AGGREGATED*: string {.`static`.}
  uid*: jint
  name*: string
  isAggregated*: jboolean
  totalWakeLockData*: WakeLockData
  backgroundWakeLockData*: WakeLockData

