import jnim

jclass android.os.UpdateEngineStable* of JVMObject:
  proc bind*(callback: UpdateEngineStableCallback, handler: Handler): jboolean
  proc bind*(callback: UpdateEngineStableCallback): jboolean
  proc applyPayloadFd*(fd: ParcelFileDescriptor, offset: jlong, size: jlong, headerKeyValuePairs: seq[string])
  proc unbind*(): jboolean

