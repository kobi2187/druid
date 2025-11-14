import jnim

jclass android.telephony.NeighboringCellInfo* of JVMObject:
  proc getRssi*(): jint
  proc getLac*(): jint
  proc getCid*(): jint
  proc getPsc*(): jint
  proc getNetworkType*(): jint
  proc setCid*(cid: jint)
  proc setRssi*(rssi: jint)
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  UNKNOWN_RSSI*: jint {.`static`.}
  UNKNOWN_CID*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[NeighboringCellInfo] {.`static`.}

