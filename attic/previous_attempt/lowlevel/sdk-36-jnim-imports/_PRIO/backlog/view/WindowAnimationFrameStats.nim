import jnim

jclass android.view.WindowAnimationFrameStats* of FrameStats:
  proc init*(refreshPeriodNano: jlong, framesPresentedTimeNano: seq[jlong])
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[WindowAnimationFrameStats] {.`static`.}

