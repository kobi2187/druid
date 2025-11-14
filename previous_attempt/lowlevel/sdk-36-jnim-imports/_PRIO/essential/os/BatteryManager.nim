import jnim

jclass android.os.BatteryManager* of JVMObject:
  proc isAdaptiveChargingPolicy*(policy: jint): jboolean {.`static`.}
  proc isCharging*(): jboolean
  proc getIntProperty*(id: jint): jint
  proc getLongProperty*(id: jint): jlong
  proc getStringProperty*(id: jint): string
  proc isPlugWired*(plugType: jint): jboolean {.`static`.}
  proc computeChargeTimeRemaining*(): jlong
  proc setChargingStateUpdateDelayMillis*(delayMillis: jint): jboolean
  EXTRA_STATUS*: string {.`static`.}
  EXTRA_HEALTH*: string {.`static`.}
  EXTRA_PRESENT*: string {.`static`.}
  EXTRA_LEVEL*: string {.`static`.}
  EXTRA_BATTERY_LOW*: string {.`static`.}
  EXTRA_SCALE*: string {.`static`.}
  EXTRA_ICON_SMALL*: string {.`static`.}
  EXTRA_PLUGGED*: string {.`static`.}
  EXTRA_VOLTAGE*: string {.`static`.}
  EXTRA_TEMPERATURE*: string {.`static`.}
  EXTRA_TECHNOLOGY*: string {.`static`.}
  EXTRA_INVALID_CHARGER*: string {.`static`.}
  EXTRA_MAX_CHARGING_CURRENT*: string {.`static`.}
  EXTRA_MAX_CHARGING_VOLTAGE*: string {.`static`.}
  EXTRA_CHARGE_COUNTER*: string {.`static`.}
  EXTRA_SEQUENCE*: string {.`static`.}
  EXTRA_CYCLE_COUNT*: string {.`static`.}
  EXTRA_CHARGING_STATUS*: string {.`static`.}
  BATTERY_CAPACITY_LEVEL_UNSUPPORTED*: jint {.`static`.}
  BATTERY_CAPACITY_LEVEL_UNKNOWN*: jint {.`static`.}
  BATTERY_CAPACITY_LEVEL_CRITICAL*: jint {.`static`.}
  BATTERY_CAPACITY_LEVEL_LOW*: jint {.`static`.}
  BATTERY_CAPACITY_LEVEL_NORMAL*: jint {.`static`.}
  BATTERY_CAPACITY_LEVEL_HIGH*: jint {.`static`.}
  BATTERY_CAPACITY_LEVEL_FULL*: jint {.`static`.}
  EXTRA_CAPACITY_LEVEL*: string {.`static`.}
  EXTRA_EVENTS*: string {.`static`.}
  EXTRA_EVENT_TIMESTAMP*: string {.`static`.}
  BATTERY_STATUS_UNKNOWN*: jint {.`static`.}
  BATTERY_STATUS_CHARGING*: jint {.`static`.}
  BATTERY_STATUS_DISCHARGING*: jint {.`static`.}
  BATTERY_STATUS_NOT_CHARGING*: jint {.`static`.}
  BATTERY_STATUS_FULL*: jint {.`static`.}
  BATTERY_HEALTH_UNKNOWN*: jint {.`static`.}
  BATTERY_HEALTH_GOOD*: jint {.`static`.}
  BATTERY_HEALTH_OVERHEAT*: jint {.`static`.}
  BATTERY_HEALTH_DEAD*: jint {.`static`.}
  BATTERY_HEALTH_OVER_VOLTAGE*: jint {.`static`.}
  BATTERY_HEALTH_UNSPECIFIED_FAILURE*: jint {.`static`.}
  BATTERY_HEALTH_COLD*: jint {.`static`.}
  BATTERY_PLUGGED_AC*: jint {.`static`.}
  BATTERY_PLUGGED_USB*: jint {.`static`.}
  BATTERY_PLUGGED_WIRELESS*: jint {.`static`.}
  BATTERY_PLUGGED_DOCK*: jint {.`static`.}
  CHARGING_POLICY_DEFAULT*: jint {.`static`.}
  CHARGING_POLICY_ADAPTIVE_AON*: jint {.`static`.}
  CHARGING_POLICY_ADAPTIVE_AC*: jint {.`static`.}
  CHARGING_POLICY_ADAPTIVE_LONGLIFE*: jint {.`static`.}
  PART_STATUS_UNSUPPORTED*: jint {.`static`.}
  PART_STATUS_ORIGINAL*: jint {.`static`.}
  PART_STATUS_REPLACED*: jint {.`static`.}
  BATTERY_PLUGGED_ANY*: jint {.`static`.}
  ACTION_CHARGING*: string {.`static`.}
  ACTION_DISCHARGING*: string {.`static`.}
  BATTERY_PROPERTY_CHARGE_COUNTER*: jint {.`static`.}
  BATTERY_PROPERTY_CURRENT_NOW*: jint {.`static`.}
  BATTERY_PROPERTY_CURRENT_AVERAGE*: jint {.`static`.}
  BATTERY_PROPERTY_CAPACITY*: jint {.`static`.}
  BATTERY_PROPERTY_ENERGY_COUNTER*: jint {.`static`.}
  BATTERY_PROPERTY_STATUS*: jint {.`static`.}
  BATTERY_PROPERTY_MANUFACTURING_DATE*: jint {.`static`.}
  BATTERY_PROPERTY_FIRST_USAGE_DATE*: jint {.`static`.}
  BATTERY_PROPERTY_CHARGING_POLICY*: jint {.`static`.}
  BATTERY_PROPERTY_STATE_OF_HEALTH*: jint {.`static`.}
  BATTERY_PROPERTY_SERIAL_NUMBER*: jint {.`static`.}
  BATTERY_PROPERTY_PART_STATUS*: jint {.`static`.}

