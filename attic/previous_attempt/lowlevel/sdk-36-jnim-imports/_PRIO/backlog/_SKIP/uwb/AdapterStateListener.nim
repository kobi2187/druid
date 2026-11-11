import jnim

jclass android.uwb.AdapterStateListener* of Stub:
  proc register*(executor: Executor, callback: AdapterStateCallback)
  proc unregister*(callback: AdapterStateCallback)
  proc setEnabled*(isEnabled: jboolean)
  proc getAdapterState*(): jint
  proc onAdapterStateChanged*(state: jint, reason: jint)

