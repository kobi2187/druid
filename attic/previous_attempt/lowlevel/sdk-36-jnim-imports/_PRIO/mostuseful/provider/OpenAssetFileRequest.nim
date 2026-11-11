import jnim

jclass android.provider.OpenAssetFileRequest* of JVMObject:
  proc getUri*(): Uri
  proc getMimeType*(): string
  proc getOpts*(): Bundle
  proc getCallback*(): IOpenAssetFileCallback
  proc getCancellationSignal*(): IMPCancellationSignal
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[OpenAssetFileRequest] {.`static`.}

