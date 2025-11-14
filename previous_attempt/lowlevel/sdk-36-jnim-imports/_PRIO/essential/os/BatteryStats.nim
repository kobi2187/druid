import jnim

jclass android.os.BatteryStats* of JVMObject:
  proc mapToInternalProcessState*(procState: jint): jint {.`static`.}
  proc mapUidProcessStateToBatteryConsumerProcessState*(processState: jint): jint {.`static`.}
  proc isProcessStateDataAvailable*(): jboolean
  proc getDailyItemLocked*(daysAgo: jint): DailyItem
  proc getCurrentDailyStartTime*(): jlong
  proc getNextMinDailyDeadline*(): jlong
  proc getNextMaxDailyDeadline*(): jlong
  proc getCpuScalingPolicies*(): CpuScalingPolicies
  proc commitCurrentHistoryBatchLocked*()
  proc getHistoryTotalSize*(): jint
  proc getHistoryUsedSize*(): jint
  proc getHistoryStringPoolSize*(): jint
  proc getHistoryStringPoolBytes*(): jint
  proc getHistoryTagPoolString*(index: jint): string
  proc getHistoryTagPoolUid*(index: jint): jint
  proc iterateBatteryStatsHistory*(startTimeMs: jlong, endTimeMs: jlong): BatteryStatsHistoryIterator
  proc getStartCount*(): jint
  proc getScreenOnTime*(elapsedRealtimeUs: jlong, which: jint): jlong
  proc getScreenOnCount*(which: jint): jint
  proc getScreenDozeTime*(elapsedRealtimeUs: jlong, which: jint): jlong
  proc getScreenDozeCount*(which: jint): jint
  proc getInteractiveTime*(elapsedRealtimeUs: jlong, which: jint): jlong
  proc getScreenBrightnessTime*(brightnessBin: jint, elapsedRealtimeUs: jlong, which: jint): jlong
  proc getScreenBrightnessTimer*(brightnessBin: jint): Timer
  proc getDisplayCount*(): jint
  proc getDisplayScreenOnTime*(display: jint, elapsedRealtimeUs: jlong): jlong
  proc getDisplayScreenDozeTime*(display: jint, elapsedRealtimeUs: jlong): jlong
  proc getDisplayScreenBrightnessTime*(display: jint, brightnessBin: jint, elapsedRealtimeUs: jlong): jlong
  proc getPowerSaveModeEnabledTime*(elapsedRealtimeUs: jlong, which: jint): jlong
  proc getPowerSaveModeEnabledCount*(which: jint): jint
  proc getDeviceIdleModeTime*(mode: jint, elapsedRealtimeUs: jlong, which: jint): jlong
  proc getDeviceIdleModeCount*(mode: jint, which: jint): jint
  proc getLongestDeviceIdleModeTime*(mode: jint): jlong
  proc getDeviceIdlingTime*(mode: jint, elapsedRealtimeUs: jlong, which: jint): jlong
  proc getDeviceIdlingCount*(mode: jint, which: jint): jint
  proc getNumConnectivityChange*(which: jint): jint
  proc getGpsSignalQualityTime*(strengthBin: jint, elapsedRealtimeUs: jlong, which: jint): jlong
  proc getGpsBatteryDrainMaMs*(): jlong
  proc getPhoneOnTime*(elapsedRealtimeUs: jlong, which: jint): jlong
  proc getPhoneOnCount*(which: jint): jint
  proc getPhoneSignalStrengthTime*(strengthBin: jint, elapsedRealtimeUs: jlong, which: jint): jlong
  proc getPhoneSignalScanningTime*(elapsedRealtimeUs: jlong, which: jint): jlong
  proc getPhoneSignalScanningTimer*(): Timer
  proc getPhoneSignalStrengthCount*(strengthBin: jint, which: jint): jint
  proc getMobileRadioActiveTime*(elapsedRealtimeUs: jlong, which: jint): jlong
  proc getMobileRadioActiveCount*(which: jint): jint
  proc getMobileRadioActiveAdjustedTime*(which: jint): jlong
  proc getMobileRadioActiveUnknownTime*(which: jint): jlong
  proc getMobileRadioActiveUnknownCount*(which: jint): jint
  proc getAllNetworkTypesCount*(): jint {.`static`.}
  proc getAllNetworkTypesCount$ravenwood*(): jint {.`static`.}
  proc getPhoneDataConnectionTime*(dataType: jint, elapsedRealtimeUs: jlong, which: jint): jlong
  proc getPhoneDataConnectionCount*(dataType: jint, which: jint): jint
  proc getPhoneDataConnectionTimer*(dataType: jint): Timer
  proc getNrNsaTime*(elapsedRealtimeUs: jlong): jlong
  proc getActiveRadioDurationMs*(rat: jint, frequencyRange: jint, signalStrength: jint, elapsedRealtimeMs: jlong): jlong
  proc getActiveTxRadioDurationMs*(rat: jint, frequencyRange: jint, signalStrength: jint, elapsedRealtimeMs: jlong): jlong
  proc getActiveRxRadioDurationMs*(rat: jint, frequencyRange: jint, elapsedRealtimeMs: jlong): jlong
  proc getBluetoothEnergyConsumptionUC*(): jlong
  proc getCpuEnergyConsumptionUC*(): jlong
  proc getGnssEnergyConsumptionUC*(): jlong
  proc getMobileRadioEnergyConsumptionUC*(): jlong
  proc getPhoneEnergyConsumptionUC*(): jlong
  proc getScreenOnEnergyConsumptionUC*(): jlong
  proc getScreenDozeEnergyConsumptionUC*(): jlong
  proc getWifiEnergyConsumptionUC*(): jlong
  proc getCameraEnergyConsumptionUC*(): jlong
  proc getCustomEnergyConsumerBatteryConsumptionUC*(): seq[jlong]
  proc getCustomEnergyConsumerNames*(): seq[string]
  proc getWifiMulticastWakelockTime*(elapsedRealtimeUs: jlong, which: jint): jlong
  proc getWifiMulticastWakelockCount*(which: jint): jint
  proc getWifiOnTime*(elapsedRealtimeUs: jlong, which: jint): jlong
  proc getWifiActiveTime*(elapsedRealtimeUs: jlong, which: jint): jlong
  proc getGlobalWifiRunningTime*(elapsedRealtimeUs: jlong, which: jint): jlong
  proc getWifiStateTime*(wifiState: jint, elapsedRealtimeUs: jlong, which: jint): jlong
  proc getWifiStateCount*(wifiState: jint, which: jint): jint
  proc getWifiStateTimer*(wifiState: jint): Timer
  proc getWifiSupplStateTime*(state: jint, elapsedRealtimeUs: jlong, which: jint): jlong
  proc getWifiSupplStateCount*(state: jint, which: jint): jint
  proc getWifiSupplStateTimer*(state: jint): Timer
  proc getWifiSignalStrengthTime*(strengthBin: jint, elapsedRealtimeUs: jlong, which: jint): jlong
  proc getWifiSignalStrengthCount*(strengthBin: jint, which: jint): jint
  proc getWifiSignalStrengthTimer*(strengthBin: jint): Timer
  proc getFlashlightOnTime*(elapsedRealtimeUs: jlong, which: jint): jlong
  proc getFlashlightOnCount*(which: jint): jlong
  proc getCameraOnTime*(elapsedRealtimeUs: jlong, which: jint): jlong
  proc getBluetoothScanTime*(elapsedRealtimeUs: jlong, which: jint): jlong
  proc getNetworkActivityBytes*(type: jint, which: jint): jlong
  proc getNetworkActivityPackets*(type: jint, which: jint): jlong
  proc hasWifiActivityReporting*(): jboolean
  proc getWifiControllerActivity*(): ControllerActivityCounter
  proc hasBluetoothActivityReporting*(): jboolean
  proc getBluetoothControllerActivity*(): ControllerActivityCounter
  proc hasModemActivityReporting*(): jboolean
  proc getModemControllerActivity*(): ControllerActivityCounter
  proc getStartClockTime*(): jlong
  proc getStartPlatformVersion*(): string
  proc getEndPlatformVersion*(): string
  proc getParcelVersion*(): jint
  proc getIsOnBattery*(): jboolean
  proc getStatsStartRealtime*(): jlong
  proc getUidStats*(): SparseArray[? extends Uid]
  proc getBatteryUptime*(curTime: jlong): jlong
  proc getBatteryRealtime*(curTime: jlong): jlong
  proc getDischargeStartLevel*(): jint
  proc getDischargeCurrentLevel*(): jint
  proc getLowDischargeAmountSinceCharge*(): jint
  proc getHighDischargeAmountSinceCharge*(): jint
  proc getDischargeAmount*(which: jint): jint
  proc getDischargeAmountScreenOn*(): jint
  proc getDischargeAmountScreenOnSinceCharge*(): jint
  proc getDischargeAmountScreenOff*(): jint
  proc getDischargeAmountScreenOffSinceCharge*(): jint
  proc getDischargeAmountScreenDoze*(): jint
  proc getDischargeAmountScreenDozeSinceCharge*(): jint
  proc getSystemServiceTimeAtCpuSpeeds*(): seq[jlong]
  proc computeBatteryUptime*(curTime: jlong, which: jint): jlong
  proc computeBatteryRealtime*(curTime: jlong, which: jint): jlong
  proc computeBatteryScreenOffUptime*(curTime: jlong, which: jint): jlong
  proc computeBatteryScreenOffRealtime*(curTime: jlong, which: jint): jlong
  proc computeUptime*(curTime: jlong, which: jint): jlong
  proc computeRealtime*(curTime: jlong, which: jint): jlong
  proc computeBatteryTimeRemaining*(curTime: jlong): jlong
  proc getUahDischargeScreenOff*(which: jint): jlong
  proc getUahDischargeScreenDoze*(which: jint): jlong
  proc getUahDischarge*(which: jint): jlong
  proc getUahDischargeLightDoze*(which: jint): jlong
  proc getUahDischargeDeepDoze*(which: jint): jlong
  proc getEstimatedBatteryCapacity*(): jint
  proc getMinLearnedBatteryCapacity*(): jint
  proc getMaxLearnedBatteryCapacity*(): jint
  proc getLearnedBatteryCapacity*(): jint
  proc getBatteryCapacity*(): jint
  proc getDischargeLevelStepTracker*(): LevelStepTracker
  proc getDailyDischargeLevelStepTracker*(): LevelStepTracker
  proc computeChargeTimeRemaining*(curTime: jlong): jlong
  proc getChargeLevelStepTracker*(): LevelStepTracker
  proc getDailyChargeLevelStepTracker*(): LevelStepTracker
  proc getDailyPackageChanges*(): ArrayList[PackageChange]
  proc getWakeupReasonStats*(): Map[string, ? extends Timer]
  proc getKernelWakelockStats*(): Map[string, ? extends Timer]
  proc getWakeLockStats*(): WakeLockStats
  proc getBluetoothBatteryStats*(): BluetoothBatteryStats
  proc getRpmStats*(): Map[string, ? extends Timer]
  proc getScreenOffRpmStats*(): Map[string, ? extends Timer]
  proc getKernelMemoryStats*(): LongSparseArray[? extends Timer]
  proc formatTimeMs*(sb: StringBuilder, time: jlong) {.`static`.}
  proc formatTimeMsNoSpace*(sb: StringBuilder, time: jlong) {.`static`.}
  proc formatRatioLocked*(num: jlong, den: jlong): string
  proc formatCharge*(power: jdouble): string {.`static`.}
  proc dumpCheckinLocked*(context: Context, pw: PrintWriter, which: jint, reqUid: jint, wifiOnly: jboolean, dumpHelper: BatteryStatsDumpHelper)
  proc dumpLocked*(context: Context, pw: PrintWriter, prefix: string, which: jint, reqUid: jint, wifiOnly: jboolean, dumpHelper: BatteryStatsDumpHelper)
  proc prepareForDumpLocked*()
  proc dump*(context: Context, pw: PrintWriter, flags: jint, reqUid: jint, histStart: jlong, dumpHelper: BatteryStatsDumpHelper)
  proc dumpCheckin*(context: Context, pw: PrintWriter, apps: List[ApplicationInfo], flags: jint, histStart: jlong, dumpHelper: BatteryStatsDumpHelper)
  proc dumpProtoLocked*(context: Context, fd: FileDescriptor, apps: List[ApplicationInfo], flags: jint, histStart: jlong, dumpHelper: BatteryStatsDumpHelper)
  proc checkWifiOnly*(context: Context): jboolean {.`static`.}
  SERVICE_NAME*: string {.`static`.}
  WAKE_TYPE_PARTIAL*: jint {.`static`.}
  WAKE_TYPE_FULL*: jint {.`static`.}
  WAKE_TYPE_WINDOW*: jint {.`static`.}
  SENSOR*: jint {.`static`.}
  WIFI_RUNNING*: jint {.`static`.}
  FULL_WIFI_LOCK*: jint {.`static`.}
  WIFI_SCAN*: jint {.`static`.}
  WIFI_MULTICAST_ENABLED*: jint {.`static`.}
  VIDEO_TURNED_ON*: jint {.`static`.}
  VIBRATOR_ON*: jint {.`static`.}
  FOREGROUND_ACTIVITY*: jint {.`static`.}
  WIFI_BATCHED_SCAN*: jint {.`static`.}
  PROCESS_STATE*: jint {.`static`.}
  SYNC*: jint {.`static`.}
  JOB*: jint {.`static`.}
  AUDIO_TURNED_ON*: jint {.`static`.}
  FLASHLIGHT_TURNED_ON*: jint {.`static`.}
  CAMERA_TURNED_ON*: jint {.`static`.}
  WAKE_TYPE_DRAW*: jint {.`static`.}
  BLUETOOTH_SCAN_ON*: jint {.`static`.}
  AGGREGATED_WAKE_TYPE_PARTIAL*: jint {.`static`.}
  BLUETOOTH_UNOPTIMIZED_SCAN_ON*: jint {.`static`.}
  FOREGROUND_SERVICE*: jint {.`static`.}
  WIFI_AGGREGATE_MULTICAST_ENABLED*: jint {.`static`.}
  STATS_SINCE_CHARGED*: jint {.`static`.}
  STATS_CURRENT*: jint {.`static`.}
  STATS_SINCE_UNPLUGGED*: jint {.`static`.}
  MILLISECONDS_IN_HOUR*: jdouble {.`static`.}
  RESULT_RECEIVER_CONTROLLER_KEY*: string {.`static`.}
  UID_TIMES_TYPE_ALL*: string {.`static`.}
  JOB_FRESHNESS_BUCKETS*: jlong {.`static`.}
  SCREEN_BRIGHTNESS_DARK*: jint {.`static`.}
  SCREEN_BRIGHTNESS_DIM*: jint {.`static`.}
  SCREEN_BRIGHTNESS_MEDIUM*: jint {.`static`.}
  SCREEN_BRIGHTNESS_LIGHT*: jint {.`static`.}
  SCREEN_BRIGHTNESS_BRIGHT*: jint {.`static`.}
  SCREEN_BRIGHTNESS_NAMES*: string {.`static`.}
  NUM_SCREEN_BRIGHTNESS_BINS*: jint {.`static`.}
  DEVICE_IDLE_MODE_OFF*: jint {.`static`.}
  DEVICE_IDLE_MODE_LIGHT*: jint {.`static`.}
  DEVICE_IDLE_MODE_DEEP*: jint {.`static`.}
  NUM_ALL_NETWORK_TYPES*: jint {.`static`.}
  DATA_CONNECTION_OUT_OF_SERVICE*: jint {.`static`.}
  DATA_CONNECTION_EMERGENCY_SERVICE*: jint {.`static`.}
  DATA_CONNECTION_OTHER*: jint {.`static`.}
  NUM_DATA_CONNECTION_TYPES*: jint {.`static`.}
  RADIO_ACCESS_TECHNOLOGY_OTHER*: jint {.`static`.}
  RADIO_ACCESS_TECHNOLOGY_LTE*: jint {.`static`.}
  RADIO_ACCESS_TECHNOLOGY_NR*: jint {.`static`.}
  RADIO_ACCESS_TECHNOLOGY_COUNT*: jint {.`static`.}
  RADIO_ACCESS_TECHNOLOGY_NAMES*: string {.`static`.}
  POWER_DATA_UNAVAILABLE*: jlong {.`static`.}
  DURATION_UNAVAILABLE*: jlong {.`static`.}
  HISTORY_STATE_DESCRIPTIONS*: BitDescription {.`static`.}
  HISTORY_STATE2_DESCRIPTIONS*: BitDescription {.`static`.}
  HISTORY_EVENT_NAMES*: string {.`static`.}
  HISTORY_EVENT_CHECKIN_NAMES*: string {.`static`.}
  HISTORY_EVENT_INT_FORMATTERS*: IntToString {.`static`.}
  NUM_WIFI_SIGNAL_STRENGTH_BINS*: jint {.`static`.}
  NETWORK_MOBILE_RX_DATA*: jint {.`static`.}
  NETWORK_MOBILE_TX_DATA*: jint {.`static`.}
  NETWORK_WIFI_RX_DATA*: jint {.`static`.}
  NETWORK_WIFI_TX_DATA*: jint {.`static`.}
  NETWORK_BT_RX_DATA*: jint {.`static`.}
  NETWORK_BT_TX_DATA*: jint {.`static`.}
  NETWORK_MOBILE_BG_RX_DATA*: jint {.`static`.}
  NETWORK_MOBILE_BG_TX_DATA*: jint {.`static`.}
  NETWORK_WIFI_BG_RX_DATA*: jint {.`static`.}
  NETWORK_WIFI_BG_TX_DATA*: jint {.`static`.}
  NUM_NETWORK_ACTIVITY_TYPES*: jint {.`static`.}
  STEP_LEVEL_TIME_MASK*: jlong {.`static`.}
  STEP_LEVEL_LEVEL_MASK*: jlong {.`static`.}
  STEP_LEVEL_LEVEL_SHIFT*: jint {.`static`.}
  STEP_LEVEL_INITIAL_MODE_MASK*: jlong {.`static`.}
  STEP_LEVEL_INITIAL_MODE_SHIFT*: jint {.`static`.}
  STEP_LEVEL_MODIFIED_MODE_MASK*: jlong {.`static`.}
  STEP_LEVEL_MODIFIED_MODE_SHIFT*: jint {.`static`.}
  STEP_LEVEL_MODE_SCREEN_STATE*: jint {.`static`.}
  MAX_TRACKED_SCREEN_STATE*: jint {.`static`.}
  STEP_LEVEL_MODE_POWER_SAVE*: jint {.`static`.}
  STEP_LEVEL_MODE_DEVICE_IDLE*: jint {.`static`.}
  STEP_LEVEL_MODES_OF_INTEREST*: jint {.`static`.}
  STEP_LEVEL_MODE_VALUES*: jint {.`static`.}
  STEP_LEVEL_MODE_LABELS*: string {.`static`.}
  DUMP_CHARGED_ONLY*: jint {.`static`.}
  DUMP_DAILY_ONLY*: jint {.`static`.}
  DUMP_HISTORY_ONLY*: jint {.`static`.}
  DUMP_INCLUDE_HISTORY*: jint {.`static`.}
  DUMP_VERBOSE*: jint {.`static`.}
  DUMP_DEVICE_WIFI_ONLY*: jint {.`static`.}
  DUMP_DEBUG_PERF_BASELINE*: jint {.`static`.}

jclass android.os.BatteryStats.Counter* of JVMObject:
  proc getCountLocked*(which: jint): jint
  proc logState*(pw: Printer, prefix: string)

jclass android.os.BatteryStats.LongCounter* of JVMObject:
  proc getCountLocked*(which: jint): jlong
  proc getCountForProcessState*(procState: jint): jlong
  proc logState*(pw: Printer, prefix: string)

jclass android.os.BatteryStats.LongCounterArray* of JVMObject:
  proc getCountsLocked*(which: jint): seq[jlong]
  proc logState*(pw: Printer, prefix: string)

jclass android.os.BatteryStats.ControllerActivityCounter* of JVMObject:
  proc getIdleTimeCounter*(): LongCounter
  proc getScanTimeCounter*(): LongCounter
  proc getSleepTimeCounter*(): LongCounter
  proc getRxTimeCounter*(): LongCounter
  proc getTxTimeCounters*(): seq[LongCounter]
  proc getPowerCounter*(): LongCounter
  proc getMonitoredRailChargeConsumedMaMs*(): LongCounter

jclass android.os.BatteryStats.Timer* of JVMObject:
  proc getCountLocked*(which: jint): jint
  proc getTotalTimeLocked*(elapsedRealtimeUs: jlong, which: jint): jlong
  proc getTimeSinceMarkLocked*(elapsedRealtimeUs: jlong): jlong
  proc getMaxDurationMsLocked*(elapsedRealtimeMs: jlong): jlong
  proc getCurrentDurationMsLocked*(elapsedRealtimeMs: jlong): jlong
  proc getTotalDurationMsLocked*(elapsedRealtimeMs: jlong): jlong
  proc getSubTimer*(): Timer
  proc isRunningLocked*(): jboolean
  proc logState*(pw: Printer, prefix: string)

jclass android.os.BatteryStats.Uid* of JVMObject:
  proc getWakelockStats*(): ArrayMap[string, ? extends Wakelock]
  proc getMulticastWakelockStats*(): Timer
  proc getSyncStats*(): ArrayMap[string, ? extends Timer]
  proc getJobStats*(): ArrayMap[string, ? extends Timer]
  proc getJobCompletionStats*(): ArrayMap[string, SparseIntArray]
  proc getAggregatedPartialWakelockTimer*(): Timer
  proc getSensorStats*(): SparseArray[? extends Sensor]
  proc getPidStats*(): SparseArray[? extends Pid]
  proc getProcessStats*(): ArrayMap[string, ? extends Proc]
  proc getPackageStats*(): ArrayMap[string, ? extends Pkg]
  proc getProportionalSystemServiceUsage*(): jdouble
  proc getWifiControllerActivity*(): ControllerActivityCounter
  proc getBluetoothControllerActivity*(): ControllerActivityCounter
  proc getModemControllerActivity*(): ControllerActivityCounter
  proc getUid*(): jint
  proc noteWifiRunningLocked*(elapsedRealtime: jlong)
  proc noteWifiStoppedLocked*(elapsedRealtime: jlong)
  proc noteFullWifiLockAcquiredLocked*(elapsedRealtime: jlong)
  proc noteFullWifiLockReleasedLocked*(elapsedRealtime: jlong)
  proc noteWifiScanStartedLocked*(elapsedRealtime: jlong)
  proc noteWifiScanStoppedLocked*(elapsedRealtime: jlong)
  proc noteWifiBatchedScanStartedLocked*(csph: jint, elapsedRealtime: jlong)
  proc noteWifiBatchedScanStoppedLocked*(elapsedRealtime: jlong)
  proc noteWifiMulticastEnabledLocked*(elapsedRealtime: jlong)
  proc noteWifiMulticastDisabledLocked*(elapsedRealtime: jlong)
  proc noteActivityResumedLocked*(elapsedRealtime: jlong)
  proc noteActivityPausedLocked*(elapsedRealtime: jlong)
  proc getWifiRunningTime*(elapsedRealtimeUs: jlong, which: jint): jlong
  proc getFullWifiLockTime*(elapsedRealtimeUs: jlong, which: jint): jlong
  proc getWifiScanTime*(elapsedRealtimeUs: jlong, which: jint): jlong
  proc getWifiScanCount*(which: jint): jint
  proc getWifiScanTimer*(): Timer
  proc getWifiScanBackgroundCount*(which: jint): jint
  proc getWifiScanActualTime*(elapsedRealtimeUs: jlong): jlong
  proc getWifiScanBackgroundTime*(elapsedRealtimeUs: jlong): jlong
  proc getWifiScanBackgroundTimer*(): Timer
  proc getWifiBatchedScanTime*(csphBin: jint, elapsedRealtimeUs: jlong, which: jint): jlong
  proc getWifiBatchedScanCount*(csphBin: jint, which: jint): jint
  proc getWifiMulticastTime*(elapsedRealtimeUs: jlong, which: jint): jlong
  proc getAudioTurnedOnTimer*(): Timer
  proc getVideoTurnedOnTimer*(): Timer
  proc getFlashlightTurnedOnTimer*(): Timer
  proc getCameraTurnedOnTimer*(): Timer
  proc getForegroundActivityTimer*(): Timer
  proc getForegroundServiceTimer*(): Timer
  proc getBluetoothScanTimer*(): Timer
  proc getBluetoothScanBackgroundTimer*(): Timer
  proc getBluetoothUnoptimizedScanTimer*(): Timer
  proc getBluetoothUnoptimizedScanBackgroundTimer*(): Timer
  proc getBluetoothScanResultCounter*(): Counter
  proc getBluetoothScanResultBgCounter*(): Counter
  proc getCpuFreqTimes*(which: jint): seq[jlong]
  proc getScreenOffCpuFreqTimes*(which: jint): seq[jlong]
  proc getCpuActiveTime*(): jlong
  proc getCpuActiveTime*(procState: jint): jlong
  proc getCpuClusterTimes*(): seq[jlong]
  proc getCpuFreqTimes*(timesInFreqMs: seq[jlong], procState: jint): jboolean
  proc getScreenOffCpuFreqTimes*(timesInFreqMs: seq[jlong], procState: jint): jboolean
  proc getProcessStateTime*(state: jint, elapsedRealtimeUs: jlong, which: jint): jlong
  proc getProcessStateTimer*(state: jint): Timer
  proc getVibratorOnTimer*(): Timer
  proc noteUserActivityLocked*(type: jint)
  proc hasUserActivity*(): jboolean
  proc getUserActivityCount*(type: jint, which: jint): jint
  proc hasNetworkActivity*(): jboolean
  proc getNetworkActivityBytes*(type: jint, which: jint): jlong
  proc getNetworkActivityPackets*(type: jint, which: jint): jlong
  proc getMobileRadioActiveTime*(which: jint): jlong
  proc getMobileRadioActiveTimeInProcessState*(processState: jint): jlong
  proc getMobileRadioActiveCount*(which: jint): jint
  proc getUserCpuTimeUs*(which: jint): jlong
  proc getSystemCpuTimeUs*(which: jint): jlong
  proc getTimeAtCpuSpeed*(cluster: jint, step: jint, which: jint): jlong
  proc getMobileRadioApWakeupCount*(which: jint): jlong
  proc getWifiRadioApWakeupCount*(which: jint): jlong
  proc getDeferredJobsCheckinLineLocked*(sb: StringBuilder, which: jint)
  proc getDeferredJobsLineLocked*(sb: StringBuilder, which: jint)
  proc getBluetoothEnergyConsumptionUC*(): jlong
  proc getBluetoothEnergyConsumptionUC*(processState: jint): jlong
  proc getCpuEnergyConsumptionUC*(): jlong
  proc getCpuEnergyConsumptionUC*(processState: jint): jlong
  proc getGnssEnergyConsumptionUC*(): jlong
  proc getMobileRadioEnergyConsumptionUC*(): jlong
  proc getMobileRadioEnergyConsumptionUC*(processState: jint): jlong
  proc getScreenOnEnergyConsumptionUC*(): jlong
  proc getWifiEnergyConsumptionUC*(): jlong
  proc getWifiEnergyConsumptionUC*(processState: jint): jlong
  proc getCameraEnergyConsumptionUC*(): jlong
  proc getCustomEnergyConsumerBatteryConsumptionUC*(): seq[jlong]

jclass android.os.BatteryStats.LevelStepTracker* of JVMObject:
  proc getDurationAt*(index: jint): jlong
  proc getLevelAt*(index: jint): jint
  proc getInitModeAt*(index: jint): jint
  proc getModModeAt*(index: jint): jint
  proc encodeEntryAt*(index: jint, output:StringBuilder)
  proc decodeEntryAt*(index: jint, value: string)
  proc init*()
  proc clearTime*()
  proc computeTimePerLevel*(): jlong
  proc computeTimeEstimate*(modesOfInterest: jlong, modeValues: jlong, outNumOfInterest: seq[jint]): jlong
  proc addLevelSteps*(numStepLevels: jint, modeBits: jlong, elapsedRealtime: jlong)
  proc readFromParcel*(in: Parcel)
  proc writeToParcel*(output:Parcel)

jclass android.os.BatteryStats.HistoryTag* of JVMObject:
  proc setTo*(o: HistoryTag)
  proc setTo*(_string: string, _uid: jint)
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc readFromParcel*(src: Parcel)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint

jclass android.os.BatteryStats.HistoryStepDetails* of JVMObject:
  proc clear*()
  proc writeToParcel*(output:Parcel)
  proc readFromParcel*(in: Parcel)
  proc isEmpty*(): jboolean

jclass android.os.BatteryStats.ProcessStateChange* of JVMObject:
  proc writeToParcel*(output:Parcel)
  proc readFromParcel*(in: Parcel)
  proc formatForBatteryHistory*(): string

jclass android.os.BatteryStats.HistoryItem* of JVMObject:
  proc isDeltaData*(): jboolean
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc readFromParcel*(src: Parcel)
  proc clear*()
  proc setTo*(o: HistoryItem)
  proc setTo*(time: jlong, cmd: jbyte, o: HistoryItem)
  proc sameNonEvent*(o: HistoryItem): jboolean
  proc same*(o: HistoryItem): jboolean

jclass android.os.BatteryStats.HistoryEventTracker* of JVMObject:
  proc updateState*(code: jint, name: string, uid: jint, poolIdx: jint): jboolean
  proc removeEvents*(code: jint)
  proc getStateForEvent*(code: jint): HashMap[string, SparseIntArray]

jclass android.os.BatteryStats.HistoryPrinter* of JVMObject:
  proc printNextItem*(pw: PrintWriter, rec: HistoryItem, baseTime: jlong, checkin: jboolean, verbose: jboolean)
  proc printNextItem*(proto: ProtoOutputStream, rec: HistoryItem, baseTime: jlong, verbose: jboolean)

jclass android.os.Counter* of JVMObject:
  proc getCountLocked*(which: jint): jint
  proc logState*(pw: Printer, prefix: string)

jclass android.os.LongCounter* of JVMObject:
  proc getCountLocked*(which: jint): jlong
  proc getCountForProcessState*(procState: jint): jlong
  proc logState*(pw: Printer, prefix: string)

jclass android.os.LongCounterArray* of JVMObject:
  proc getCountsLocked*(which: jint): seq[jlong]
  proc logState*(pw: Printer, prefix: string)

jclass android.os.ControllerActivityCounter* of JVMObject:
  proc getIdleTimeCounter*(): LongCounter
  proc getScanTimeCounter*(): LongCounter
  proc getSleepTimeCounter*(): LongCounter
  proc getRxTimeCounter*(): LongCounter
  proc getTxTimeCounters*(): seq[LongCounter]
  proc getPowerCounter*(): LongCounter
  proc getMonitoredRailChargeConsumedMaMs*(): LongCounter

jclass android.os.Timer* of JVMObject:
  proc getCountLocked*(which: jint): jint
  proc getTotalTimeLocked*(elapsedRealtimeUs: jlong, which: jint): jlong
  proc getTimeSinceMarkLocked*(elapsedRealtimeUs: jlong): jlong
  proc getMaxDurationMsLocked*(elapsedRealtimeMs: jlong): jlong
  proc getCurrentDurationMsLocked*(elapsedRealtimeMs: jlong): jlong
  proc getTotalDurationMsLocked*(elapsedRealtimeMs: jlong): jlong
  proc getSubTimer*(): Timer
  proc isRunningLocked*(): jboolean
  proc logState*(pw: Printer, prefix: string)

jclass android.os.Uid* of JVMObject:
  proc getWakelockStats*(): ArrayMap[string, ? extends Wakelock]
  proc getMulticastWakelockStats*(): Timer
  proc getSyncStats*(): ArrayMap[string, ? extends Timer]
  proc getJobStats*(): ArrayMap[string, ? extends Timer]
  proc getJobCompletionStats*(): ArrayMap[string, SparseIntArray]
  proc getAggregatedPartialWakelockTimer*(): Timer
  proc getSensorStats*(): SparseArray[? extends Sensor]
  proc getPidStats*(): SparseArray[? extends Pid]
  proc getProcessStats*(): ArrayMap[string, ? extends Proc]
  proc getPackageStats*(): ArrayMap[string, ? extends Pkg]
  proc getProportionalSystemServiceUsage*(): jdouble
  proc getWifiControllerActivity*(): ControllerActivityCounter
  proc getBluetoothControllerActivity*(): ControllerActivityCounter
  proc getModemControllerActivity*(): ControllerActivityCounter
  proc getUid*(): jint
  proc noteWifiRunningLocked*(elapsedRealtime: jlong)
  proc noteWifiStoppedLocked*(elapsedRealtime: jlong)
  proc noteFullWifiLockAcquiredLocked*(elapsedRealtime: jlong)
  proc noteFullWifiLockReleasedLocked*(elapsedRealtime: jlong)
  proc noteWifiScanStartedLocked*(elapsedRealtime: jlong)
  proc noteWifiScanStoppedLocked*(elapsedRealtime: jlong)
  proc noteWifiBatchedScanStartedLocked*(csph: jint, elapsedRealtime: jlong)
  proc noteWifiBatchedScanStoppedLocked*(elapsedRealtime: jlong)
  proc noteWifiMulticastEnabledLocked*(elapsedRealtime: jlong)
  proc noteWifiMulticastDisabledLocked*(elapsedRealtime: jlong)
  proc noteActivityResumedLocked*(elapsedRealtime: jlong)
  proc noteActivityPausedLocked*(elapsedRealtime: jlong)
  proc getWifiRunningTime*(elapsedRealtimeUs: jlong, which: jint): jlong
  proc getFullWifiLockTime*(elapsedRealtimeUs: jlong, which: jint): jlong
  proc getWifiScanTime*(elapsedRealtimeUs: jlong, which: jint): jlong
  proc getWifiScanCount*(which: jint): jint
  proc getWifiScanTimer*(): Timer
  proc getWifiScanBackgroundCount*(which: jint): jint
  proc getWifiScanActualTime*(elapsedRealtimeUs: jlong): jlong
  proc getWifiScanBackgroundTime*(elapsedRealtimeUs: jlong): jlong
  proc getWifiScanBackgroundTimer*(): Timer
  proc getWifiBatchedScanTime*(csphBin: jint, elapsedRealtimeUs: jlong, which: jint): jlong
  proc getWifiBatchedScanCount*(csphBin: jint, which: jint): jint
  proc getWifiMulticastTime*(elapsedRealtimeUs: jlong, which: jint): jlong
  proc getAudioTurnedOnTimer*(): Timer
  proc getVideoTurnedOnTimer*(): Timer
  proc getFlashlightTurnedOnTimer*(): Timer
  proc getCameraTurnedOnTimer*(): Timer
  proc getForegroundActivityTimer*(): Timer
  proc getForegroundServiceTimer*(): Timer
  proc getBluetoothScanTimer*(): Timer
  proc getBluetoothScanBackgroundTimer*(): Timer
  proc getBluetoothUnoptimizedScanTimer*(): Timer
  proc getBluetoothUnoptimizedScanBackgroundTimer*(): Timer
  proc getBluetoothScanResultCounter*(): Counter
  proc getBluetoothScanResultBgCounter*(): Counter
  proc getCpuFreqTimes*(which: jint): seq[jlong]
  proc getScreenOffCpuFreqTimes*(which: jint): seq[jlong]
  proc getCpuActiveTime*(): jlong
  proc getCpuActiveTime*(procState: jint): jlong
  proc getCpuClusterTimes*(): seq[jlong]
  proc getCpuFreqTimes*(timesInFreqMs: seq[jlong], procState: jint): jboolean
  proc getScreenOffCpuFreqTimes*(timesInFreqMs: seq[jlong], procState: jint): jboolean
  proc getProcessStateTime*(state: jint, elapsedRealtimeUs: jlong, which: jint): jlong
  proc getProcessStateTimer*(state: jint): Timer
  proc getVibratorOnTimer*(): Timer
  proc noteUserActivityLocked*(type: jint)
  proc hasUserActivity*(): jboolean
  proc getUserActivityCount*(type: jint, which: jint): jint
  proc hasNetworkActivity*(): jboolean
  proc getNetworkActivityBytes*(type: jint, which: jint): jlong
  proc getNetworkActivityPackets*(type: jint, which: jint): jlong
  proc getMobileRadioActiveTime*(which: jint): jlong
  proc getMobileRadioActiveTimeInProcessState*(processState: jint): jlong
  proc getMobileRadioActiveCount*(which: jint): jint
  proc getUserCpuTimeUs*(which: jint): jlong
  proc getSystemCpuTimeUs*(which: jint): jlong
  proc getTimeAtCpuSpeed*(cluster: jint, step: jint, which: jint): jlong
  proc getMobileRadioApWakeupCount*(which: jint): jlong
  proc getWifiRadioApWakeupCount*(which: jint): jlong
  proc getDeferredJobsCheckinLineLocked*(sb: StringBuilder, which: jint)
  proc getDeferredJobsLineLocked*(sb: StringBuilder, which: jint)
  proc getBluetoothEnergyConsumptionUC*(): jlong
  proc getBluetoothEnergyConsumptionUC*(processState: jint): jlong
  proc getCpuEnergyConsumptionUC*(): jlong
  proc getCpuEnergyConsumptionUC*(processState: jint): jlong
  proc getGnssEnergyConsumptionUC*(): jlong
  proc getMobileRadioEnergyConsumptionUC*(): jlong
  proc getMobileRadioEnergyConsumptionUC*(processState: jint): jlong
  proc getScreenOnEnergyConsumptionUC*(): jlong
  proc getWifiEnergyConsumptionUC*(): jlong
  proc getWifiEnergyConsumptionUC*(processState: jint): jlong
  proc getCameraEnergyConsumptionUC*(): jlong
  proc getCustomEnergyConsumerBatteryConsumptionUC*(): seq[jlong]
  PROCESS_STATE_TOP*: jint {.`static`.}
  PROCESS_STATE_FOREGROUND_SERVICE*: jint {.`static`.}
  PROCESS_STATE_FOREGROUND*: jint {.`static`.}
  PROCESS_STATE_BACKGROUND*: jint {.`static`.}
  PROCESS_STATE_TOP_SLEEPING*: jint {.`static`.}
  PROCESS_STATE_HEAVY_WEIGHT*: jint {.`static`.}
  PROCESS_STATE_CACHED*: jint {.`static`.}
  NUM_PROCESS_STATE*: jint {.`static`.}
  PROCESS_STATE_NONEXISTENT*: jint {.`static`.}
  UID_PROCESS_TYPES*: string {.`static`.}
  NUM_WIFI_BATCHED_SCAN_BINS*: jint {.`static`.}
  NUM_USER_ACTIVITY_TYPES*: jint {.`static`.}

jclass android.os.Uid.Wakelock* of JVMObject:
  proc getWakeTime*(type: jint): Timer

jclass android.os.Uid.Sensor* of JVMObject:
  proc getHandle*(): jint
  proc getSensorTime*(): Timer
  proc getSensorBackgroundTime*(): Timer

jclass android.os.Uid.Proc* of JVMObject:
  proc isActive*(): jboolean
  proc getUserTime*(which: jint): jlong
  proc getSystemTime*(which: jint): jlong
  proc getStarts*(which: jint): jint
  proc getNumCrashes*(which: jint): jint
  proc getNumAnrs*(which: jint): jint
  proc getForegroundTime*(which: jint): jlong
  proc countExcessivePowers*(): jint
  proc getExcessivePower*(i: jint): ExcessivePower

jclass android.os.Uid.Pkg* of JVMObject:
  proc getWakeupAlarmStats*(): ArrayMap[string, ? extends Counter]
  proc getServiceStats*(): ArrayMap[string, ? extends Serv]

jclass android.os.Wakelock* of JVMObject:
  proc getWakeTime*(type: jint): Timer

jclass android.os.Sensor* of JVMObject:
  proc getHandle*(): jint
  proc getSensorTime*(): Timer
  proc getSensorBackgroundTime*(): Timer
  GPS*: jint {.`static`.}

jclass android.os.Pid* of JVMObject:
  mWakeNesting*: jint
  mWakeSumMs*: jlong
  mWakeStartMs*: jlong

jclass android.os.Proc* of JVMObject:
  proc isActive*(): jboolean
  proc getUserTime*(which: jint): jlong
  proc getSystemTime*(which: jint): jlong
  proc getStarts*(which: jint): jint
  proc getNumCrashes*(which: jint): jint
  proc getNumAnrs*(which: jint): jint
  proc getForegroundTime*(which: jint): jlong
  proc countExcessivePowers*(): jint
  proc getExcessivePower*(i: jint): ExcessivePower

jclass android.os.ExcessivePower* of JVMObject:
  TYPE_WAKE*: jint {.`static`.}
  TYPE_CPU*: jint {.`static`.}
  typ*: jint
  overTime*: jlong
  usedTime*: jlong

jclass android.os.Pkg* of JVMObject:
  proc getWakeupAlarmStats*(): ArrayMap[string, ? extends Counter]
  proc getServiceStats*(): ArrayMap[string, ? extends Serv]

jclass android.os.Pkg.Serv* of JVMObject:
  proc getStartTime*(batteryUptime: jlong, which: jint): jlong
  proc getStarts*(which: jint): jint
  proc getLaunches*(which: jint): jint

jclass android.os.Serv* of JVMObject:
  proc getStartTime*(batteryUptime: jlong, which: jint): jlong
  proc getStarts*(which: jint): jint
  proc getLaunches*(which: jint): jint

jclass android.os.LevelStepTracker* of JVMObject:
  proc getDurationAt*(index: jint): jlong
  proc getLevelAt*(index: jint): jint
  proc getInitModeAt*(index: jint): jint
  proc getModModeAt*(index: jint): jint
  proc encodeEntryAt*(index: jint, output:StringBuilder)
  proc decodeEntryAt*(index: jint, value: string)
  proc init*()
  proc clearTime*()
  proc computeTimePerLevel*(): jlong
  proc computeTimeEstimate*(modesOfInterest: jlong, modeValues: jlong, outNumOfInterest: seq[jint]): jlong
  proc addLevelSteps*(numStepLevels: jint, modeBits: jlong, elapsedRealtime: jlong)
  proc readFromParcel*(in: Parcel)
  proc writeToParcel*(output:Parcel)
  mLastStepTime*: jlong
  mNumStepDurations*: jint
  mStepDurations*: jlong

jclass android.os.PackageChange* of JVMObject:
  mPackageName*: string
  mUpdate*: jboolean
  mVersionCode*: jlong

jclass android.os.DailyItem* of JVMObject:
  mStartTime*: jlong
  mEndTime*: jlong
  mDischargeSteps*: LevelStepTracker
  mChargeSteps*: LevelStepTracker
  mPackageChanges*: ArrayList[PackageChange]

jclass android.os.HistoryTag* of JVMObject:
  proc setTo*(o: HistoryTag)
  proc setTo*(_string: string, _uid: jint)
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc readFromParcel*(src: Parcel)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  HISTORY_TAG_POOL_OVERFLOW*: jint {.`static`.}
  string*: string
  uid*: jint
  poolIdx*: jint

jclass android.os.HistoryStepDetails* of JVMObject:
  proc clear*()
  proc writeToParcel*(output:Parcel)
  proc readFromParcel*(in: Parcel)
  proc isEmpty*(): jboolean
  userTime*: jint
  systemTime*: jint
  appCpuUid1*: jint
  appCpuUTime1*: jint
  appCpuSTime1*: jint
  appCpuUid2*: jint
  appCpuUTime2*: jint
  appCpuSTime2*: jint
  appCpuUid3*: jint
  appCpuUTime3*: jint
  appCpuSTime3*: jint
  statUserTime*: jint
  statSystemTime*: jint
  statIOWaitTime*: jint
  statIrqTime*: jint
  statSoftIrqTime*: jint
  statIdlTime*: jint
  statSubsystemPowerState*: string

jclass android.os.ProcessStateChange* of JVMObject:
  proc writeToParcel*(output:Parcel)
  proc readFromParcel*(in: Parcel)
  proc formatForBatteryHistory*(): string
  uid*: jint
  processState*: jint

jclass android.os.HistoryItem* of JVMObject:
  proc isDeltaData*(): jboolean
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc readFromParcel*(src: Parcel)
  proc clear*()
  proc setTo*(o: HistoryItem)
  proc setTo*(time: jlong, cmd: jbyte, o: HistoryItem)
  proc sameNonEvent*(o: HistoryItem): jboolean
  proc same*(o: HistoryItem): jboolean
  next*: HistoryItem
  time*: jlong
  currentTime*: jlong
  CMD_UPDATE*: jbyte {.`static`.}
  CMD_NULL*: jbyte {.`static`.}
  CMD_START*: jbyte {.`static`.}
  CMD_CURRENT_TIME*: jbyte {.`static`.}
  CMD_OVERFLOW*: jbyte {.`static`.}
  CMD_RESET*: jbyte {.`static`.}
  CMD_SHUTDOWN*: jbyte {.`static`.}
  cmd*: jbyte
  batteryLevel*: jbyte
  batteryStatus*: jbyte
  batteryHealth*: jbyte
  batteryPlugType*: jbyte
  batteryTemperature*: jshort
  batteryVoltage*: jshort
  batteryChargeUah*: jint
  modemRailChargeMah*: jdouble
  wifiRailChargeMah*: jdouble
  STATE_BRIGHTNESS_SHIFT*: jint {.`static`.}
  STATE_BRIGHTNESS_MASK*: jint {.`static`.}
  STATE_PHONE_SIGNAL_STRENGTH_SHIFT*: jint {.`static`.}
  STATE_PHONE_SIGNAL_STRENGTH_MASK*: jint {.`static`.}
  STATE_PHONE_STATE_SHIFT*: jint {.`static`.}
  STATE_PHONE_STATE_MASK*: jint {.`static`.}
  STATE_DATA_CONNECTION_SHIFT*: jint {.`static`.}
  STATE_DATA_CONNECTION_MASK*: jint {.`static`.}
  STATE_CPU_RUNNING_FLAG*: jint {.`static`.}
  STATE_WAKE_LOCK_FLAG*: jint {.`static`.}
  STATE_GPS_ON_FLAG*: jint {.`static`.}
  STATE_WIFI_FULL_LOCK_FLAG*: jint {.`static`.}
  STATE_WIFI_SCAN_FLAG*: jint {.`static`.}
  STATE_WIFI_RADIO_ACTIVE_FLAG*: jint {.`static`.}
  STATE_MOBILE_RADIO_ACTIVE_FLAG*: jint {.`static`.}
  STATE_SENSOR_ON_FLAG*: jint {.`static`.}
  STATE_AUDIO_ON_FLAG*: jint {.`static`.}
  STATE_PHONE_SCANNING_FLAG*: jint {.`static`.}
  STATE_SCREEN_ON_FLAG*: jint {.`static`.}
  STATE_BATTERY_PLUGGED_FLAG*: jint {.`static`.}
  STATE_SCREEN_DOZE_FLAG*: jint {.`static`.}
  STATE_WIFI_MULTICAST_ON_FLAG*: jint {.`static`.}
  MOST_INTERESTING_STATES*: jint {.`static`.}
  SETTLE_TO_ZERO_STATES*: jint {.`static`.}
  IMPORTANT_FOR_POWER_STATS_STATES*: jint {.`static`.}
  states*: jint
  STATE2_WIFI_SUPPL_STATE_SHIFT*: jint {.`static`.}
  STATE2_WIFI_SUPPL_STATE_MASK*: jint {.`static`.}
  STATE2_WIFI_SIGNAL_STRENGTH_SHIFT*: jint {.`static`.}
  STATE2_WIFI_SIGNAL_STRENGTH_MASK*: jint {.`static`.}
  STATE2_GPS_SIGNAL_QUALITY_SHIFT*: jint {.`static`.}
  STATE2_GPS_SIGNAL_QUALITY_MASK*: jint {.`static`.}
  STATE2_NR_STATE_SHIFT*: jint {.`static`.}
  STATE2_NR_STATE_MASK*: jint {.`static`.}
  STATE2_POWER_SAVE_FLAG*: jint {.`static`.}
  STATE2_VIDEO_ON_FLAG*: jint {.`static`.}
  STATE2_WIFI_RUNNING_FLAG*: jint {.`static`.}
  STATE2_WIFI_ON_FLAG*: jint {.`static`.}
  STATE2_FLASHLIGHT_FLAG*: jint {.`static`.}
  STATE2_DEVICE_IDLE_SHIFT*: jint {.`static`.}
  STATE2_DEVICE_IDLE_MASK*: jint {.`static`.}
  STATE2_CHARGING_FLAG*: jint {.`static`.}
  STATE2_PHONE_IN_CALL_FLAG*: jint {.`static`.}
  STATE2_BLUETOOTH_ON_FLAG*: jint {.`static`.}
  STATE2_CAMERA_FLAG*: jint {.`static`.}
  STATE2_BLUETOOTH_SCAN_FLAG*: jint {.`static`.}
  STATE2_CELLULAR_HIGH_TX_POWER_FLAG*: jint {.`static`.}
  STATE2_USB_DATA_LINK_FLAG*: jint {.`static`.}
  STATE2_EXTENSIONS_FLAG*: jint {.`static`.}
  MOST_INTERESTING_STATES2*: jint {.`static`.}
  SETTLE_TO_ZERO_STATES2*: jint {.`static`.}
  IMPORTANT_FOR_POWER_STATS_STATES2*: jint {.`static`.}
  GNSS_SIGNAL_QUALITY_NONE*: jint {.`static`.}
  states2*: jint
  wakelockTag*: HistoryTag
  wakeReasonTag*: HistoryTag
  stepDetails*: HistoryStepDetails
  powerStats*: PowerStats
  processStateChange*: ProcessStateChange
  EVENT_FLAG_START*: jint {.`static`.}
  EVENT_FLAG_FINISH*: jint {.`static`.}
  EVENT_NONE*: jint {.`static`.}
  EVENT_PROC*: jint {.`static`.}
  EVENT_FOREGROUND*: jint {.`static`.}
  EVENT_TOP*: jint {.`static`.}
  EVENT_SYNC*: jint {.`static`.}
  EVENT_WAKE_LOCK*: jint {.`static`.}
  EVENT_JOB*: jint {.`static`.}
  EVENT_USER_RUNNING*: jint {.`static`.}
  EVENT_USER_FOREGROUND*: jint {.`static`.}
  EVENT_CONNECTIVITY_CHANGED*: jint {.`static`.}
  EVENT_ACTIVE*: jint {.`static`.}
  EVENT_PACKAGE_INSTALLED*: jint {.`static`.}
  EVENT_PACKAGE_UNINSTALLED*: jint {.`static`.}
  EVENT_ALARM*: jint {.`static`.}
  EVENT_COLLECT_EXTERNAL_STATS*: jint {.`static`.}
  EVENT_PACKAGE_INACTIVE*: jint {.`static`.}
  EVENT_PACKAGE_ACTIVE*: jint {.`static`.}
  EVENT_TEMP_WHITELIST*: jint {.`static`.}
  EVENT_SCREEN_WAKE_UP*: jint {.`static`.}
  EVENT_WAKEUP_AP*: jint {.`static`.}
  EVENT_LONG_WAKE_LOCK*: jint {.`static`.}
  EVENT_STATE_CHANGE*: jint {.`static`.}
  EVENT_DISPLAY_STATE_CHANGED*: jint {.`static`.}
  EVENT_COUNT*: jint {.`static`.}
  EVENT_TYPE_MASK*: jint {.`static`.}
  EVENT_PROC_START*: jint {.`static`.}
  EVENT_PROC_FINISH*: jint {.`static`.}
  EVENT_FOREGROUND_START*: jint {.`static`.}
  EVENT_FOREGROUND_FINISH*: jint {.`static`.}
  EVENT_TOP_START*: jint {.`static`.}
  EVENT_TOP_FINISH*: jint {.`static`.}
  EVENT_SYNC_START*: jint {.`static`.}
  EVENT_SYNC_FINISH*: jint {.`static`.}
  EVENT_WAKE_LOCK_START*: jint {.`static`.}
  EVENT_WAKE_LOCK_FINISH*: jint {.`static`.}
  EVENT_JOB_START*: jint {.`static`.}
  EVENT_JOB_FINISH*: jint {.`static`.}
  EVENT_USER_RUNNING_START*: jint {.`static`.}
  EVENT_USER_RUNNING_FINISH*: jint {.`static`.}
  EVENT_USER_FOREGROUND_START*: jint {.`static`.}
  EVENT_USER_FOREGROUND_FINISH*: jint {.`static`.}
  EVENT_ALARM_START*: jint {.`static`.}
  EVENT_ALARM_FINISH*: jint {.`static`.}
  EVENT_TEMP_WHITELIST_START*: jint {.`static`.}
  EVENT_TEMP_WHITELIST_FINISH*: jint {.`static`.}
  EVENT_LONG_WAKE_LOCK_START*: jint {.`static`.}
  EVENT_LONG_WAKE_LOCK_FINISH*: jint {.`static`.}
  eventCode*: jint
  eventTag*: HistoryTag
  numReadInts*: jint
  localWakelockTag*: HistoryTag
  localWakeReasonTag*: HistoryTag
  localEventTag*: HistoryTag
  localProcessStateChange*: ProcessStateChange
  tagsFirstOccurrence*: jboolean

jclass android.os.HistoryEventTracker* of JVMObject:
  proc updateState*(code: jint, name: string, uid: jint, poolIdx: jint): jboolean
  proc removeEvents*(code: jint)
  proc getStateForEvent*(code: jint): HashMap[string, SparseIntArray]

jclass android.os.BitDescription* of JVMObject:
  mask*: jint
  shift*: jint
  name*: string
  shortName*: string
  values*: string
  shortValues*: string



jclass android.os.HistoryPrinter* of JVMObject:
  proc printNextItem*(pw: PrintWriter, rec: HistoryItem, baseTime: jlong, checkin: jboolean, verbose: jboolean)
  proc printNextItem*(proto: ProtoOutputStream, rec: HistoryItem, baseTime: jlong, verbose: jboolean)

