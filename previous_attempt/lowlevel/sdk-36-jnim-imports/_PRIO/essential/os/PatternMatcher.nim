import jnim

jclass android.os.PatternMatcher* of JVMObject:
  proc getPath*(): string
  proc getType*(): jint
  proc match*(str: string): jboolean
  proc toString*(): string
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  proc check*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  PATTERN_LITERAL*: jint {.`static`.}
  PATTERN_PREFIX*: jint {.`static`.}
  PATTERN_SIMPLE_GLOB*: jint {.`static`.}
  PATTERN_ADVANCED_GLOB*: jint {.`static`.}
  PATTERN_SUFFIX*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[PatternMatcher] {.`static`.}

