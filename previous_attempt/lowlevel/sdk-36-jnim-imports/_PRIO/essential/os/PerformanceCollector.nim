import jnim

jclass android.os.PerformanceCollector* of JVMObject:
  proc setPerformanceResultsWriter*(writer: PerformanceResultsWriter)
  proc beginSnapshot*(label: string)
  proc endSnapshot*(): Bundle
  proc startTiming*(label: string)
  proc addIteration*(label: string): Bundle
  proc stopTiming*(label: string): Bundle
  proc addMeasurement*(label: string, value: jlong)
  proc addMeasurement*(label: string, value: jfloat)
  proc addMeasurement*(label: string, value: string)
  METRIC_KEY_ITERATIONS*: string {.`static`.}
  METRIC_KEY_LABEL*: string {.`static`.}
  METRIC_KEY_CPU_TIME*: string {.`static`.}
  METRIC_KEY_EXECUTION_TIME*: string {.`static`.}
  METRIC_KEY_PRE_RECEIVED_TRANSACTIONS*: string {.`static`.}
  METRIC_KEY_PRE_SENT_TRANSACTIONS*: string {.`static`.}
  METRIC_KEY_RECEIVED_TRANSACTIONS*: string {.`static`.}
  METRIC_KEY_SENT_TRANSACTIONS*: string {.`static`.}
  METRIC_KEY_GC_INVOCATION_COUNT*: string {.`static`.}
  METRIC_KEY_JAVA_ALLOCATED*: string {.`static`.}
  METRIC_KEY_JAVA_FREE*: string {.`static`.}
  METRIC_KEY_JAVA_PRIVATE_DIRTY*: string {.`static`.}
  METRIC_KEY_JAVA_PSS*: string {.`static`.}
  METRIC_KEY_JAVA_SHARED_DIRTY*: string {.`static`.}
  METRIC_KEY_JAVA_SIZE*: string {.`static`.}
  METRIC_KEY_NATIVE_ALLOCATED*: string {.`static`.}
  METRIC_KEY_NATIVE_FREE*: string {.`static`.}
  METRIC_KEY_NATIVE_PRIVATE_DIRTY*: string {.`static`.}
  METRIC_KEY_NATIVE_PSS*: string {.`static`.}
  METRIC_KEY_NATIVE_SHARED_DIRTY*: string {.`static`.}
  METRIC_KEY_NATIVE_SIZE*: string {.`static`.}
  METRIC_KEY_GLOBAL_ALLOC_COUNT*: string {.`static`.}
  METRIC_KEY_GLOBAL_ALLOC_SIZE*: string {.`static`.}
  METRIC_KEY_GLOBAL_FREED_COUNT*: string {.`static`.}
  METRIC_KEY_GLOBAL_FREED_SIZE*: string {.`static`.}
  METRIC_KEY_OTHER_PRIVATE_DIRTY*: string {.`static`.}
  METRIC_KEY_OTHER_PSS*: string {.`static`.}
  METRIC_KEY_OTHER_SHARED_DIRTY*: string {.`static`.}

jclass android.os.PerformanceCollector.PerformanceResultsWriter* of JVMObject:
  proc writeBeginSnapshot*(label: string)
  proc writeEndSnapshot*(results: Bundle)
  proc writeStartTiming*(label: string)
  proc writeStopTiming*(results: Bundle)
  proc writeMeasurement*(label: string, value: jlong)
  proc writeMeasurement*(label: string, value: jfloat)
  proc writeMeasurement*(label: string, value: string)

jclass android.os.PerformanceResultsWriter* of JVMObject:
  proc writeBeginSnapshot*(label: string)
  proc writeEndSnapshot*(results: Bundle)
  proc writeStartTiming*(label: string)
  proc writeStopTiming*(results: Bundle)
  proc writeMeasurement*(label: string, value: jlong)
  proc writeMeasurement*(label: string, value: jfloat)
  proc writeMeasurement*(label: string, value: string)

