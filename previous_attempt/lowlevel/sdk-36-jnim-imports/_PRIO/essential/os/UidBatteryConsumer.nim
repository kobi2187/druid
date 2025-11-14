import jnim

jclass android.os.UidBatteryConsumer* of BatteryConsumer:
  proc getUid*(): jint
  proc getPackageWithHighestDrain*(): string
  proc getTimeInStateMs*(state: jint): jlong
  proc getTimeInProcessStateMs*(state: jint): jlong
  proc dump*(pw: PrintWriter, skipEmptyComponents: jboolean)
  STATE_FOREGROUND*: jint {.`static`.}
  STATE_BACKGROUND*: jint {.`static`.}

jclass android.os.UidBatteryConsumer.Builder* of JVMObject:
  proc getBatteryStatsUid*(): BatteryStats.Uid
  proc getUid*(): jint
  proc isVirtualUid*(): jboolean
  proc setPackageWithHighestDrain*(packageName: string): Builder
  proc setTimeInStateMs*(state: jint, timeInStateMs: jlong): Builder
  proc setTimeInProcessStateMs*(state: jint, timeInProcessStateMs: jlong): Builder
  proc excludeFromBatteryUsageStats*(): Builder
  proc add*(consumer: UidBatteryConsumer): Builder
  proc isExcludedFromBatteryUsageStats*(): jboolean
  proc build*(): UidBatteryConsumer

jclass android.os.Builder* of BaseBuilder:
  proc getBatteryStatsUid*(): BatteryStats.Uid
  proc getUid*(): jint
  proc isVirtualUid*(): jboolean
  proc setPackageWithHighestDrain*(packageName: string): Builder
  proc setTimeInStateMs*(state: jint, timeInStateMs: jlong): Builder
  proc setTimeInProcessStateMs*(state: jint, timeInProcessStateMs: jlong): Builder
  proc excludeFromBatteryUsageStats*(): Builder
  proc add*(consumer: UidBatteryConsumer): Builder
  proc isExcludedFromBatteryUsageStats*(): jboolean
  proc build*(): UidBatteryConsumer

