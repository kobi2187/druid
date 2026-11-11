import jnim

jclass android.window.ClientWindowFrames* of JVMObject:
  proc setTo*(other: ClientWindowFrames)
  proc readFromParcel*(in: Parcel)
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  frame*: Rect
  displayFrame*: Rect
  parentFrame*: Rect
  attachedFrame*: Rect
  isParentFrameClippedByDisplayCutout*: jboolean
  compatScale*: jfloat
  seq*: jint
  CREATOR*: Creator[ClientWindowFrames] {.`static`.}

