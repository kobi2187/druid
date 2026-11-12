import jnim

jclass android.net.NetworkKey* of JVMObject:
  proc createFromScanResult*(result: ScanResult): NetworkKey {.`static`.}
  proc createFromWifiInfo*(wifiInfo: WifiInfo): NetworkKey {.`static`.}
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  TYPE_WIFI*: jint {.`static`.}
  typ*: jint
  wifiKey*: WifiKey
  CREATOR*: Parcelable.Creator[NetworkKey] {.`static`.}

