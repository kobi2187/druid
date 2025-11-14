import jnim

jclass android.net.IpSecManager* of JVMObject:
  proc allocateSecurityParameterIndex*(destinationAddress: InetAddress): SecurityParameterIndex
  proc allocateSecurityParameterIndex*(destinationAddress: InetAddress, requestedSpi: jint): SecurityParameterIndex
  proc applyTransportModeTransform*(socket: Socket, direction: jint, transform: IpSecTransform)
  proc applyTransportModeTransform*(socket: DatagramSocket, direction: jint, transform: IpSecTransform)
  proc applyTransportModeTransform*(socket: FileDescriptor, direction: jint, transform: IpSecTransform)
  proc removeTransportModeTransforms*(socket: Socket)
  proc removeTransportModeTransforms*(socket: DatagramSocket)
  proc removeTransportModeTransforms*(socket: FileDescriptor)
  proc removeTunnelModeTransform*(net: Network, transform: IpSecTransform)
  proc openUdpEncapsulationSocket*(port: jint): UdpEncapsulationSocket
  proc openUdpEncapsulationSocket*(): UdpEncapsulationSocket
  proc createIpSecTunnelInterface*(localAddress: InetAddress, remoteAddress: InetAddress, underlyingNetwork: Network): IpSecTunnelInterface
  proc applyTunnelModeTransform*(tunnel: IpSecTunnelInterface, direction: jint, transform: IpSecTransform)
  proc startTunnelModeTransformMigration*(transform: IpSecTransform, newSourceAddress: InetAddress, newDestinationAddress: InetAddress)
  proc createTransform*(config: IpSecConfig, binder: IBinder, callingPackage: string): IpSecTransformResponse
  proc deleteTransform*(resourceId: jint)
  proc getTransformState*(transformId: jint): IpSecTransformState
  FEATURE_IPSEC_TUNNEL_MIGRATION*: string {.`static`.}
  DIRECTION_IN*: jint {.`static`.}
  DIRECTION_OUT*: jint {.`static`.}
  DIRECTION_FWD*: jint {.`static`.}
  INVALID_SECURITY_PARAMETER_INDEX*: jint {.`static`.}
  INVALID_RESOURCE_ID*: jint {.`static`.}

jclass android.net.IpSecManager.SpiUnavailableException* of JVMObject:
  proc getSpi*(): jint

jclass android.net.IpSecManager.SecurityParameterIndex* of JVMObject:
  proc getSpi*(): jint
  proc close*()
  proc getResourceId*(): jint
  proc toString*(): string

jclass android.net.IpSecManager.UdpEncapsulationSocket* of JVMObject:
  proc getFileDescriptor*(): FileDescriptor
  proc getPort*(): jint
  proc close*()
  proc getResourceId*(): jint
  proc toString*(): string

jclass android.net.IpSecManager.IpSecTunnelInterface* of JVMObject:
  proc getInterfaceName*(): string
  proc addAddress*(address: InetAddress, prefixLen: jint)
  proc removeAddress*(address: InetAddress, prefixLen: jint)
  proc setUnderlyingNetwork*(underlyingNetwork: Network)
  proc close*()
  proc getResourceId*(): jint
  proc toString*(): string


jclass android.net.SpiUnavailableException* of AndroidException:
  proc getSpi*(): jint

jclass android.net.ResourceUnavailableException* of AndroidException:

jclass android.net.SecurityParameterIndex* of JVMObject:
  proc getSpi*(): jint
  proc close*()
  proc getResourceId*(): jint
  proc toString*(): string

jclass android.net.UdpEncapsulationSocket* of JVMObject:
  proc getFileDescriptor*(): FileDescriptor
  proc getPort*(): jint
  proc close*()
  proc getResourceId*(): jint
  proc toString*(): string

jclass android.net.IpSecTunnelInterface* of JVMObject:
  proc getInterfaceName*(): string
  proc addAddress*(address: InetAddress, prefixLen: jint)
  proc removeAddress*(address: InetAddress, prefixLen: jint)
  proc setUnderlyingNetwork*(underlyingNetwork: Network)
  proc close*()
  proc getResourceId*(): jint
  proc toString*(): string

