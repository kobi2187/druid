import jnim

jclass android.os.AggregateBatteryConsumer* of BatteryConsumer:
  proc dump*(pw: PrintWriter, skipEmptyComponents: jboolean)
  proc getConsumedPower*(): jdouble

jclass android.os.AggregateBatteryConsumer.Builder* of JVMObject:
  proc setConsumedPower*(consumedPowerMah: jdouble): Builder
  proc addConsumedPower*(consumedPowerMah: jdouble): Builder
  proc add*(aggregateBatteryConsumer: AggregateBatteryConsumer)
  proc build*(): AggregateBatteryConsumer

jclass android.os.Builder* of BaseBuilder:
  proc setConsumedPower*(consumedPowerMah: jdouble): Builder
  proc addConsumedPower*(consumedPowerMah: jdouble): Builder
  proc add*(aggregateBatteryConsumer: AggregateBatteryConsumer)
  proc build*(): AggregateBatteryConsumer

