import jnim

jclass android.view.WindowRelayoutResult* of JVMObject:
  proc readFromParcel*(in: Parcel)
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  frames*: ClientWindowFrames
  mergedConfiguration*: MergedConfiguration
  surfaceControl*: SurfaceControl
  insetsState*: InsetsState
  activeControls*: InsetsSourceControl.Array
  syncSeqId*: jint
  activityWindowInfo*: ActivityWindowInfo
  CREATOR*: Creator[WindowRelayoutResult] {.`static`.}

