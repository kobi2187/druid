import jnim

jclass android.os.BatteryStatsManager* of JVMObject:
  proc getBatteryUsageStats*(): BatteryUsageStats
  proc getBatteryUsageStats*(query: BatteryUsageStatsQuery): BatteryUsageStats
  proc getBatteryUsageStats*(queries: List[BatteryUsageStatsQuery]): List[BatteryUsageStats]
  proc reportWifiRssiChanged*(newRssi: jint)
  proc reportWifiOn*()
  proc reportWifiOff*()
  proc reportWifiState*(newWifiState: jint, accessPoint: string)
  proc reportWifiScanStartedFromSource*(ws: WorkSource)
  proc reportWifiScanStoppedFromSource*(ws: WorkSource)
  proc reportWifiBatchedScanStartedFromSource*(ws: WorkSource, csph: jint)
  proc reportWifiBatchedScanStoppedFromSource*(ws: WorkSource)
  proc getCellularBatteryStats*(): CellularBatteryStats
  proc getWifiBatteryStats*(): WifiBatteryStats
  proc getWakeLockStats*(): WakeLockStats
  proc getBluetoothBatteryStats*(): BluetoothBatteryStats
  proc reportFullWifiLockAcquiredFromSource*(ws: WorkSource)
  proc reportFullWifiLockReleasedFromSource*(ws: WorkSource)
  proc reportWifiSupplicantStateChanged*(newSupplState: jint, failedAuth: jboolean)
  proc reportWifiMulticastEnabled*(ws: WorkSource)
  proc reportWifiMulticastDisabled*(ws: WorkSource)
  proc reportMobileRadioPowerState*(isActive: jboolean, uid: jint)
  proc reportWifiRadioPowerState*(isActive: jboolean, uid: jint)
  proc reportNetworkInterfaceForTransports*(iface: string, transportTypes: seq[jint])
  proc reportBluetoothOn*(uid: jint, reason: jint, packageName: string)
  proc reportBluetoothOff*(uid: jint, reason: jint, packageName: string)
  proc reportBleScanStarted*(ws: WorkSource, isUnoptimized: jboolean)
  proc reportBleScanStopped*(ws: WorkSource, isUnoptimized: jboolean)
  proc reportBleScanReset*()
  proc reportBleScanResults*(ws: WorkSource, numNewResults: jint)
  proc setChargerAcOnline*(online: jboolean, forceUpdate: jboolean)
  proc setBatteryLevel*(level: jint, forceUpdate: jboolean)
  proc unplugBattery*(forceUpdate: jboolean)
  proc resetBattery*(forceUpdate: jboolean)
  proc suspendBatteryInput*()
  WIFI_STATE_OFF*: jint {.`static`.}
  WIFI_STATE_OFF_SCANNING*: jint {.`static`.}
  WIFI_STATE_ON_NO_NETWORKS*: jint {.`static`.}
  WIFI_STATE_ON_DISCONNECTED*: jint {.`static`.}
  WIFI_STATE_ON_CONNECTED_STA*: jint {.`static`.}
  WIFI_STATE_ON_CONNECTED_P2P*: jint {.`static`.}
  WIFI_STATE_ON_CONNECTED_STA_P2P*: jint {.`static`.}
  WIFI_STATE_SOFT_AP*: jint {.`static`.}
  NUM_WIFI_STATES*: jint {.`static`.}
  WIFI_SUPPL_STATE_INVALID*: jint {.`static`.}
  WIFI_SUPPL_STATE_DISCONNECTED*: jint {.`static`.}
  WIFI_SUPPL_STATE_INTERFACE_DISABLED*: jint {.`static`.}
  WIFI_SUPPL_STATE_INACTIVE*: jint {.`static`.}
  WIFI_SUPPL_STATE_SCANNING*: jint {.`static`.}
  WIFI_SUPPL_STATE_AUTHENTICATING*: jint {.`static`.}
  WIFI_SUPPL_STATE_ASSOCIATING*: jint {.`static`.}
  WIFI_SUPPL_STATE_ASSOCIATED*: jint {.`static`.}
  WIFI_SUPPL_STATE_FOUR_WAY_HANDSHAKE*: jint {.`static`.}
  WIFI_SUPPL_STATE_GROUP_HANDSHAKE*: jint {.`static`.}
  WIFI_SUPPL_STATE_COMPLETED*: jint {.`static`.}
  WIFI_SUPPL_STATE_DORMANT*: jint {.`static`.}
  WIFI_SUPPL_STATE_UNINITIALIZED*: jint {.`static`.}
  NUM_WIFI_SUPPL_STATES*: jint {.`static`.}

