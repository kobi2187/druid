import jnim

jclass android.os.UserBatteryConsumer* of BatteryConsumer:
  proc getUserId*(): jint
  proc dump*(pw: PrintWriter, skipEmptyComponents: jboolean)

jclass android.os.UserBatteryConsumer.Builder* of JVMObject:
  proc addUidBatteryConsumer*(uidBatteryConsumerBuilder: UidBatteryConsumer.Builder)
  proc build*(): UserBatteryConsumer

jclass android.os.Builder* of BaseBuilder:
  proc addUidBatteryConsumer*(uidBatteryConsumerBuilder: UidBatteryConsumer.Builder)
  proc build*(): UserBatteryConsumer

