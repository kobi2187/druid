import jnim

jclass android.net.MobileLinkQualityInfo* of LinkQualityInfo:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc createFromParcelBody*(in: Parcel): MobileLinkQualityInfo {.`static`.}
  proc getMobileNetworkType*(): jint
  proc setMobileNetworkType*(mobileNetworkType: jint)
  proc getRssi*(): jint
  proc setRssi*(Rssi: jint)
  proc getGsmErrorRate*(): jint
  proc setGsmErrorRate*(gsmErrorRate: jint)
  proc getCdmaDbm*(): jint
  proc setCdmaDbm*(cdmaDbm: jint)
  proc getCdmaEcio*(): jint
  proc setCdmaEcio*(cdmaEcio: jint)
  proc getEvdoDbm*(): jint
  proc setEvdoDbm*(evdoDbm: jint)
  proc getEvdoEcio*(): jint
  proc setEvdoEcio*(evdoEcio: jint)
  proc getEvdoSnr*(): jint
  proc setEvdoSnr*(evdoSnr: jint)
  proc getLteSignalStrength*(): jint
  proc setLteSignalStrength*(lteSignalStrength: jint)
  proc getLteRsrp*(): jint
  proc setLteRsrp*(lteRsrp: jint)
  proc getLteRsrq*(): jint
  proc setLteRsrq*(lteRsrq: jint)
  proc getLteRssnr*(): jint
  proc setLteRssnr*(lteRssnr: jint)
  proc getLteCqi*(): jint
  proc setLteCqi*(lteCqi: jint)

