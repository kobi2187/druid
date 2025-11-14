import jnim

jclass android.view.RemoteAnimationDefinition* of JVMObject:
  proc addRemoteAnimation*(transition: jint, activityTypeFilter: jint, adapter: RemoteAnimationAdapter)
  proc addRemoteAnimation*(transition: jint, adapter: RemoteAnimationAdapter)
  proc hasTransition*(transition: jint, activityTypes: ArraySet[Integer]): jboolean
  proc getAdapter*(transition: jint, activityTypes: ArraySet[Integer]): RemoteAnimationAdapter
  proc setCallingPidUid*(pid: jint, uid: jint)
  proc linkToDeath*(deathRecipient: IBinder.DeathRecipient)
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[RemoteAnimationDefinition] {.`static`.}

