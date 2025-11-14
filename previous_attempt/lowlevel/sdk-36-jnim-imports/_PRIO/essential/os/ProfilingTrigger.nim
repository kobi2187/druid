import jnim

jclass android.os.ProfilingTrigger* of JVMObject:
  proc getTriggerType*(): jint
  proc getRateLimitingPeriodHours*(): jint
  proc toValueParcel*(): ProfilingTriggerValueParcel
  proc isValidRequestTriggerType*(triggerType: jint): jboolean {.`static`.}
  TRIGGER_TYPE_NONE*: jint {.`static`.}
  TRIGGER_TYPE_APP_FULLY_DRAWN*: jint {.`static`.}
  TRIGGER_TYPE_ANR*: jint {.`static`.}

jclass android.os.ProfilingTrigger.Builder* of JVMObject:
  proc build*(): ProfilingTrigger
  proc setRateLimitingPeriodHours*(rateLimitingPeriodHours: jint): Builder

jclass android.os.Builder* of JVMObject:
  proc build*(): ProfilingTrigger
  proc setRateLimitingPeriodHours*(rateLimitingPeriodHours: jint): Builder

