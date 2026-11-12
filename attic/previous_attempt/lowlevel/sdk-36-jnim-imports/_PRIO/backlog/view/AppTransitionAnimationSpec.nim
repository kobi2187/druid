import jnim

jclass android.view.AppTransitionAnimationSpec* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  taskId*: jint
  buffer*: HardwareBuffer
  rect*: Rect
  CREATOR*: Parcelable.Creator[AppTransitionAnimationSpec] {.`static`.}

