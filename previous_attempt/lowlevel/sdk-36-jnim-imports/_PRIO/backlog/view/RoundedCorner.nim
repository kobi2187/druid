import jnim

jclass android.view.RoundedCorner* of JVMObject:
  proc getPosition*(): jint
  proc getRadius*(): jint
  proc getCenter*(): Point
  proc isEmpty*(): jboolean
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  POSITION_TOP_LEFT*: jint {.`static`.}
  POSITION_TOP_RIGHT*: jint {.`static`.}
  POSITION_BOTTOM_RIGHT*: jint {.`static`.}
  POSITION_BOTTOM_LEFT*: jint {.`static`.}
  CREATOR*: Creator[RoundedCorner] {.`static`.}

