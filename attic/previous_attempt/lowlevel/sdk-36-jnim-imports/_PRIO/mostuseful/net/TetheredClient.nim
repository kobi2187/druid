import jnim

jclass android.net.TetheredClient* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getMacAddress*(): MacAddress
  proc getAddresses*(): List[AddressInfo]
  proc getTetheringType*(): jint
  proc addAddresses*(other: TetheredClient): TetheredClient
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc describeContents*(): jint
  proc toString*(): string
  CREATOR*: Creator[TetheredClient] {.`static`.}

jclass android.net.TetheredClient.AddressInfo* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getAddress*(): LinkAddress
  proc getHostname*(): string
  proc getExpirationTime*(): jlong
  proc describeContents*(): jint
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc toString*(): string

jclass android.net.AddressInfo* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getAddress*(): LinkAddress
  proc getHostname*(): string
  proc getExpirationTime*(): jlong
  proc describeContents*(): jint
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc toString*(): string
  CREATOR*: Creator[AddressInfo] {.`static`.}

