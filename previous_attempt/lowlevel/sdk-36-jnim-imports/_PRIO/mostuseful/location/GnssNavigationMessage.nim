import jnim

jclass android.location.GnssNavigationMessage* of JVMObject:
  proc set*(navigationMessage: GnssNavigationMessage)
  proc reset*()
  proc getType*(): jint
  proc setType*(value: jint)
  proc getSvid*(): jint
  proc setSvid*(value: jint)
  proc getMessageId*(): jint
  proc setMessageId*(value: jint)
  proc getSubmessageId*(): jint
  proc setSubmessageId*(value: jint)
  proc getData*(): seq[jbyte]
  proc setData*(value: seq[jbyte])
  proc getStatus*(): jint
  proc setStatus*(value: jint)
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  TYPE_UNKNOWN*: jint {.`static`.}
  TYPE_GPS_L1CA*: jint {.`static`.}
  TYPE_GPS_L2CNAV*: jint {.`static`.}
  TYPE_GPS_L5CNAV*: jint {.`static`.}
  TYPE_GPS_CNAV2*: jint {.`static`.}
  TYPE_SBS*: jint {.`static`.}
  TYPE_GLO_L1CA*: jint {.`static`.}
  TYPE_QZS_L1CA*: jint {.`static`.}
  TYPE_BDS_D1*: jint {.`static`.}
  TYPE_BDS_D2*: jint {.`static`.}
  TYPE_BDS_CNAV1*: jint {.`static`.}
  TYPE_BDS_CNAV2*: jint {.`static`.}
  TYPE_GAL_I*: jint {.`static`.}
  TYPE_GAL_F*: jint {.`static`.}
  TYPE_IRN_L5CA*: jint {.`static`.}
  TYPE_IRN_L5*: jint {.`static`.}
  TYPE_IRN_L1*: jint {.`static`.}
  STATUS_UNKNOWN*: jint {.`static`.}
  STATUS_PARITY_PASSED*: jint {.`static`.}
  STATUS_PARITY_REBUILT*: jint {.`static`.}
  CREATOR*: Creator[GnssNavigationMessage] {.`static`.}

jclass android.location.GnssNavigationMessage.Callback* of JVMObject:
  proc onGnssNavigationMessageReceived*(event: GnssNavigationMessage)
  proc onStatusChanged*(status: jint)

jclass android.location.Callback* of JVMObject:
  proc onGnssNavigationMessageReceived*(event: GnssNavigationMessage)
  proc onStatusChanged*(status: jint)
  STATUS_NOT_SUPPORTED*: jint {.`static`.}
  STATUS_READY*: jint {.`static`.}
  STATUS_LOCATION_DISABLED*: jint {.`static`.}

