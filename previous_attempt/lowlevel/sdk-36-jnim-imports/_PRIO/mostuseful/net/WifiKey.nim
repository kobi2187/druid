import jnim

jclass android.net.WifiKey* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  ssid*: string
  bssid*: string
  CREATOR*: Creator[WifiKey] {.`static`.}

