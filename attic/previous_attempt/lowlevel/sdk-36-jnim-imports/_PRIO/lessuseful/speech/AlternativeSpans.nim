import jnim

jclass android.speech.AlternativeSpans* of JVMObject:
  proc getSpans*(): List[AlternativeSpan]
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: android.os.Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[AlternativeSpans] {.`static`.}

