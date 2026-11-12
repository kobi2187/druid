import jnim

jclass android.view.InputMonitor* of JVMObject:
  proc pilferPointers*()
  proc dispose*()
  proc getInputChannel*(): InputChannel
  proc getHost*(): IInputMonitorHost
  proc getSurface*(): SurfaceControl
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[InputMonitor] {.`static`.}

