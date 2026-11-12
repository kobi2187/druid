## Is there a network, and what kind.
##
## ```nim
## if connectivity().isConnected and not connectivity().isMetered: syncPhotos()
## connectivity().startMonitoring()   # then ekConnectivity events / latestNetwork()
## ```
##
## On the desktop: the simulated network (Wi-Fi by default; `simulator().setNetwork`).

import std/[options]
import bridge, events, simulator

type
  Connectivity* = object
  NetworkType* = enum
    ntNone = "none", ntWifi = "wifi", ntCellular = "cellular", ntEthernet = "ethernet",
    ntBluetooth = "bluetooth", ntVpn = "vpn", ntOther = "other"

proc connectivity*(): Connectivity = discard

proc parseNetworkType*(s: string): NetworkType =
  for t in NetworkType:
    if $t == s: return t
  ntOther

proc isConnected*(_: Connectivity): bool =
  ## Whether the default network offers internet.
  bridged(simNetwork().connected): callStatic(bool, "Connectivity", "isConnected")
proc networkType*(_: Connectivity): NetworkType =
  parseNetworkType(bridged((if simNetwork().connected: simNetwork().kind else: "none"),
                           callStatic(string, "Connectivity", "networkType")))
proc isMetered*(_: Connectivity): bool =
  ## Whether data may cost money (mobile data, a hotspot).
  bridged(simNetwork().metered): callStatic(bool, "Connectivity", "isMetered")

proc startMonitoring*(_: Connectivity) =
  ## Report changes of the default network as `ekConnectivity` events.
  if druidStarted(): callStatic(void, "Connectivity", "startMonitoring")
  else: simSetMonitoring(true)
proc stopMonitoring*(_: Connectivity) =
  if druidStarted(): callStatic(void, "Connectivity", "stopMonitoring")
  else: simSetMonitoring(false)
proc isMonitoring*(_: Connectivity): bool =
  bridged(simMonitoring()): callStatic(bool, "Connectivity", "isMonitoring")

proc latest*(_: Connectivity): Option[tuple[networkType: NetworkType, connected, metered: bool]] =
  ## The last change monitoring reported (none before the first).
  let n = latestNetwork()
  if n.isSome: some((parseNetworkType(n.get.networkType), n.get.connected, n.get.metered))
  else: none(tuple[networkType: NetworkType, connected, metered: bool])
