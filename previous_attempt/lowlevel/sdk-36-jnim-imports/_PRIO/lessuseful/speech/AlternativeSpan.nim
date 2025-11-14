import jnim

jclass android.speech.AlternativeSpan* of JVMObject:
  proc getStartPosition*(): jint
  proc getEndPosition*(): jint
  proc getAlternatives*(): List[string]
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: android.os.Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[AlternativeSpan] {.`static`.}

