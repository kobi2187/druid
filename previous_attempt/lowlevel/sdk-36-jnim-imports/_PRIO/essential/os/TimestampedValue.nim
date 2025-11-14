import jnim

jclass android.os.TimestampedValue* of JVMObject:
  proc getReferenceTimeMillis*(): jlong
  proc getValue*(): T
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc referenceTimeDifference*(one: TimestampedValue[?], two: TimestampedValue[?]): jlong {.`static`.}
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[TimestampedValue[?]] {.`static`.}

