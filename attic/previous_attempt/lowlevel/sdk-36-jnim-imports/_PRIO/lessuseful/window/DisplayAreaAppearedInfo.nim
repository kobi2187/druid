import jnim

jclass android.window.DisplayAreaAppearedInfo* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc getDisplayAreaInfo*(): DisplayAreaInfo
  proc getLeash*(): SurfaceControl
  CREATOR*: Creator[DisplayAreaAppearedInfo] {.`static`.}

