import jnim

jclass android.media.Session2CommandGroup* of JVMObject:
  proc hasCommand*(command: Session2Command): jboolean
  proc hasCommand*(commandCode: jint): jboolean
  proc getCommands*(): Set[Session2Command]
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[Session2CommandGroup] {.`static`.}

jclass android.media.Session2CommandGroup.Builder* of JVMObject:
  proc addCommand*(command: Session2Command): Builder
  proc removeCommand*(command: Session2Command): Builder
  proc build*(): Session2CommandGroup

jclass android.media.Builder* of JVMObject:
  proc addCommand*(command: Session2Command): Builder
  proc removeCommand*(command: Session2Command): Builder
  proc build*(): Session2CommandGroup

