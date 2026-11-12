import jnim

jclass android.net.L2capNetworkSpecifier* of NetworkSpecifier:
  proc getRole*(): jint
  proc getHeaderCompression*(): jint
  proc getRemoteAddress*(): MacAddress
  proc getPsm*(): jint
  proc isValidServerReservationSpecifier*(): jboolean
  proc isValidClientRequestSpecifier*(): jboolean
  proc canBeSatisfiedBy*(other: NetworkSpecifier): jboolean
  proc redact*(): NetworkSpecifier
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  ROLE_ANY*: jint {.`static`.}
  ROLE_CLIENT*: jint {.`static`.}
  ROLE_SERVER*: jint {.`static`.}
  HEADER_COMPRESSION_ANY*: jint {.`static`.}
  HEADER_COMPRESSION_NONE*: jint {.`static`.}
  HEADER_COMPRESSION_6LOWPAN*: jint {.`static`.}
  PSM_ANY*: jint {.`static`.}
  CREATOR*: Creator[L2capNetworkSpecifier] {.`static`.}

jclass android.net.L2capNetworkSpecifier.Builder* of JVMObject:
  proc setRole*(role: jint): Builder
  proc setHeaderCompression*(headerCompression: jint): Builder
  proc setRemoteAddress*(remoteAddress: MacAddress): Builder
  proc setPsm*(psm: jint): Builder
  proc build*(): L2capNetworkSpecifier

jclass android.net.Builder* of JVMObject:
  proc setRole*(role: jint): Builder
  proc setHeaderCompression*(headerCompression: jint): Builder
  proc setRemoteAddress*(remoteAddress: MacAddress): Builder
  proc setPsm*(psm: jint): Builder
  proc build*(): L2capNetworkSpecifier

