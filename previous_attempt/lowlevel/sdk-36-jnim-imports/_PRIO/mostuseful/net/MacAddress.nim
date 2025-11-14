import jnim

jclass android.net.MacAddress* of JVMObject:
  proc getAddressType*(): jint
  proc isLocallyAssigned*(): jboolean
  proc toByteArray*(): seq[jbyte]
  proc toString*(): string
  proc toOuiString*(): string
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc writeToParcel*(output:Parcel, flags: jint)
  proc describeContents*(): jint
  proc isMacAddress*(addr: seq[jbyte]): jboolean {.`static`.}
  proc macAddressType*(addr: seq[jbyte]): jint {.`static`.}
  proc byteAddrFromStringAddr*(addr: string): seq[jbyte] {.`static`.}
  proc stringAddrFromByteAddr*(addr: seq[jbyte]): string {.`static`.}
  proc fromString*(addr: string): MacAddress {.`static`.}
  proc fromBytes*(addr: seq[jbyte]): MacAddress {.`static`.}
  proc createRandomUnicastAddressWithGoogleBase*(): MacAddress {.`static`.}
  proc matches*(baseAddress: MacAddress, mask: MacAddress): jboolean
  proc getLinkLocalIpv6FromEui48Mac*(): Inet6Address
  BROADCAST_ADDRESS*: MacAddress {.`static`.}
  ALL_ZEROS_ADDRESS*: MacAddress {.`static`.}
  TYPE_UNKNOWN*: jint {.`static`.}
  TYPE_UNICAST*: jint {.`static`.}
  TYPE_MULTICAST*: jint {.`static`.}
  TYPE_BROADCAST*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[MacAddress] {.`static`.}

