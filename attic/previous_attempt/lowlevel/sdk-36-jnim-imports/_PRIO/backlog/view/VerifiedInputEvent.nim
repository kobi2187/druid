import jnim

jclass android.view.VerifiedInputEvent* of JVMObject:
  proc getDeviceId*(): jint
  proc getEventTimeNanos*(): jlong
  proc getSource*(): jint
  proc getDisplayId*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  CREATOR*: Parcelable.Creator[VerifiedInputEvent] {.`static`.}

