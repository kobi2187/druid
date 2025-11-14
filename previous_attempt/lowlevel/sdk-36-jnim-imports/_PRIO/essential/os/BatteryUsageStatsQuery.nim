import jnim

jclass android.os.BatteryUsageStatsQuery* of JVMObject:
  proc getFlags*(): jint
  proc getUserIds*(): seq[jint]
  proc shouldForceUsePowerProfileModel*(): jboolean
  proc isProcessStateDataNeeded*(): jboolean
  proc isScreenStateDataNeeded*(): jboolean
  proc isPowerStateDataNeeded*(): jboolean
  proc getPowerComponents*(): seq[jint]
  proc getMaxStatsAge*(): jlong
  proc getMinConsumedPowerThreshold*(): jdouble
  proc getMonotonicStartTime*(): jlong
  proc getMonotonicEndTime*(): jlong
  proc getAggregatedFromTimestamp*(): jlong
  proc getAggregatedToTimestamp*(): jlong
  proc getPreferredHistoryDurationMs*(): jlong
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  DEFAULT*: BatteryUsageStatsQuery {.`static`.}
  FLAG_BATTERY_USAGE_STATS_POWER_PROFILE_MODEL*: jint {.`static`.}
  FLAG_BATTERY_USAGE_STATS_INCLUDE_HISTORY*: jint {.`static`.}
  FLAG_BATTERY_USAGE_STATS_INCLUDE_PROCESS_STATE_DATA*: jint {.`static`.}
  FLAG_BATTERY_USAGE_STATS_INCLUDE_VIRTUAL_UIDS*: jint {.`static`.}
  FLAG_BATTERY_USAGE_STATS_INCLUDE_SCREEN_STATE*: jint {.`static`.}
  FLAG_BATTERY_USAGE_STATS_INCLUDE_POWER_STATE*: jint {.`static`.}
  FLAG_BATTERY_USAGE_STATS_ACCUMULATED*: jint {.`static`.}
  CREATOR*: Creator[BatteryUsageStatsQuery] {.`static`.}

jclass android.os.BatteryUsageStatsQuery.Builder* of JVMObject:
  proc build*(): BatteryUsageStatsQuery
  proc monotonicTimeRange*(monotonicStartTime: jlong, monotonicEndTime: jlong): Builder
  proc addUser*(userHandle: UserHandle): Builder
  proc includeBatteryHistory*(): Builder
  proc setPreferredHistoryDurationMs*(preferredHistoryDurationMs: jlong): Builder
  proc includeProcessStateData*(): Builder
  proc powerProfileModeledOnly*(): Builder
  proc includePowerModels*(): Builder
  proc includePowerComponents*(powerComponents: seq[jint]): Builder
  proc includeVirtualUids*(): Builder
  proc includeScreenStateData*(): Builder
  proc includePowerStateData*(): Builder
  proc accumulated*(): Builder
  proc aggregateSnapshots*(fromTimestamp: jlong, toTimestamp: jlong): Builder
  proc setMaxStatsAgeMs*(maxStatsAgeMs: jlong): Builder
  proc setMinConsumedPowerThreshold*(minConsumedPowerThreshold: jdouble): Builder

jclass android.os.Builder* of JVMObject:
  proc build*(): BatteryUsageStatsQuery
  proc monotonicTimeRange*(monotonicStartTime: jlong, monotonicEndTime: jlong): Builder
  proc addUser*(userHandle: UserHandle): Builder
  proc includeBatteryHistory*(): Builder
  proc setPreferredHistoryDurationMs*(preferredHistoryDurationMs: jlong): Builder
  proc includeProcessStateData*(): Builder
  proc powerProfileModeledOnly*(): Builder
  proc includePowerModels*(): Builder
  proc includePowerComponents*(powerComponents: seq[jint]): Builder
  proc includeVirtualUids*(): Builder
  proc includeScreenStateData*(): Builder
  proc includePowerStateData*(): Builder
  proc accumulated*(): Builder
  proc aggregateSnapshots*(fromTimestamp: jlong, toTimestamp: jlong): Builder
  proc setMaxStatsAgeMs*(maxStatsAgeMs: jlong): Builder
  proc setMinConsumedPowerThreshold*(minConsumedPowerThreshold: jdouble): Builder

