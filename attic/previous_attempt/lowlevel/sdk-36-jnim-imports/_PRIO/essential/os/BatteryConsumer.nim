import jnim

jclass android.os.BatteryConsumer* of JVMObject:
  proc getPowerComponentName*(powerComponent: jint): string
  proc getConsumedPower*(): jdouble
  proc getConsumedPower*(dimensions: Dimensions): jdouble
  proc getUsageDurationMillis*(dimensions: Dimensions): jlong
  proc getPowerComponentIds*(): seq[jint]
  proc getKeys*(componentId: jint): seq[Key]
  proc getKey*(componentId: jint): Key
  proc getKey*(componentId: jint, processState: jint): Key
  proc getConsumedPower*(componentId: jint): jdouble
  proc getConsumedPower*(key: Key): jdouble
  proc getPowerModel*(componentId: jint): jint
  proc getPowerModel*(key: BatteryConsumer.Key): jint
  proc getConsumedPowerForCustomComponent*(componentId: jint): jdouble
  proc getCustomPowerComponentCount*(): jint
  proc getCustomPowerComponentName*(componentId: jint): string
  proc getUsageDurationMillis*(componentId: jint): jlong
  proc getUsageDurationMillis*(key: Key): jlong
  proc powerComponentIdToString*(componentId: jint): string {.`static`.}
  proc powerModelToProtoEnum*(powerModel: jint): jint {.`static`.}
  proc processStateToString*(processState: jint): string {.`static`.}
  proc powerStateToString*(powerState: jint): string {.`static`.}
  proc screenStateToString*(screenState: jint): string {.`static`.}
  proc dump*(pw: PrintWriter)
  proc dump*(pw: PrintWriter, skipEmptyComponents: jboolean)
  POWER_COMPONENT_ANY*: jint {.`static`.}
  POWER_COMPONENT_SCREEN*: jint {.`static`.}
  POWER_COMPONENT_CPU*: jint {.`static`.}
  POWER_COMPONENT_BLUETOOTH*: jint {.`static`.}
  POWER_COMPONENT_CAMERA*: jint {.`static`.}
  POWER_COMPONENT_AUDIO*: jint {.`static`.}
  POWER_COMPONENT_VIDEO*: jint {.`static`.}
  POWER_COMPONENT_FLASHLIGHT*: jint {.`static`.}
  POWER_COMPONENT_SYSTEM_SERVICES*: jint {.`static`.}
  POWER_COMPONENT_MOBILE_RADIO*: jint {.`static`.}
  POWER_COMPONENT_SENSORS*: jint {.`static`.}
  POWER_COMPONENT_GNSS*: jint {.`static`.}
  POWER_COMPONENT_WIFI*: jint {.`static`.}
  POWER_COMPONENT_WAKELOCK*: jint {.`static`.}
  POWER_COMPONENT_MEMORY*: jint {.`static`.}
  POWER_COMPONENT_PHONE*: jint {.`static`.}
  POWER_COMPONENT_AMBIENT_DISPLAY*: jint {.`static`.}
  POWER_COMPONENT_IDLE*: jint {.`static`.}
  POWER_COMPONENT_REATTRIBUTED_TO_OTHER_CONSUMERS*: jint {.`static`.}
  POWER_COMPONENT_BASE*: jint {.`static`.}
  POWER_COMPONENT_COUNT*: jint {.`static`.}
  FIRST_CUSTOM_POWER_COMPONENT_ID*: jint {.`static`.}
  LAST_CUSTOM_POWER_COMPONENT_ID*: jint {.`static`.}
  POWER_MODEL_UNDEFINED*: jint {.`static`.}
  POWER_MODEL_POWER_PROFILE*: jint {.`static`.}
  POWER_MODEL_ENERGY_CONSUMPTION*: jint {.`static`.}
  PROCESS_STATE_ANY*: jint {.`static`.}
  PROCESS_STATE_UNSPECIFIED*: jint {.`static`.}
  PROCESS_STATE_FOREGROUND*: jint {.`static`.}
  PROCESS_STATE_BACKGROUND*: jint {.`static`.}
  PROCESS_STATE_FOREGROUND_SERVICE*: jint {.`static`.}
  PROCESS_STATE_CACHED*: jint {.`static`.}
  PROCESS_STATE_COUNT*: jint {.`static`.}
  SCREEN_STATE_ANY*: jint {.`static`.}
  SCREEN_STATE_UNSPECIFIED*: jint {.`static`.}
  SCREEN_STATE_ON*: jint {.`static`.}
  SCREEN_STATE_OTHER*: jint {.`static`.}
  SCREEN_STATE_COUNT*: jint {.`static`.}
  POWER_STATE_ANY*: jint {.`static`.}
  POWER_STATE_UNSPECIFIED*: jint {.`static`.}
  POWER_STATE_BATTERY*: jint {.`static`.}
  POWER_STATE_OTHER*: jint {.`static`.}
  POWER_STATE_COUNT*: jint {.`static`.}
  UNSPECIFIED_DIMENSIONS*: Dimensions {.`static`.}

jclass android.os.BatteryConsumer.Dimensions* of JVMObject:
  proc toString*(): string

jclass android.os.BatteryConsumer.Key* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(powerComponent: jint, processState: jint, screenState: jint, powerState: jint): string {.`static`.}
  proc toString*(): string

jclass android.os.Dimensions* of JVMObject:
  proc toString*(): string
  powerComponentId*: jint
  processState*: jint
  screenState*: jint
  powerState*: jint

jclass android.os.Key* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(powerComponent: jint, processState: jint, screenState: jint, powerState: jint): string {.`static`.}
  proc toString*(): string
  powerComponentId*: jint
  processState*: jint
  screenState*: jint
  powerState*: jint

