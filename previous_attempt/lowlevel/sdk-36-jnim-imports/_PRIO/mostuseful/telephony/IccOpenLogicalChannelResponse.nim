import jnim

jclass android.telephony.IccOpenLogicalChannelResponse* of JVMObject:
  proc getChannel*(): jint
  proc getStatus*(): jint
  proc getSelectResponse*(): seq[jbyte]
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc toString*(): string
  INVALID_CHANNEL*: jint {.`static`.}
  STATUS_NO_ERROR*: jint {.`static`.}
  STATUS_MISSING_RESOURCE*: jint {.`static`.}
  STATUS_NO_SUCH_ELEMENT*: jint {.`static`.}
  STATUS_UNKNOWN_ERROR*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[IccOpenLogicalChannelResponse] {.`static`.}

