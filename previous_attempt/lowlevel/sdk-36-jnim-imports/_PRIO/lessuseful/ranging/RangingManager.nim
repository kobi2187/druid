import jnim

jclass android.ranging.RangingManager* of JVMObject:
  proc registerCapabilitiesCallback*(executor: Executor, callback: RangingCapabilitiesCallback)
  proc unregisterCapabilitiesCallback*(callback: RangingCapabilitiesCallback)
  proc createRangingSession*(executor: Executor, callback: RangingSession.Callback): RangingSession
  UWB*: jint {.`static`.}
  BLE_CS*: jint {.`static`.}
  WIFI_NAN_RTT*: jint {.`static`.}
  BLE_RSSI*: jint {.`static`.}

