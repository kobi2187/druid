import jnim

jclass android.provider.OpenFileRequest* of JVMObject:
  proc getUri*(): Uri
  proc getCallback*(): IOpenFileCallback
  proc getCancellationSignal*(): IMPCancellationSignal
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[OpenFileRequest] {.`static`.}

