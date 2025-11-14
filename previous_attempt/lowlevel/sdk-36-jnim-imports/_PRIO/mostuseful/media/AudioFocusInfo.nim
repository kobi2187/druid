import jnim

jclass android.media.AudioFocusInfo* of JVMObject:
  proc setGen*(g: jlong)
  proc getGen*(): jlong
  proc getAttributes*(): AudioAttributes
  proc getClientUid*(): jint
  proc getClientId*(): string
  proc getPackageName*(): string
  proc getGainRequest*(): jint
  proc getLossReceived*(): jint
  proc getSdkTarget*(): jint
  proc clearLossReceived*()
  proc getFlags*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  CREATOR*: Parcelable.Creator[AudioFocusInfo] {.`static`.}

