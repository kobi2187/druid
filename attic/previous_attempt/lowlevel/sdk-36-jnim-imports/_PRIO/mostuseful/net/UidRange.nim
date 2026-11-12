import jnim

jclass android.net.UidRange* of JVMObject:
  proc createForUser*(user: UserHandle): UidRange {.`static`.}
  proc getStartUser*(): jint
  proc getEndUser*(): jint
  proc contains*(uid: jint): jboolean
  proc count*(): jint
  proc containsRange*(other: UidRange): jboolean
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc containsUid*(ranges: Collection[UidRange], uid: jint): jboolean {.`static`.}
  proc fromIntRanges*(ranges: Set[Range[Integer]]): ArraySet[UidRange] {.`static`.}
  proc toIntRanges*(ranges: Set[UidRange]): ArraySet[Range[Integer]] {.`static`.}
  proc hasSameUids*(uids1: Set[UidRange], uids2: Set[UidRange]): jboolean {.`static`.}
  start*: jint
  stop*: jint
  CREATOR*: Creator[UidRange] {.`static`.}

