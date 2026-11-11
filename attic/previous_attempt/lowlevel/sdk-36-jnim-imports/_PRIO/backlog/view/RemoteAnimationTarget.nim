import jnim

jclass android.view.RemoteAnimationTarget* of JVMObject:
  proc setShowBackdrop*(shouldShowBackdrop: jboolean)
  proc setWillShowImeOnTarget*(showImeOnTarget: jboolean)
  proc willShowImeOnTarget*(): jboolean
  proc setRotationChange*(rotationChange: jint)
  proc getRotationChange*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc dump*(pw: PrintWriter, prefix: string)
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  MODE_OPENING*: jint {.`static`.}
  MODE_CLOSING*: jint {.`static`.}
  MODE_CHANGING*: jint {.`static`.}
  mode*: jint
  taskId*: jint
  leash*: SurfaceControl
  startLeash*: SurfaceControl
  isTranslucent*: jboolean
  clipRect*: Rect
  contentInsets*: Rect
  prefixOrderIndex*: jint
  position*: Point
  localBounds*: Rect
  sourceContainerBounds*: Rect
  screenSpaceBounds*: Rect
  startBounds*: Rect
  windowConfiguration*: WindowConfiguration
  isNotInRecents*: jboolean
  taskInfo*: ActivityManager.RunningTaskInfo
  allowEnterPip*: jboolean
  windowType*: jint
  hasAnimatingParent*: jboolean
  showBackdrop*: jboolean
  backgroundColor*: jint
  willShowImeOnTarget*: jboolean
  rotationChange*: jint
  CREATOR*: Creator[RemoteAnimationTarget] {.`static`.}

