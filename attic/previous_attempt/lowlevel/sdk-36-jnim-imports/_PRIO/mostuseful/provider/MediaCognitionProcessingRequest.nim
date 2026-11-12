import jnim

jclass android.provider.MediaCognitionProcessingRequest* of JVMObject:
  proc getUri*(): Uri
  proc checkProcessingRequired*(processingType: jint): jboolean
  proc getProcessingCombination*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[MediaCognitionProcessingRequest] {.`static`.}

jclass android.provider.MediaCognitionProcessingRequest.Builder* of JVMObject:
  proc setProcessingCombination*(processingCombination: jint): Builder
  proc addProcessingRequest*(processingRequest: jint): Builder
  proc build*(): MediaCognitionProcessingRequest

jclass android.provider.Builder* of JVMObject:
  proc setProcessingCombination*(processingCombination: jint): Builder
  proc addProcessingRequest*(processingRequest: jint): Builder
  proc build*(): MediaCognitionProcessingRequest

