import jnim

jclass android.nfc.T4tNdefNfceeCcFileInfo* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getCcFileLength*(): jint
  proc getVersion*(): jint
  proc getFileId*(): jint
  proc getMaxSize*(): jint
  proc isReadAllowed*(): jboolean
  proc isWriteAllowed*(): jboolean
  proc describeContents*(): jint
  VERSION_2_0*: jint {.`static`.}
  VERSION_3_0*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[T4tNdefNfceeCcFileInfo] {.`static`.}

