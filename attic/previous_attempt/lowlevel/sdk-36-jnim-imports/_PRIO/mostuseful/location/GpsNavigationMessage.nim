import jnim

jclass android.location.GpsNavigationMessage* of JVMObject:
  proc set*(navigationMessage: GpsNavigationMessage)
  proc reset*()
  proc getType*(): jbyte
  proc setType*(value: jbyte)
  proc getPrn*(): jbyte
  proc setPrn*(value: jbyte)
  proc getMessageId*(): jshort
  proc setMessageId*(value: jshort)
  proc getSubmessageId*(): jshort
  proc setSubmessageId*(value: jshort)
  proc getData*(): seq[jbyte]
  proc setData*(value: seq[jbyte])
  proc getStatus*(): jshort
  proc setStatus*(value: jshort)
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  TYPE_UNKNOWN*: jbyte {.`static`.}
  TYPE_L1CA*: jbyte {.`static`.}
  TYPE_L2CNAV*: jbyte {.`static`.}
  TYPE_L5CNAV*: jbyte {.`static`.}
  TYPE_CNAV2*: jbyte {.`static`.}
  STATUS_UNKNOWN*: jshort {.`static`.}
  STATUS_PARITY_PASSED*: jshort {.`static`.}
  STATUS_PARITY_REBUILT*: jshort {.`static`.}
  CREATOR*: Creator[GpsNavigationMessage] {.`static`.}

