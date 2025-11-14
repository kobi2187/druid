import jnim

jclass android.scheduling.RebootReadinessManager* of JVMObject:
  proc markRebootPending*()
  proc cancelPendingReboot*()
  proc isReadyToReboot*(): jboolean
  proc addRequestRebootReadinessStatusListener*(executor: Executor, callback: RequestRebootReadinessStatusListener)
  proc removeRequestRebootReadinessStatusListener*(callback: RequestRebootReadinessStatusListener)
  ACTION_REBOOT_READY*: string {.`static`.}
  EXTRA_IS_READY_TO_REBOOT*: string {.`static`.}
  IS_REBOOT_READY_KEY*: string {.`static`.}
  ESTIMATED_FINISH_TIME_KEY*: string {.`static`.}
  SUBSYSTEM_NAME_KEY*: string {.`static`.}

jclass android.scheduling.RebootReadinessManager.RebootReadinessStatus* of JVMObject:
  proc isReadyToReboot*(): jboolean
  proc getEstimatedFinishTime*(): jlong
  proc getLogSubsystemName*(): string


jclass android.scheduling.RebootReadinessStatus* of JVMObject:
  proc isReadyToReboot*(): jboolean
  proc getEstimatedFinishTime*(): jlong
  proc getLogSubsystemName*(): string

