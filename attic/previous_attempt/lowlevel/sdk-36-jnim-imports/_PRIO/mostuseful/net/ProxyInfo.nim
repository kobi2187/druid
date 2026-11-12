import jnim

jclass android.net.ProxyInfo* of JVMObject:
  proc buildDirectProxy*(host: string, port: jint): ProxyInfo {.`static`.}
  proc buildDirectProxy*(host: string, port: jint, exclList: List[string]): ProxyInfo {.`static`.}
  proc buildPacProxy*(pacUri: Uri): ProxyInfo {.`static`.}
  proc buildPacProxy*(pacUrl: Uri, port: jint): ProxyInfo {.`static`.}
  proc getSocketAddress*(): InetSocketAddress
  proc getPacFileUrl*(): Uri
  proc getHost*(): string
  proc getPort*(): jint
  proc getExclusionList*(): seq[string]
  proc getExclusionListAsString*(): string
  proc isValid*(): jboolean
  proc makeProxy*(): java.net.Proxy
  proc isPacProxy*(): jboolean
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc describeContents*(): jint
  proc hashCode*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  LOCAL_EXCL_LIST*: string {.`static`.}
  LOCAL_PORT*: jint {.`static`.}
  LOCAL_HOST*: string {.`static`.}
  CREATOR*: Creator[ProxyInfo] {.`static`.}

