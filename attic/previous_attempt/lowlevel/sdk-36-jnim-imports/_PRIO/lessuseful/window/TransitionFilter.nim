import jnim

jclass android.window.TransitionFilter* of JVMObject:
  proc matches*(info: TransitionInfo): jboolean
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  CONTAINER_ORDER_ANY*: jint {.`static`.}
  CONTAINER_ORDER_TOP*: jint {.`static`.}
  mTypeSet*: jint
  mFlags*: jint
  mNotFlags*: jint
  mRequirements*: Requirement
  CREATOR*: Creator[TransitionFilter] {.`static`.}

jclass android.window.TransitionFilter.Requirement* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string

jclass android.window.Requirement* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  mActivityType*: jint
  mMustBeIndependent*: jboolean
  mNot*: jboolean
  mModes*: jint
  mFlags*: jint
  mMustBeTask*: jboolean
  mOrder*: jint
  mTopActivity*: ComponentName
  mLaunchCookie*: IBinder
  mCustomAnimation*: Boolean
  mTaskFragmentToken*: IBinder
  mWindowingMode*: jint
  CREATOR*: Creator[Requirement] {.`static`.}

