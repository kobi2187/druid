import jnim

jclass android.window.TaskAppearedInfo* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc getTaskInfo*(): RunningTaskInfo
  proc getLeash*(): SurfaceControl
  CREATOR*: Creator[TaskAppearedInfo] {.`static`.}

