import jnim

jclass android.net.IpSecTransform* of JVMObject:
  proc equals*(other: JObject): jboolean
  proc close*()
  proc getResourceId*(): jint
  proc requestIpSecTransformState*(executor: Executor, callback: OutcomeReceiver[IpSecTransformState, RuntimeException])
  proc toString*(): string
  MODE_TRANSPORT*: jint {.`static`.}
  MODE_TUNNEL*: jint {.`static`.}
  ENCAP_NONE*: jint {.`static`.}
  ENCAP_ESPINUDP_NON_IKE*: jint {.`static`.}
  ENCAP_ESPINUDP*: jint {.`static`.}

jclass android.net.IpSecTransform.NattKeepaliveCallback* of JVMObject:
  proc onStarted*()
  proc onStopped*()
  proc onError*(error: jint)

jclass android.net.IpSecTransform.Builder* of JVMObject:
  proc setEncryption*(algo: IpSecAlgorithm): IpSecTransform.Builder
  proc setAuthentication*(algo: IpSecAlgorithm): IpSecTransform.Builder
  proc setAuthenticatedEncryption*(algo: IpSecAlgorithm): IpSecTransform.Builder
  proc setIpv4Encapsulation*(localSocket: IpSecManager.UdpEncapsulationSocket, remotePort: jint): IpSecTransform.Builder
  proc buildTransportModeTransform*(sourceAddress: InetAddress, spi: IpSecManager.SecurityParameterIndex): IpSecTransform
  proc buildTunnelModeTransform*(sourceAddress: InetAddress, spi: IpSecManager.SecurityParameterIndex): IpSecTransform

jclass android.net.NattKeepaliveCallback* of JVMObject:
  proc onStarted*()
  proc onStopped*()
  proc onError*(error: jint)
  ERROR_INVALID_NETWORK*: jint {.`static`.}
  ERROR_HARDWARE_UNSUPPORTED*: jint {.`static`.}
  ERROR_HARDWARE_ERROR*: jint {.`static`.}

jclass android.net.Builder* of JVMObject:
  proc setEncryption*(algo: IpSecAlgorithm): IpSecTransform.Builder
  proc setAuthentication*(algo: IpSecAlgorithm): IpSecTransform.Builder
  proc setAuthenticatedEncryption*(algo: IpSecAlgorithm): IpSecTransform.Builder
  proc setIpv4Encapsulation*(localSocket: IpSecManager.UdpEncapsulationSocket, remotePort: jint): IpSecTransform.Builder
  proc buildTransportModeTransform*(sourceAddress: InetAddress, spi: IpSecManager.SecurityParameterIndex): IpSecTransform
  proc buildTunnelModeTransform*(sourceAddress: InetAddress, spi: IpSecManager.SecurityParameterIndex): IpSecTransform

