import jnim

jclass android.view.RemoteAnimationAdapter* of JVMObject:
  proc getRunner*(): IRemoteAnimationRunner
  proc getDuration*(): jlong
  proc getStatusBarTransitionDelay*(): jlong
  proc getChangeNeedsSnapshot*(): jboolean
  proc setCallingPidUid*(pid: jint, uid: jint)
  proc getCallingPid*(): jint
  proc getCallingUid*(): jint
  proc getCallingApplication*(): IApplicationThread
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[RemoteAnimationAdapter] {.`static`.}

