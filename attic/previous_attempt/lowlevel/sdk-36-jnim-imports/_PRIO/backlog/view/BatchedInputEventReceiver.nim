import jnim

jclass android.view.BatchedInputEventReceiver* of InputEventReceiver:
  proc onBatchedInputEventPending*(source: jint)
  proc dispose*()
  proc setBatchingEnabled*(batchingEnabled: jboolean)

jclass android.view.BatchedInputEventReceiver.SimpleBatchedInputEventReceiver* of JVMObject:
  proc onInputEvent*(event: InputEvent)

jclass android.view.SimpleBatchedInputEventReceiver* of BatchedInputEventReceiver:
  proc onInputEvent*(event: InputEvent)

