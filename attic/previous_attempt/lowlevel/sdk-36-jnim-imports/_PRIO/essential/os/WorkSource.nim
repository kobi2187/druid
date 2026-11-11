import jnim

jclass android.os.WorkSource* of JVMObject:
  proc isChainedBatteryAttributionEnabled*(context: Context): jboolean {.`static`.}
  proc isChainedBatteryAttributionEnabled$ravenwood*(context: Context): jboolean {.`static`.}
  proc size*(): jint
  proc get*(index: jint): jint
  proc getUid*(index: jint): jint
  proc getAttributionUid*(): jint
  proc getName*(index: jint): string
  proc getPackageName*(index: jint): string
  proc clear*()
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc diff*(other: WorkSource): jboolean
  proc set*(other: WorkSource)
  proc set*(uid: jint)
  proc set*(uid: jint, name: string)
  proc setReturningDiffs*(other: WorkSource): seq[WorkSource]
  proc add*(other: WorkSource): jboolean
  proc withoutNames*(): WorkSource
  proc addReturningNewbs*(other: WorkSource): WorkSource
  proc add*(uid: jint): jboolean
  proc add*(uid: jint, name: string): jboolean
  proc remove*(other: WorkSource): jboolean
  proc createWorkChain*(): WorkChain
  proc isEmpty*(): jboolean
  proc getWorkChains*(): List[WorkChain]
  proc transferWorkChains*(other: WorkSource)
  proc diffChains*(oldWs: WorkSource, newWs: WorkSource): ArrayList[WorkChain] {.`static`.}
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  CREATOR*: Parcelable.Creator[WorkSource] {.`static`.}

jclass android.os.WorkSource.WorkChain* of JVMObject:
  proc addNode*(uid: jint, tag: string): WorkChain
  proc getAttributionUid*(): jint
  proc getAttributionTag*(): string
  proc getUids*(): seq[jint]
  proc getTags*(): seq[string]
  proc getSize*(): jint
  proc toString*(): string
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)

jclass android.os.WorkChain* of JVMObject:
  proc addNode*(uid: jint, tag: string): WorkChain
  proc getAttributionUid*(): jint
  proc getAttributionTag*(): string
  proc getUids*(): seq[jint]
  proc getTags*(): seq[string]
  proc getSize*(): jint
  proc toString*(): string
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[WorkChain] {.`static`.}

