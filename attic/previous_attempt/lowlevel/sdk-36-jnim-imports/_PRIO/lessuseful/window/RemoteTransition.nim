import jnim

jclass android.window.RemoteTransition* of JVMObject:
  proc asBinder*(): IBinder
  proc getRemoteTransition*(): IRemoteTransition
  proc getAppThread*(): IApplicationThread
  proc getDebugName*(): string
  proc setRemoteTransition*(value: IRemoteTransition): RemoteTransition
  proc setAppThread*(value: IApplicationThread): RemoteTransition
  proc setDebugName*(value: string): RemoteTransition
  proc toString*(): string
  proc writeToParcel*(dest: android.os.Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[RemoteTransition] {.`static`.}

