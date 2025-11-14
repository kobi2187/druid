import jnim

jclass android.os.ShellCallback* of JVMObject:
  proc openFile*(path: string, seLinuxContext: string, mode: string): ParcelFileDescriptor
  proc onOpenFile*(path: string, seLinuxContext: string, mode: string): ParcelFileDescriptor
  proc writeToParcel*(callback: ShellCallback, output:Parcel) {.`static`.}
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc getShellCallbackBinder*(): IBinder
  CREATOR*: Parcelable.Creator[ShellCallback] {.`static`.}

