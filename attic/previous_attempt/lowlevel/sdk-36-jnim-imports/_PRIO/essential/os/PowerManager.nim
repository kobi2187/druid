import jnim

jclass android.os.PowerManager* of JVMObject:
  proc userActivityEventToString*(userActivityEvent: jint): string {.`static`.}
  proc sleepReasonToString*(sleepReason: jint): string {.`static`.}
  proc wakeReasonToString*(wakeReason: jint): string {.`static`.}
  proc locationPowerSaveModeToString*(mode: jint): string {.`static`.}
  proc getMinimumScreenBrightnessSetting*(): jint
  proc getMaximumScreenBrightnessSetting*(): jint
  proc getDefaultScreenBrightnessSetting*(): jint
  proc getBrightnessConstraint*(constraint: jint): jfloat
  proc getBrightnessConstraint*(displayId: jint, constraint: jint): jfloat
  proc newWakeLock*(levelAndFlags: jint, tag: string): WakeLock
  proc newWakeLock*(levelAndFlags: jint, tag: string, displayId: jint): WakeLock
  proc validateWakeLockParameters*(levelAndFlags: jint, tag: string) {.`static`.}
  proc userActivity*(when: jlong, noChangeLights: jboolean)
  proc userActivity*(when: jlong, event: jint, flags: jint)
  proc goToSleep*(time: jlong)
  proc goToSleep*(time: jlong, reason: jint, flags: jint)
  proc goToSleep*(displayId: jint, time: jlong, reason: jint, flags: jint)
  proc wakeUp*(time: jlong)
  proc wakeUp*(time: jlong, details: string)
  proc wakeUp*(time: jlong, reason: jint, details: string)
  proc wakeUp*(time: jlong, reason: jint, details: string, displayId: jint)
  proc nap*(time: jlong)
  proc dream*(time: jlong)
  proc boostScreenBrightness*(time: jlong)
  proc addScreenTimeoutPolicyListener*(displayId: jint, executor: Executor, listener: ScreenTimeoutPolicyListener)
  proc removeScreenTimeoutPolicyListener*(displayId: jint, listener: ScreenTimeoutPolicyListener)
  proc isWakeLockLevelSupported*(level: jint): jboolean
  proc isScreenOn*(): jboolean
  proc isInteractive*(): jboolean
  proc isInteractive*(displayId: jint): jboolean
  proc isRebootingUserspaceSupportedImpl*(): jboolean {.`static`.}
  proc isRebootingUserspaceSupported*(): jboolean
  proc reboot*(reason: string)
  proc rebootSafeMode*()
  proc areAutoPowerSaveModesEnabled*(): jboolean
  proc isPowerSaveMode*(): jboolean
  proc setPowerSaveModeEnabled*(mode: jboolean): jboolean
  proc isBatterySaverSupported*(): jboolean
  proc getFullPowerSavePolicy*(): BatterySaverPolicyConfig
  proc setFullPowerSavePolicy*(config: BatterySaverPolicyConfig): jboolean
  proc setDynamicPowerSaveHint*(powerSaveHint: jboolean, disableThreshold: jint): jboolean
  proc setAdaptivePowerSavePolicy*(config: BatterySaverPolicyConfig): jboolean
  proc setAdaptivePowerSaveEnabled*(enabled: jboolean): jboolean
  proc getPowerSaveModeTrigger*(): jint
  proc setBatteryDischargePrediction*(timeRemaining: Duration, isPersonalized: jboolean)
  proc getBatteryDischargePrediction*(): Duration
  proc isBatteryDischargePredictionPersonalized*(): jboolean
  proc getPowerSaveState*(serviceType: jint): PowerSaveState
  proc getLocationPowerSaveMode*(): jint
  proc getSoundTriggerPowerSaveMode*(): jint
  proc isDeviceIdleMode*(): jboolean
  proc isDeviceLightIdleMode*(): jboolean
  proc isLightDeviceIdleMode*(): jboolean
  proc isLowPowerStandbySupported*(): jboolean
  proc isLowPowerStandbyEnabled*(): jboolean
  proc setLowPowerStandbyEnabled*(enabled: jboolean)
  proc setLowPowerStandbyActiveDuringMaintenance*(activeDuringMaintenance: jboolean)
  proc forceLowPowerStandbyActive*(active: jboolean)
  proc setLowPowerStandbyPolicy*(policy: LowPowerStandbyPolicy)
  proc getLowPowerStandbyPolicy*(): LowPowerStandbyPolicy
  proc isExemptFromLowPowerStandby*(): jboolean
  proc isAllowedInLowPowerStandby*(reason: jint): jboolean
  proc isAllowedInLowPowerStandby*(feature: string): jboolean
  proc newLowPowerStandbyPortsLock*(ports: List[LowPowerStandbyPortDescription]): LowPowerStandbyPortsLock
  proc getActiveLowPowerStandbyPorts*(): List[LowPowerStandbyPortDescription]
  proc isIgnoringBatteryOptimizations*(packageName: string): jboolean
  proc shutdown*(confirm: jboolean, reason: string, wait: jboolean)
  proc isSustainedPerformanceModeSupported*(): jboolean
  proc getCurrentThermalStatus*(): jint
  proc addThermalStatusListener*(listener: OnThermalStatusChangedListener)
  proc addThermalStatusListener*(executor: Executor, listener: OnThermalStatusChangedListener)
  proc removeThermalStatusListener*(listener: OnThermalStatusChangedListener)
  proc addThermalHeadroomListener*(listener: OnThermalHeadroomChangedListener)
  proc addThermalHeadroomListener*(executor: Executor, listener: OnThermalHeadroomChangedListener)
  proc removeThermalHeadroomListener*(listener: OnThermalHeadroomChangedListener)
  proc getThermalHeadroom*(forecastSeconds: jint): jfloat
  proc getThermalHeadroomThresholds*(): Map[Integer, Float]
  proc setDozeAfterScreenOff*(dozeAfterScreenOf: jboolean)
  proc isAmbientDisplayAvailable*(): jboolean
  proc suppressAmbientDisplay*(token: string, suppress: jboolean)
  proc isAmbientDisplaySuppressedForToken*(token: string): jboolean
  proc isAmbientDisplaySuppressed*(): jboolean
  proc isAmbientDisplaySuppressedForTokenByApp*(token: string, appUid: jint): jboolean
  proc getLastShutdownReason*(): jint
  proc getLastSleepReason*(): jint
  proc forceSuspend*(): jboolean
  proc lowPowerStandbyAllowedReasonsToString*(allowedReasons: jint): string {.`static`.}
  proc invalidatePowerSaveModeCaches*() {.`static`.}
  proc invalidateIsInteractiveCaches*() {.`static`.}
  PARTIAL_WAKE_LOCK*: jint {.`static`.}
  SCREEN_DIM_WAKE_LOCK*: jint {.`static`.}
  SCREEN_BRIGHT_WAKE_LOCK*: jint {.`static`.}
  FULL_WAKE_LOCK*: jint {.`static`.}
  PROXIMITY_SCREEN_OFF_WAKE_LOCK*: jint {.`static`.}
  DOZE_WAKE_LOCK*: jint {.`static`.}
  DRAW_WAKE_LOCK*: jint {.`static`.}
  SCREEN_TIMEOUT_OVERRIDE_WAKE_LOCK*: jint {.`static`.}
  WAKE_LOCK_LEVEL_MASK*: jint {.`static`.}
  ACQUIRE_CAUSES_WAKEUP*: jint {.`static`.}
  ON_AFTER_RELEASE*: jint {.`static`.}
  UNIMPORTANT_FOR_LOGGING*: jint {.`static`.}
  SYSTEM_WAKELOCK*: jint {.`static`.}
  RELEASE_FLAG_WAIT_FOR_NO_PROXIMITY*: jint {.`static`.}
  RELEASE_FLAG_TIMEOUT*: jint {.`static`.}
  BRIGHTNESS_ON*: jint {.`static`.}
  BRIGHTNESS_OFF*: jint {.`static`.}
  BRIGHTNESS_DEFAULT*: jint {.`static`.}
  BRIGHTNESS_INVALID*: jint {.`static`.}
  BRIGHTNESS_MAX*: jfloat {.`static`.}
  BRIGHTNESS_MIN*: jfloat {.`static`.}
  BRIGHTNESS_OFF_FLOAT*: jfloat {.`static`.}
  BRIGHTNESS_INVALID_FLOAT*: jfloat {.`static`.}
  USER_ACTIVITY_EVENT_OTHER*: jint {.`static`.}
  USER_ACTIVITY_EVENT_BUTTON*: jint {.`static`.}
  USER_ACTIVITY_EVENT_TOUCH*: jint {.`static`.}
  USER_ACTIVITY_EVENT_ACCESSIBILITY*: jint {.`static`.}
  USER_ACTIVITY_EVENT_ATTENTION*: jint {.`static`.}
  USER_ACTIVITY_EVENT_FACE_DOWN*: jint {.`static`.}
  USER_ACTIVITY_EVENT_DEVICE_STATE*: jint {.`static`.}
  USER_ACTIVITY_FLAG_NO_CHANGE_LIGHTS*: jint {.`static`.}
  USER_ACTIVITY_FLAG_INDIRECT*: jint {.`static`.}
  GO_TO_SLEEP_REASON_MIN*: jint {.`static`.}
  GO_TO_SLEEP_REASON_APPLICATION*: jint {.`static`.}
  GO_TO_SLEEP_REASON_DEVICE_ADMIN*: jint {.`static`.}
  GO_TO_SLEEP_REASON_TIMEOUT*: jint {.`static`.}
  GO_TO_SLEEP_REASON_LID_SWITCH*: jint {.`static`.}
  GO_TO_SLEEP_REASON_POWER_BUTTON*: jint {.`static`.}
  GO_TO_SLEEP_REASON_HDMI*: jint {.`static`.}
  GO_TO_SLEEP_REASON_SLEEP_BUTTON*: jint {.`static`.}
  GO_TO_SLEEP_REASON_ACCESSIBILITY*: jint {.`static`.}
  GO_TO_SLEEP_REASON_FORCE_SUSPEND*: jint {.`static`.}
  GO_TO_SLEEP_REASON_INATTENTIVE*: jint {.`static`.}
  GO_TO_SLEEP_REASON_QUIESCENT*: jint {.`static`.}
  GO_TO_SLEEP_REASON_DISPLAY_GROUP_REMOVED*: jint {.`static`.}
  GO_TO_SLEEP_REASON_DISPLAY_GROUPS_TURNED_OFF*: jint {.`static`.}
  GO_TO_SLEEP_REASON_DEVICE_FOLD*: jint {.`static`.}
  GO_TO_SLEEP_REASON_UNKNOWN*: jint {.`static`.}
  GO_TO_SLEEP_REASON_MAX*: jint {.`static`.}
  GO_TO_SLEEP_FLAG_NO_DOZE*: jint {.`static`.}
  GO_TO_SLEEP_FLAG_SOFT_SLEEP*: jint {.`static`.}
  BRIGHTNESS_CONSTRAINT_TYPE_MINIMUM*: jint {.`static`.}
  BRIGHTNESS_CONSTRAINT_TYPE_MAXIMUM*: jint {.`static`.}
  BRIGHTNESS_CONSTRAINT_TYPE_DEFAULT*: jint {.`static`.}
  BRIGHTNESS_CONSTRAINT_TYPE_DIM*: jint {.`static`.}
  WAKE_REASON_UNKNOWN*: jint {.`static`.}
  WAKE_REASON_POWER_BUTTON*: jint {.`static`.}
  WAKE_REASON_APPLICATION*: jint {.`static`.}
  WAKE_REASON_PLUGGED_IN*: jint {.`static`.}
  WAKE_REASON_GESTURE*: jint {.`static`.}
  WAKE_REASON_CAMERA_LAUNCH*: jint {.`static`.}
  WAKE_REASON_WAKE_KEY*: jint {.`static`.}
  WAKE_REASON_WAKE_MOTION*: jint {.`static`.}
  WAKE_REASON_HDMI*: jint {.`static`.}
  WAKE_REASON_LID*: jint {.`static`.}
  WAKE_REASON_DISPLAY_GROUP_ADDED*: jint {.`static`.}
  WAKE_REASON_DISPLAY_GROUP_TURNED_ON*: jint {.`static`.}
  WAKE_REASON_UNFOLD_DEVICE*: jint {.`static`.}
  WAKE_REASON_DREAM_FINISHED*: jint {.`static`.}
  WAKE_REASON_TILT*: jint {.`static`.}
  WAKE_REASON_TAP*: jint {.`static`.}
  WAKE_REASON_LIFT*: jint {.`static`.}
  WAKE_REASON_BIOMETRIC*: jint {.`static`.}
  WAKE_REASON_DOCK*: jint {.`static`.}
  REBOOT_RECOVERY*: string {.`static`.}
  REBOOT_RECOVERY_UPDATE*: string {.`static`.}
  REBOOT_REQUESTED_BY_DEVICE_OWNER*: string {.`static`.}
  REBOOT_SAFE_MODE*: string {.`static`.}
  REBOOT_USERSPACE*: string {.`static`.}
  REBOOT_QUIESCENT*: string {.`static`.}
  SHUTDOWN_USER_REQUESTED*: string {.`static`.}
  SHUTDOWN_BATTERY_THERMAL_STATE*: string {.`static`.}
  SHUTDOWN_THERMAL_STATE*: string {.`static`.}
  SHUTDOWN_LOW_BATTERY*: string {.`static`.}
  SHUTDOWN_REASON_UNKNOWN*: jint {.`static`.}
  SHUTDOWN_REASON_SHUTDOWN*: jint {.`static`.}
  SHUTDOWN_REASON_REBOOT*: jint {.`static`.}
  SHUTDOWN_REASON_USER_REQUESTED*: jint {.`static`.}
  SHUTDOWN_REASON_THERMAL_SHUTDOWN*: jint {.`static`.}
  SHUTDOWN_REASON_LOW_BATTERY*: jint {.`static`.}
  SHUTDOWN_REASON_BATTERY_THERMAL*: jint {.`static`.}
  SCREEN_TIMEOUT_ACTIVE*: jint {.`static`.}
  SCREEN_TIMEOUT_KEEP_DISPLAY_ON*: jint {.`static`.}
  LOCATION_MODE_NO_CHANGE*: jint {.`static`.}
  LOCATION_MODE_GPS_DISABLED_WHEN_SCREEN_OFF*: jint {.`static`.}
  LOCATION_MODE_ALL_DISABLED_WHEN_SCREEN_OFF*: jint {.`static`.}
  LOCATION_MODE_FOREGROUND_ONLY*: jint {.`static`.}
  LOCATION_MODE_THROTTLE_REQUESTS_WHEN_SCREEN_OFF*: jint {.`static`.}
  MIN_LOCATION_MODE*: jint {.`static`.}
  MAX_LOCATION_MODE*: jint {.`static`.}
  SOUND_TRIGGER_MODE_ALL_ENABLED*: jint {.`static`.}
  SOUND_TRIGGER_MODE_CRITICAL_ONLY*: jint {.`static`.}
  SOUND_TRIGGER_MODE_ALL_DISABLED*: jint {.`static`.}
  MIN_SOUND_TRIGGER_MODE*: jint {.`static`.}
  MAX_SOUND_TRIGGER_MODE*: jint {.`static`.}
  POWER_SAVE_MODE_TRIGGER_PERCENTAGE*: jint {.`static`.}
  POWER_SAVE_MODE_TRIGGER_DYNAMIC*: jint {.`static`.}
  THERMAL_STATUS_NONE*: jint {.`static`.}
  THERMAL_STATUS_LIGHT*: jint {.`static`.}
  THERMAL_STATUS_MODERATE*: jint {.`static`.}
  THERMAL_STATUS_SEVERE*: jint {.`static`.}
  THERMAL_STATUS_CRITICAL*: jint {.`static`.}
  THERMAL_STATUS_EMERGENCY*: jint {.`static`.}
  THERMAL_STATUS_SHUTDOWN*: jint {.`static`.}
  ACTION_ENHANCED_DISCHARGE_PREDICTION_CHANGED*: string {.`static`.}
  ACTION_POWER_SAVE_MODE_CHANGED*: string {.`static`.}
  ACTION_POWER_SAVE_MODE_CHANGED_INTERNAL*: string {.`static`.}
  ACTION_DEVICE_IDLE_MODE_CHANGED*: string {.`static`.}
  ACTION_DEVICE_LIGHT_IDLE_MODE_CHANGED*: string {.`static`.}
  ACTION_LIGHT_DEVICE_IDLE_MODE_CHANGED*: string {.`static`.}
  ACTION_POWER_SAVE_WHITELIST_CHANGED*: string {.`static`.}
  ACTION_POWER_SAVE_TEMP_WHITELIST_CHANGED*: string {.`static`.}
  ACTION_LOW_POWER_STANDBY_ENABLED_CHANGED*: string {.`static`.}
  ACTION_LOW_POWER_STANDBY_POLICY_CHANGED*: string {.`static`.}
  ACTION_LOW_POWER_STANDBY_PORTS_CHANGED*: string {.`static`.}
  FEATURE_WAKE_ON_LAN_IN_LOW_POWER_STANDBY*: string {.`static`.}
  LOW_POWER_STANDBY_ALLOWED_REASON_VOICE_INTERACTION*: jint {.`static`.}
  LOW_POWER_STANDBY_ALLOWED_REASON_TEMP_POWER_SAVE_ALLOWLIST*: jint {.`static`.}
  LOW_POWER_STANDBY_ALLOWED_REASON_ONGOING_CALL*: jint {.`static`.}

jclass android.os.PowerManager.WakeData* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint

jclass android.os.PowerManager.SleepData* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint

jclass android.os.PowerManager.LowPowerStandbyPolicy* of JVMObject:
  proc getIdentifier*(): string
  proc getExemptPackages*(): Set[string]
  proc getAllowedReasons*(): jint
  proc getAllowedFeatures*(): Set[string]
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toParcelable*(policy: LowPowerStandbyPolicy): IPowerManager.LowPowerStandbyPolicy {.`static`.}
  proc fromParcelable*(parcelablePolicy: IPowerManager.LowPowerStandbyPolicy): LowPowerStandbyPolicy {.`static`.}

jclass android.os.PowerManager.LowPowerStandbyPortDescription* of JVMObject:
  proc getProtocol*(): jint
  proc getPortMatcher*(): jint
  proc getPortNumber*(): jint
  proc getLocalAddress*(): InetAddress
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toParcelable*(portDescription: LowPowerStandbyPortDescription): IPowerManager.LowPowerStandbyPortDescription {.`static`.}
  proc toParcelable*(portDescriptions: List[LowPowerStandbyPortDescription]): List[IPowerManager.LowPowerStandbyPortDescription] {.`static`.}
  proc fromParcelable*(parcelablePortDescription: IPowerManager.LowPowerStandbyPortDescription): LowPowerStandbyPortDescription {.`static`.}
  proc fromParcelable*(portDescriptions: List[IPowerManager.LowPowerStandbyPortDescription]): List[LowPowerStandbyPortDescription] {.`static`.}

jclass android.os.PowerManager.LowPowerStandbyPortsLock* of JVMObject:
  proc acquire*()
  proc release*()

jclass android.os.PowerManager.WakeLock* of JVMObject:
  proc setReferenceCounted*(value: jboolean)
  proc acquire*()
  proc acquire*(timeout: jlong)
  proc release*()
  proc release*(flags: jint)
  proc isHeld*(): jboolean
  proc setWorkSource*(ws: WorkSource)
  proc setTag*(tag: string)
  proc getTag*(): string
  proc setHistoryTag*(tag: string)
  proc setUnimportantForLogging*(state: jboolean)
  proc updateUids*(uids: seq[jint])
  proc toString*(): string
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  proc wrap*(r: Runnable): Runnable
  proc setStateListener*(executor: Executor, listener: WakeLockStateListener)

jclass android.os.WakeData* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  wakeTime*: jlong
  wakeReason*: jint
  sleepDurationRealtime*: jlong

jclass android.os.SleepData* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  goToSleepUptimeMillis*: jlong
  goToSleepReason*: jint



jclass android.os.LowPowerStandbyPolicy* of JVMObject:
  proc getIdentifier*(): string
  proc getExemptPackages*(): Set[string]
  proc getAllowedReasons*(): jint
  proc getAllowedFeatures*(): Set[string]
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toParcelable*(policy: LowPowerStandbyPolicy): IPowerManager.LowPowerStandbyPolicy {.`static`.}
  proc fromParcelable*(parcelablePolicy: IPowerManager.LowPowerStandbyPolicy): LowPowerStandbyPolicy {.`static`.}

jclass android.os.LowPowerStandbyPortDescription* of JVMObject:
  proc getProtocol*(): jint
  proc getPortMatcher*(): jint
  proc getPortNumber*(): jint
  proc getLocalAddress*(): InetAddress
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toParcelable*(portDescription: LowPowerStandbyPortDescription): IPowerManager.LowPowerStandbyPortDescription {.`static`.}
  proc toParcelable*(portDescriptions: List[LowPowerStandbyPortDescription]): List[IPowerManager.LowPowerStandbyPortDescription] {.`static`.}
  proc fromParcelable*(parcelablePortDescription: IPowerManager.LowPowerStandbyPortDescription): LowPowerStandbyPortDescription {.`static`.}
  proc fromParcelable*(portDescriptions: List[IPowerManager.LowPowerStandbyPortDescription]): List[LowPowerStandbyPortDescription] {.`static`.}
  PROTOCOL_TCP*: jint {.`static`.}
  PROTOCOL_UDP*: jint {.`static`.}
  MATCH_PORT_LOCAL*: jint {.`static`.}
  MATCH_PORT_REMOTE*: jint {.`static`.}

jclass android.os.LowPowerStandbyPortsLock* of JVMObject:
  proc acquire*()
  proc release*()



jclass android.os.WakeLock* of JVMObject:
  proc setReferenceCounted*(value: jboolean)
  proc acquire*()
  proc acquire*(timeout: jlong)
  proc release*()
  proc release*(flags: jint)
  proc isHeld*(): jboolean
  proc setWorkSource*(ws: WorkSource)
  proc setTag*(tag: string)
  proc getTag*(): string
  proc setHistoryTag*(tag: string)
  proc setUnimportantForLogging*(state: jboolean)
  proc updateUids*(uids: seq[jint])
  proc toString*(): string
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  proc wrap*(r: Runnable): Runnable
  proc setStateListener*(executor: Executor, listener: WakeLockStateListener)

