import jnim

jclass android.provider.MediaCognitionProcessingResponse* of JVMObject:
  proc getRequest*(): MediaCognitionProcessingRequest
  proc getImageLabels*(): List[string]
  proc getImageOcrLatin*(): string

jclass android.provider.MediaCognitionProcessingResponse.Builder* of JVMObject:
  proc setImageLabels*(imageLabels: List[string]): Builder
  proc setImageOcrLatin*(imageOcrLatin: string): Builder
  proc build*(): MediaCognitionProcessingResponse

jclass android.provider.Builder* of JVMObject:
  proc setImageLabels*(imageLabels: List[string]): Builder
  proc setImageOcrLatin*(imageOcrLatin: string): Builder
  proc build*(): MediaCognitionProcessingResponse

