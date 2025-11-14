import jnim

jclass android.net.DataUsageRequest* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  PARCELABLE_KEY*: string {.`static`.}
  REQUEST_ID_UNSET*: jint {.`static`.}
  requestId*: jint
  template*: NetworkTemplate
  thresholdInBytes*: jlong
  CREATOR*: Creator[DataUsageRequest] {.`static`.}

