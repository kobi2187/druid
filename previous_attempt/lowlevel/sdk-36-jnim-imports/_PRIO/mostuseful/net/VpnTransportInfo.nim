import jnim

jclass android.net.VpnTransportInfo* of JVMObject:
  proc getApplicableRedactions*(): jlong
  proc makeCopy*(redactions: jlong): VpnTransportInfo
  proc isBypassable*(): jboolean
  proc areLongLivedTcpConnectionsExpensive*(): jboolean
  proc getSessionId*(): string
  proc getType*(): jint
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[VpnTransportInfo] {.`static`.}

