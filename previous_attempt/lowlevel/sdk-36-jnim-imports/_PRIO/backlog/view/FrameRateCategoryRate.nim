import jnim

jclass android.view.FrameRateCategoryRate* of JVMObject:
  proc getNormal*(): jfloat
  proc getHigh*(): jfloat
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Creator[FrameRateCategoryRate] {.`static`.}

