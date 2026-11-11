import jnim

jclass android.os.ProfilingManager* of JVMObject:
  proc requestProfiling*(profilingType: jint, parameters: Bundle, tag: string, cancellationSignal: CancellationSignal, executor: Executor, listener: Consumer[ProfilingResult])
  proc registerForAllProfilingResults*(executor: Executor, listener: Consumer[ProfilingResult])
  proc unregisterForAllProfilingResults*(listener: Consumer[ProfilingResult])
  proc addProfilingTriggers*(triggers: List[ProfilingTrigger])
  proc removeProfilingTriggersByType*(triggers: seq[jint])
  proc clearProfilingTriggers*()
  proc getOrCreateIProfilingServiceLocked*(isGeneralListener: jboolean): IProfilingService
  PROFILING_TYPE_JAVA_HEAP_DUMP*: jint {.`static`.}
  PROFILING_TYPE_HEAP_PROFILE*: jint {.`static`.}
  PROFILING_TYPE_STACK_SAMPLING*: jint {.`static`.}
  PROFILING_TYPE_SYSTEM_TRACE*: jint {.`static`.}
  KEY_DURATION_MS*: string {.`static`.}
  KEY_SAMPLING_INTERVAL_BYTES*: string {.`static`.}
  KEY_TRACK_JAVA_ALLOCATIONS*: string {.`static`.}
  KEY_FREQUENCY_HZ*: string {.`static`.}
  KEY_SIZE_KB*: string {.`static`.}
  KEY_BUFFER_FILL_POLICY*: string {.`static`.}
  VALUE_BUFFER_FILL_POLICY_DISCARD*: jint {.`static`.}
  VALUE_BUFFER_FILL_POLICY_RING_BUFFER*: jint {.`static`.}
  mCallbacks*: ArrayList[ProfilingRequestCallbackWrapper]
  mProfilingService*: IProfilingService

