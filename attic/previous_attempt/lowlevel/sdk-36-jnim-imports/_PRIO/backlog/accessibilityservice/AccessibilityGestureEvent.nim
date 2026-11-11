import jnim

jclass android.accessibilityservice.AccessibilityGestureEvent* of JVMObject:
  proc getDisplayId*(): jint
  proc getGestureId*(): jint
  proc getMotionEvents*(): List[MotionEvent]
  proc copyForAsync*(): AccessibilityGestureEvent
  proc recycle*()
  proc toString*(): string
  proc gestureIdToString*(id: jint): string {.`static`.}
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[AccessibilityGestureEvent] {.`static`.}

