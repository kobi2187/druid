import jnim

jclass android.view.VerifiedKeyEvent* of VerifiedInputEvent:
  proc getFlag*(flag: jint): Boolean
  proc getAction*(): jint
  proc getDownTimeNanos*(): jlong
  proc getFlags*(): jint
  proc getKeyCode*(): jint
  proc getScanCode*(): jint
  proc getMetaState*(): jint
  proc getRepeatCount*(): jint
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[VerifiedKeyEvent] {.`static`.}

