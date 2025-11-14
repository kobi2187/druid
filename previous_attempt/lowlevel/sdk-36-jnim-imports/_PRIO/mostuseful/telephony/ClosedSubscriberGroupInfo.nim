import jnim

jclass android.telephony.ClosedSubscriberGroupInfo* of JVMObject:
  proc getCsgIndicator*(): jboolean
  proc getHomeNodebName*(): string
  proc getCsgIdentity*(): jint
  proc hashCode*(): jint
  proc equals*(other: JObject): jboolean
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, type: jint)
  proc describeContents*(): jint
  CREATOR*: Creator[ClosedSubscriberGroupInfo] {.`static`.}

