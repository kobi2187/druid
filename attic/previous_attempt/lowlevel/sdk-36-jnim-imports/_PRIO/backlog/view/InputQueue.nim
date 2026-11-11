import jnim

jclass android.view.InputQueue* of JVMObject:
  proc dispose*()
  proc dispose*(finalized: jboolean)
  proc getNativePtr*(): jlong
  proc sendInputEvent*(e: InputEvent, token: JObject, predispatch: jboolean, callback: FinishedInputEventCallback)


