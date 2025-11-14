import jnim

jclass android.net.ConnectivityMetricsEvent* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  timestamp*: jlong
  transports*: jlong
  netId*: jint
  ifname*: string
  data*: Parcelable
  CREATOR*: Parcelable.Creator[ConnectivityMetricsEvent] {.`static`.}

