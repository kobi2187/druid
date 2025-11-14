import jnim

jclass android.app.DirectAction* of JVMObject:
  proc setSource*(taskId: jint, activityId: IBinder)
  proc getTaskId*(): jint
  proc getActivityId*(): IBinder
  proc getId*(): string
  proc getExtras*(): Bundle
  proc getLocusId*(): LocusId
  proc describeContents*(): jint
  proc hashCode*(): jint
  proc equals*(other: JObject): jboolean
  proc writeToParcel*(dest: Parcel, flags: jint)
  KEY_ACTIONS_LIST*: string {.`static`.}
  CREATOR*: Parcelable.Creator[DirectAction] {.`static`.}

jclass android.app.DirectAction.Builder* of JVMObject:
  proc setExtras*(extras: Bundle): Builder
  proc setLocusId*(locusId: LocusId): Builder
  proc build*(): DirectAction

jclass android.app.Builder* of JVMObject:
  proc setExtras*(extras: Bundle): Builder
  proc setLocusId*(locusId: LocusId): Builder
  proc build*(): DirectAction

