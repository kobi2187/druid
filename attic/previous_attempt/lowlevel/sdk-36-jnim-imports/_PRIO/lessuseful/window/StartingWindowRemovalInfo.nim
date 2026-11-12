import jnim

jclass android.window.StartingWindowRemovalInfo* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  taskId*: jint
  windowAnimationLeash*: SurfaceControl
  mainFrame*: Rect
  playRevealAnimation*: jboolean
  DEFER_MODE_DEFAULT*: jint {.`static`.}
  DEFER_MODE_NORMAL*: jint {.`static`.}
  DEFER_MODE_ROTATION*: jint {.`static`.}
  DEFER_MODE_NONE*: jint {.`static`.}
  deferRemoveMode*: jint
  roundedCornerRadius*: jfloat
  windowlessSurface*: jboolean
  removeImmediately*: jboolean
  CREATOR*: Creator[StartingWindowRemovalInfo] {.`static`.}

