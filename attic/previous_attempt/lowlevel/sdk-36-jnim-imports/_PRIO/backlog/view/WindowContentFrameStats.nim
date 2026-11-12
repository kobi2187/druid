import jnim

jclass android.view.WindowContentFrameStats* of FrameStats:
  proc init*(refreshPeriodNano: jlong, framesPostedTimeNano: seq[jlong], framesPresentedTimeNano: seq[jlong], framesReadyTimeNano: seq[jlong])
  proc getFramePostedTimeNano*(index: jint): jlong
  proc getFrameReadyTimeNano*(index: jint): jlong
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Parcelable.Creator[WindowContentFrameStats] {.`static`.}

