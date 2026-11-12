import jnim

jclass android.nfc.TransceiveResult* of JVMObject:
  proc getResponseOrThrow*(): seq[jbyte]
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  RESULT_SUCCESS*: jint {.`static`.}
  RESULT_FAILURE*: jint {.`static`.}
  RESULT_TAGLOST*: jint {.`static`.}
  RESULT_EXCEEDED_LENGTH*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[TransceiveResult] {.`static`.}

