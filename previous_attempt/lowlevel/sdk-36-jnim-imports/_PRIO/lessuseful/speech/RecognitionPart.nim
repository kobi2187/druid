import jnim

jclass android.speech.RecognitionPart* of JVMObject:
  proc confidenceLevelToString*(value: jint): string {.`static`.}
  proc getRawText*(): string
  proc getFormattedText*(): string
  proc getTimestampMillis*(): jlong
  proc getConfidenceLevel*(): jint
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: android.os.Parcel, flags: jint)
  proc describeContents*(): jint
  CONFIDENCE_LEVEL_UNKNOWN*: jint {.`static`.}
  CONFIDENCE_LEVEL_LOW*: jint {.`static`.}
  CONFIDENCE_LEVEL_MEDIUM_LOW*: jint {.`static`.}
  CONFIDENCE_LEVEL_MEDIUM*: jint {.`static`.}
  CONFIDENCE_LEVEL_MEDIUM_HIGH*: jint {.`static`.}
  CONFIDENCE_LEVEL_HIGH*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[RecognitionPart] {.`static`.}

jclass android.speech.RecognitionPart.Builder* of JVMObject:
  proc setRawText*(value: string): Builder
  proc setTimestampMillis*(value: jlong): Builder
  proc setConfidenceLevel*(value: jint): Builder
  proc build*(): RecognitionPart

jclass android.speech.Builder* of BaseBuilder:
  proc setRawText*(value: string): Builder
  proc setTimestampMillis*(value: jlong): Builder
  proc setConfidenceLevel*(value: jint): Builder
  proc build*(): RecognitionPart

