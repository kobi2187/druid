import jnim

jclass android.window.BackAnimationAdapter* of JVMObject:
  proc getRunner*(): IBackAnimationRunner
  proc updateSupportedAnimators*(animators: ArrayList[Integer])
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc isAnimatable*(backType: jint): jboolean
  CREATOR*: Creator[BackAnimationAdapter] {.`static`.}

