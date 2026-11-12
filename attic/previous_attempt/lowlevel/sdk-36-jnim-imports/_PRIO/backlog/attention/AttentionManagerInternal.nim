import jnim

jclass android.attention.AttentionManagerInternal* of JVMObject:
  proc isAttentionServiceSupported*(): jboolean
  proc isProximitySupported*(): jboolean
  proc checkAttention*(timeoutMillis: jlong, callback: AttentionCallbackInternal): jboolean
  proc cancelAttentionCheck*(callback: AttentionCallbackInternal)
  proc onStartProximityUpdates*(callback: ProximityUpdateCallbackInternal): jboolean
  proc onStopProximityUpdates*(callback: ProximityUpdateCallbackInternal)

jclass android.attention.AttentionManagerInternal.AttentionCallbackInternal* of JVMObject:
  proc onSuccess*(result: jint, timestamp: jlong)
  proc onFailure*(error: jint)

jclass android.attention.AttentionCallbackInternal* of JVMObject:
  proc onSuccess*(result: jint, timestamp: jlong)
  proc onFailure*(error: jint)

