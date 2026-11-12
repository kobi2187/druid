import jnim

jclass android.view.VerifiedMotionEvent* of VerifiedInputEvent:
  proc getFlag*(flag: jint): Boolean
  proc getRawX*(): jfloat
  proc getRawY*(): jfloat
  proc getActionMasked*(): jint
  proc getDownTimeNanos*(): jlong
  proc getFlags*(): jint
  proc getMetaState*(): jint
  proc getButtonState*(): jint
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[VerifiedMotionEvent] {.`static`.}

