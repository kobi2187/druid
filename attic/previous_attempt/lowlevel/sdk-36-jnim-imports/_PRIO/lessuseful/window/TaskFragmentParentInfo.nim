import jnim

jclass android.window.TaskFragmentParentInfo* of JVMObject:
  proc getConfiguration*(): Configuration
  proc getDisplayId*(): jint
  proc getTaskId*(): jint
  proc isVisible*(): jboolean
  proc hasDirectActivity*(): jboolean
  proc equalsForTaskFragmentOrganizer*(that: TaskFragmentParentInfo): jboolean
  proc getDecorSurface*(): SurfaceControl
  proc toString*(): string
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Creator[TaskFragmentParentInfo] {.`static`.}

