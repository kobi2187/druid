import jnim

jclass android.app.RemoteInputHistoryItem* of JVMObject:
  proc getText*(): CharSequence
  proc getMimeType*(): string
  proc getUri*(): Uri
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[RemoteInputHistoryItem] {.`static`.}

