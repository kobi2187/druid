import jnim

jclass android.os.BatteryManagerInternal* of JVMObject:
  proc isPowered*(plugTypeSet: jint): jboolean
  proc getPlugType*(): jint
  proc getBatteryLevel*(): jint
  proc getBatteryHealth*(): jint
  proc getBatteryChargeCounter*(): jint
  proc getBatteryFullCharge*(): jint
  proc getBatteryLevelLow*(): jboolean
  proc registerChargingPolicyChangeListener*(chargingPolicyChangeListener: ChargingPolicyChangeListener)
  proc getChargingPolicy*(): jint
  proc getInvalidCharger*(): jint
  proc setChargerAcOnline*(online: jboolean, forceUpdate: jboolean)
  proc setBatteryLevel*(level: jint, forceUpdate: jboolean)
  proc unplugBattery*(forceUpdate: jboolean)
  proc resetBattery*(forceUpdate: jboolean)
  proc suspendBatteryInput*()

