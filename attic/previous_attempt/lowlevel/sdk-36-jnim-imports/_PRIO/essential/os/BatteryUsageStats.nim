import jnim

jclass android.os.BatteryUsageStats* of JVMObject:
  proc getStatsStartTimestamp*(): jlong
  proc getStatsEndTimestamp*(): jlong
  proc getStatsDuration*(): jlong
  proc getConsumedPower*(): jdouble
  proc getBatteryCapacity*(): jdouble
  proc getDischargePercentage*(): jint
  proc getDischargedPowerRange*(): Range[Double]
  proc getDischargeDurationMs*(): jlong
  proc getBatteryTimeRemainingMs*(): jlong
  proc getChargeTimeRemainingMs*(): jlong
  proc getAggregateBatteryConsumer*(scope: jint): AggregateBatteryConsumer
  proc getUidBatteryConsumers*(): List[UidBatteryConsumer]
  proc getUserBatteryConsumers*(): List[UserBatteryConsumer]
  proc getCustomPowerComponentNames*(): seq[string]
  proc isProcessStateDataIncluded*(): jboolean
  proc iterateBatteryStatsHistory*(): BatteryStatsHistoryIterator
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getStatsProto*(): seq[jbyte]
  proc dumpToProto*(fd: FileDescriptor)
  proc dump*(pw: PrintWriter, prefix: string)
  proc writeXml*(serializer: TypedXmlSerializer)
  proc createFromXml*(parser: TypedXmlPullParser): BatteryUsageStats {.`static`.}
  proc createBuilderFromXml*(parser: TypedXmlPullParser): BatteryUsageStats.Builder {.`static`.}
  proc close*()
  proc toString*(): string
  proc enableInstanceLeakDetection*() {.`static`.}
  proc assertAllInstancesClosed*() {.`static`.}
  AGGREGATE_BATTERY_CONSUMER_SCOPE_DEVICE*: jint {.`static`.}
  AGGREGATE_BATTERY_CONSUMER_SCOPE_ALL_APPS*: jint {.`static`.}
  AGGREGATE_BATTERY_CONSUMER_SCOPE_COUNT*: jint {.`static`.}
  CREATOR*: Creator[BatteryUsageStats] {.`static`.}

jclass android.os.BatteryUsageStats.Builder* of JVMObject:
  proc isProcessStateDataNeeded*(): jboolean
  proc isScreenStateDataNeeded*(): jboolean
  proc isPowerStateDataNeeded*(): jboolean
  proc isSupportedPowerComponent*(componentId: jint): jboolean
  proc build*(): BatteryUsageStats
  proc discard*()
  proc setBatteryCapacity*(batteryCapacityMah: jdouble): Builder
  proc setStatsStartTimestamp*(statsStartTimestampMs: jlong): Builder
  proc setStatsEndTimestamp*(statsEndTimestampMs: jlong): Builder
  proc setStatsDuration*(statsDurationMs: jlong): Builder
  proc getStatsDuration*(): jlong
  proc addDischargePercentage*(dischargePercentage: jint): Builder
  proc addDischargedPowerRange*(dischargedPowerLowerBoundMah: jdouble, dischargedPowerUpperBoundMah: jdouble): Builder
  proc addDischargeDurationMs*(durationMs: jlong): Builder
  proc setBatteryTimeRemainingMs*(batteryTimeRemainingMs: jlong): Builder
  proc setChargeTimeRemainingMs*(chargeTimeRemainingMs: jlong): Builder
  proc setBatteryHistory*(batteryStatsHistory: BatteryStatsHistory, preferredHistoryDurationMs: jlong): Builder
  proc getAggregateBatteryConsumerBuilder*(scope: jint): AggregateBatteryConsumer.Builder
  proc getOrCreateUidBatteryConsumerBuilder*(batteryStatsUid: BatteryStats.Uid): UidBatteryConsumer.Builder
  proc getOrCreateUidBatteryConsumerBuilder*(uid: jint): UidBatteryConsumer.Builder
  proc getOrCreateUserBatteryConsumerBuilder*(userId: jint): UserBatteryConsumer.Builder
  proc getUidBatteryConsumerBuilders*(): SparseArray[UidBatteryConsumer.Builder]
  proc add*(stats: BatteryUsageStats): Builder

jclass android.os.Builder* of JVMObject:
  proc isProcessStateDataNeeded*(): jboolean
  proc isScreenStateDataNeeded*(): jboolean
  proc isPowerStateDataNeeded*(): jboolean
  proc isSupportedPowerComponent*(componentId: jint): jboolean
  proc build*(): BatteryUsageStats
  proc discard*()
  proc setBatteryCapacity*(batteryCapacityMah: jdouble): Builder
  proc setStatsStartTimestamp*(statsStartTimestampMs: jlong): Builder
  proc setStatsEndTimestamp*(statsEndTimestampMs: jlong): Builder
  proc setStatsDuration*(statsDurationMs: jlong): Builder
  proc getStatsDuration*(): jlong
  proc addDischargePercentage*(dischargePercentage: jint): Builder
  proc addDischargedPowerRange*(dischargedPowerLowerBoundMah: jdouble, dischargedPowerUpperBoundMah: jdouble): Builder
  proc addDischargeDurationMs*(durationMs: jlong): Builder
  proc setBatteryTimeRemainingMs*(batteryTimeRemainingMs: jlong): Builder
  proc setChargeTimeRemainingMs*(chargeTimeRemainingMs: jlong): Builder
  proc setBatteryHistory*(batteryStatsHistory: BatteryStatsHistory, preferredHistoryDurationMs: jlong): Builder
  proc getAggregateBatteryConsumerBuilder*(scope: jint): AggregateBatteryConsumer.Builder
  proc getOrCreateUidBatteryConsumerBuilder*(batteryStatsUid: BatteryStats.Uid): UidBatteryConsumer.Builder
  proc getOrCreateUidBatteryConsumerBuilder*(uid: jint): UidBatteryConsumer.Builder
  proc getOrCreateUserBatteryConsumerBuilder*(userId: jint): UserBatteryConsumer.Builder
  proc getUidBatteryConsumerBuilders*(): SparseArray[UidBatteryConsumer.Builder]
  proc add*(stats: BatteryUsageStats): Builder

