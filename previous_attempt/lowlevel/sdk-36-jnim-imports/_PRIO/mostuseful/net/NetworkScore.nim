import jnim

jclass android.net.NetworkScore* of JVMObject:
  proc getLegacyInt*(): jint
  proc getKeepConnectedReason*(): jint
  proc hasPolicy*(policy: jint): jboolean
  proc getPolicies*(): jlong
  proc shouldYieldToBadWifi*(): jboolean
  proc isTransportPrimary*(): jboolean
  proc isExiting*(): jboolean
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  KEEP_CONNECTED_NONE*: jint {.`static`.}
  KEEP_CONNECTED_FOR_HANDOVER*: jint {.`static`.}
  KEEP_CONNECTED_FOR_TEST*: jint {.`static`.}
  KEEP_CONNECTED_LOCAL_NETWORK*: jint {.`static`.}
  POLICY_YIELD_TO_BAD_WIFI*: jint {.`static`.}
  POLICY_TRANSPORT_PRIMARY*: jint {.`static`.}
  POLICY_EXITING*: jint {.`static`.}
  MIN_AGENT_MANAGED_POLICY*: jint {.`static`.}
  MAX_AGENT_MANAGED_POLICY*: jint {.`static`.}
  CREATOR*: Creator[NetworkScore] {.`static`.}

jclass android.net.NetworkScore.Builder* of JVMObject:
  proc setLegacyInt*(score: jint): Builder
  proc setShouldYieldToBadWifi*(val: jboolean): Builder
  proc setTransportPrimary*(val: jboolean): Builder
  proc setExiting*(val: jboolean): Builder
  proc setKeepConnectedReason*(reason: jint): Builder
  proc build*(): NetworkScore

jclass android.net.Builder* of JVMObject:
  proc setLegacyInt*(score: jint): Builder
  proc setShouldYieldToBadWifi*(val: jboolean): Builder
  proc setTransportPrimary*(val: jboolean): Builder
  proc setExiting*(val: jboolean): Builder
  proc setKeepConnectedReason*(reason: jint): Builder
  proc build*(): NetworkScore

