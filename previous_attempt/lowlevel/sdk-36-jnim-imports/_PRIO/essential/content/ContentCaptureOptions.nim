import jnim

jclass android.content.ContentCaptureOptions* of JVMObject:
  proc forWhitelistingItself*(): ContentCaptureOptions {.`static`.}
  proc isWhitelisted*(context: Context): jboolean
  proc toString*(): string
  proc dumpShort*(pw: PrintWriter)
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  loggingLevel*: jint
  maxBufferSize*: jint
  idleFlushingFrequencyMs*: jint
  textChangeFlushingFrequencyMs*: jint
  logHistorySize*: jint
  disableFlushForViewTreeAppearing*: jboolean
  enableReceiver*: jboolean
  contentProtectionOptions*: ContentProtectionOptions
  whitelistedComponents*: ArraySet[ComponentName]
  lite*: jboolean
  CREATOR*: Parcelable.Creator[ContentCaptureOptions] {.`static`.}

jclass android.content.ContentCaptureOptions.ContentProtectionOptions* of JVMObject:
  proc toString*(): string

jclass android.content.ContentProtectionOptions* of JVMObject:
  proc toString*(): string
  enableReceiver*: jboolean
  bufferSize*: jint
  requiredGroups*: List[List[string]]
  optionalGroups*: List[List[string]]
  optionalGroupsThreshold*: jint

