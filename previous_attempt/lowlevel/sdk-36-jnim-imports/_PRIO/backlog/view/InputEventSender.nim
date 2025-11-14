import jnim

jclass android.view.InputEventSender* of JVMObject:
  proc dispose*()
  proc onInputEventFinished*(seq: jint, handled: jboolean)
  proc onTimelineReported*(inputEventId: jint, gpuCompletedTime: jlong, presentTime: jlong)
  proc sendInputEvent*(seq: jint, event: InputEvent): jboolean

