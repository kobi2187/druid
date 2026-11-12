import jnim

jclass android.app.WaitResult* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc dump*(pw: PrintWriter, prefix: string)
  proc launchStateToString*(type: jint): string {.`static`.}
  LAUNCH_STATE_UNKNOWN*: jint {.`static`.}
  LAUNCH_STATE_COLD*: jint {.`static`.}
  LAUNCH_STATE_WARM*: jint {.`static`.}
  LAUNCH_STATE_HOT*: jint {.`static`.}
  LAUNCH_STATE_RELAUNCH*: jint {.`static`.}
  INVALID_DELAY*: jint {.`static`.}
  result*: jint
  timeout*: jboolean
  who*: ComponentName
  totalTime*: jlong
  launchState*: jint
  CREATOR*: Parcelable.Creator[WaitResult] {.`static`.}

