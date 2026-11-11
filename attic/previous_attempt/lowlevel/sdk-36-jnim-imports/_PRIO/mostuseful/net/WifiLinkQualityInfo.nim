import jnim

jclass android.net.WifiLinkQualityInfo* of LinkQualityInfo:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc createFromParcelBody*(in: Parcel): WifiLinkQualityInfo {.`static`.}
  proc getType*(): jint
  proc setType*(type: jint)
  proc getBssid*(): string
  proc setBssid*(bssid: string)
  proc getRssi*(): jint
  proc setRssi*(rssi: jint)
  proc getTxGood*(): jlong
  proc setTxGood*(txGood: jlong)
  proc getTxBad*(): jlong
  proc setTxBad*(txBad: jlong)

