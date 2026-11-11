import jnim

jclass android.window.TaskFragmentInfo* of JVMObject:
  proc getFragmentToken*(): IBinder
  proc getToken*(): WindowContainerToken
  proc getConfiguration*(): Configuration
  proc isEmpty*(): jboolean
  proc hasRunningActivity*(): jboolean
  proc getRunningActivityCount*(): jint
  proc isVisible*(): jboolean
  proc getActivities*(): List[IBinder]
  proc getActivitiesRequestedInTaskFragment*(): List[IBinder]
  proc getPositionInParent*(): Point
  proc isTaskClearedForReuse*(): jboolean
  proc isTaskFragmentClearedForPip*(): jboolean
  proc isClearedForReorderActivityToFront*(): jboolean
  proc getWindowingMode*(): jint
  proc getMinimumWidth*(): jint
  proc getMinimumHeight*(): jint
  proc isTopNonFinishingChild*(): jboolean
  proc equalsForTaskFragmentOrganizer*(that: TaskFragmentInfo): jboolean
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  proc describeContents*(): jint
  CREATOR*: Creator[TaskFragmentInfo] {.`static`.}

