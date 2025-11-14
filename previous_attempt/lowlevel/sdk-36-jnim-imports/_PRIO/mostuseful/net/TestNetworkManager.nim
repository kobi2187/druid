import jnim

jclass android.net.TestNetworkManager* of JVMObject:
  proc teardownTestNetwork*(network: Network)
  proc setupTestNetwork*(lp: LinkProperties, isMetered: jboolean, binder: IBinder)
  proc setupTestNetwork*(iface: string, binder: IBinder)
  proc setupTestNetwork*(iface: string, administratorUids: seq[jint], binder: IBinder)
  proc createTunInterface*(linkAddrs: seq[LinkAddress]): TestNetworkInterface
  proc createTunInterface*(linkAddrs: Collection[LinkAddress]): TestNetworkInterface
  proc createTapInterface*(): TestNetworkInterface
  proc createTapInterface*(bringUp: jboolean, iface: string): TestNetworkInterface
  proc createTapInterface*(carrierUp: jboolean, bringUp: jboolean, disableIpv6ProvisioningDelay: jboolean): TestNetworkInterface
  proc setCarrierEnabled*(iface: TestNetworkInterface, enabled: jboolean)
  proc createTestInterface*(request: TestInterfaceRequest): TestNetworkInterface
  TEST_TUN_PREFIX*: string {.`static`.}
  TEST_TAP_PREFIX*: string {.`static`.}
  CLAT_INTERFACE_PREFIX*: string {.`static`.}

jclass android.net.TestInterfaceRequest* of JVMObject:
  isTun*: jboolean
  hasCarrier*: jboolean
  bringUp*: jboolean
  disableIpv6ProvDelay*: jboolean
  ifname*: string
  linkAddresses*: LinkAddress

jclass android.net.TestInterfaceRequest.Builder* of JVMObject:
  proc setTun*(): Builder
  proc setTap*(): Builder
  proc setHasCarrier*(hasCarrier: jboolean): Builder
  proc setBringUp*(bringUp: jboolean): Builder
  proc setDisableIpv6ProvisioningDelay*(disableProvDelay: jboolean): Builder
  proc setInterfaceName*(ifname: string): Builder
  proc addLinkAddress*(la: LinkAddress): Builder
  proc build*(): TestInterfaceRequest

jclass android.net.Builder* of JVMObject:
  proc setTun*(): Builder
  proc setTap*(): Builder
  proc setHasCarrier*(hasCarrier: jboolean): Builder
  proc setBringUp*(bringUp: jboolean): Builder
  proc setDisableIpv6ProvisioningDelay*(disableProvDelay: jboolean): Builder
  proc setInterfaceName*(ifname: string): Builder
  proc addLinkAddress*(la: LinkAddress): Builder
  proc build*(): TestInterfaceRequest

