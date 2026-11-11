import jnim

jclass android.companion.WifiDeviceFilter* of JVMObject:
  proc matches*(device: ScanResult): jboolean
  proc getDeviceDisplayName*(device: ScanResult): string
  proc getMediumType*(): jint
  proc getNamePattern*(): Pattern
  proc getBssid*(): MacAddress
  proc getBssidMask*(): MacAddress
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[WifiDeviceFilter] {.`static`.}

jclass android.companion.WifiDeviceFilter.Builder* of JVMObject:
  proc setNamePattern*(value: Pattern): Builder
  proc setBssid*(value: MacAddress): Builder
  proc setBssidMask*(value: MacAddress): Builder
  proc build*(): WifiDeviceFilter

jclass android.companion.Builder* of JVMObject:
  proc setNamePattern*(value: Pattern): Builder
  proc setBssid*(value: MacAddress): Builder
  proc setBssidMask*(value: MacAddress): Builder
  proc build*(): WifiDeviceFilter

