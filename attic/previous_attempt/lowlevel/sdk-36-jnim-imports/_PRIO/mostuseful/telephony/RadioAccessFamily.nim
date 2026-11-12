import jnim

jclass android.telephony.RadioAccessFamily* of JVMObject:
  proc getPhoneId*(): jint
  proc getRadioAccessFamily*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(outParcel: Parcel, flags: jint)
  proc getRafFromNetworkType*(type: jint): jint {.`static`.}
  proc getNetworkTypeFromRaf*(raf: jint): jint {.`static`.}
  proc singleRafTypeFromString*(rafString: string): jint {.`static`.}
  proc rafTypeFromString*(rafList: string): jint {.`static`.}
  proc compare*(networkTypeBitmaskL: jlong, networkTypeBitmaskR: jlong): jint {.`static`.}
  RAF_UNKNOWN*: jint {.`static`.}
  RAF_GSM*: jint {.`static`.}
  RAF_GPRS*: jint {.`static`.}
  RAF_EDGE*: jint {.`static`.}
  RAF_IS95A*: jint {.`static`.}
  RAF_IS95B*: jint {.`static`.}
  RAF_1xRTT*: jint {.`static`.}
  RAF_EVDO_0*: jint {.`static`.}
  RAF_EVDO_A*: jint {.`static`.}
  RAF_EVDO_B*: jint {.`static`.}
  RAF_EHRPD*: jint {.`static`.}
  RAF_HSUPA*: jint {.`static`.}
  RAF_HSDPA*: jint {.`static`.}
  RAF_HSPA*: jint {.`static`.}
  RAF_HSPAP*: jint {.`static`.}
  RAF_UMTS*: jint {.`static`.}
  RAF_TD_SCDMA*: jint {.`static`.}
  RAF_LTE*: jint {.`static`.}
  RAF_LTE_CA*: jint {.`static`.}
  RAF_NR*: jint {.`static`.}
  CREATOR*: Creator[android.telephony.RadioAccessFamily] {.`static`.}

