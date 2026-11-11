import jnim

jclass android.provider.MediaCognitionProcessingVersions* of JVMObject:
  proc setProcessingVersion*(processingType: jint, version: jint)
  proc getProcessingVersion*(processingType: jint): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[MediaCognitionProcessingVersions] {.`static`.}

