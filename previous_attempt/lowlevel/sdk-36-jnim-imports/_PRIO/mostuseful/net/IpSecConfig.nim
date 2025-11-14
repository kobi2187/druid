import jnim

jclass android.net.IpSecConfig* of JVMObject:
  proc setMode*(mode: jint)
  proc setSourceAddress*(sourceAddress: string)
  proc setDestinationAddress*(destinationAddress: string)
  proc setSpiResourceId*(resourceId: jint)
  proc setEncryption*(encryption: IpSecAlgorithm)
  proc setAuthentication*(authentication: IpSecAlgorithm)
  proc setAuthenticatedEncryption*(authenticatedEncryption: IpSecAlgorithm)
  proc setNetwork*(network: Network)
  proc setEncapType*(encapType: jint)
  proc setEncapSocketResourceId*(resourceId: jint)
  proc setEncapRemotePort*(port: jint)
  proc setNattKeepaliveInterval*(interval: jint)
  proc setMarkValue*(mark: jint)
  proc setMarkMask*(mask: jint)
  proc setXfrmInterfaceId*(xfrmInterfaceId: jint)
  proc getMode*(): jint
  proc getSourceAddress*(): string
  proc getSpiResourceId*(): jint
  proc getDestinationAddress*(): string
  proc getEncryption*(): IpSecAlgorithm
  proc getAuthentication*(): IpSecAlgorithm
  proc getAuthenticatedEncryption*(): IpSecAlgorithm
  proc getNetwork*(): Network
  proc getEncapType*(): jint
  proc getEncapSocketResourceId*(): jint
  proc getEncapRemotePort*(): jint
  proc getNattKeepaliveInterval*(): jint
  proc getMarkValue*(): jint
  proc getMarkMask*(): jint
  proc getXfrmInterfaceId*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc toString*(): string
  proc equals*(other: JObject): jboolean
  CREATOR*: Parcelable.Creator[IpSecConfig] {.`static`.}

