import jnim

jclass android.view.MagnificationSpec* of JVMObject:
  proc initialize*(scale: jfloat, offsetX: jfloat, offsetY: jfloat)
  proc isNop*(): jboolean
  proc clear*()
  proc setTo*(other: MagnificationSpec)
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  scale*: jfloat
  offsetX*: jfloat
  offsetY*: jfloat
  CREATOR*: Creator[MagnificationSpec] {.`static`.}

