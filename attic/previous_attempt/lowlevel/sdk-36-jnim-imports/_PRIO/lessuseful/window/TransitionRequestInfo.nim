import jnim

jclass android.window.TransitionRequestInfo* of JVMObject:
  proc getType*(): jint
  proc getTriggerTask*(): ActivityManager.RunningTaskInfo
  proc getPipChange*(): TransitionRequestInfo.PipChange
  proc getRemoteTransition*(): RemoteTransition
  proc getDisplayChange*(): TransitionRequestInfo.DisplayChange
  proc getFlags*(): jint
  proc getDebugId*(): jint
  proc setTriggerTask*(value: ActivityManager.RunningTaskInfo): TransitionRequestInfo
  proc setPipChange*(value: TransitionRequestInfo.PipChange): TransitionRequestInfo
  proc setRemoteTransition*(value: RemoteTransition): TransitionRequestInfo
  proc setDisplayChange*(value: TransitionRequestInfo.DisplayChange): TransitionRequestInfo
  proc toString*(): string
  proc writeToParcel*(dest: android.os.Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[TransitionRequestInfo] {.`static`.}

jclass android.window.TransitionRequestInfo.DisplayChange* of JVMObject:
  proc getDisplayId*(): jint
  proc getStartAbsBounds*(): Rect
  proc getEndAbsBounds*(): Rect
  proc getStartRotation*(): jint
  proc getEndRotation*(): jint
  proc isPhysicalDisplayChanged*(): jboolean
  proc setStartAbsBounds*(value: Rect): DisplayChange
  proc setEndAbsBounds*(value: Rect): DisplayChange
  proc setStartRotation*(value: jint): DisplayChange
  proc setEndRotation*(value: jint): DisplayChange
  proc setPhysicalDisplayChanged*(value: jboolean): DisplayChange
  proc toString*(): string
  proc writeToParcel*(dest: android.os.Parcel, flags: jint)
  proc describeContents*(): jint

jclass android.window.TransitionRequestInfo.PipChange* of JVMObject:
  proc getTaskFragmentToken*(): WindowContainerToken
  proc getTaskInfo*(): ActivityManager.RunningTaskInfo
  proc setTaskFragmentToken*(value: WindowContainerToken): PipChange
  proc setTaskInfo*(value: ActivityManager.RunningTaskInfo): PipChange
  proc toString*(): string
  proc writeToParcel*(dest: android.os.Parcel, flags: jint)
  proc describeContents*(): jint

jclass android.window.DisplayChange* of JVMObject:
  proc getDisplayId*(): jint
  proc getStartAbsBounds*(): Rect
  proc getEndAbsBounds*(): Rect
  proc getStartRotation*(): jint
  proc getEndRotation*(): jint
  proc isPhysicalDisplayChanged*(): jboolean
  proc setStartAbsBounds*(value: Rect): DisplayChange
  proc setEndAbsBounds*(value: Rect): DisplayChange
  proc setStartRotation*(value: jint): DisplayChange
  proc setEndRotation*(value: jint): DisplayChange
  proc setPhysicalDisplayChanged*(value: jboolean): DisplayChange
  proc toString*(): string
  proc writeToParcel*(dest: android.os.Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[DisplayChange] {.`static`.}

jclass android.window.PipChange* of JVMObject:
  proc getTaskFragmentToken*(): WindowContainerToken
  proc getTaskInfo*(): ActivityManager.RunningTaskInfo
  proc setTaskFragmentToken*(value: WindowContainerToken): PipChange
  proc setTaskInfo*(value: ActivityManager.RunningTaskInfo): PipChange
  proc toString*(): string
  proc writeToParcel*(dest: android.os.Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[PipChange] {.`static`.}

