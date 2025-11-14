import jnim

jclass android.view.InputEventAssigner* of JVMObject:
  proc notifyFrameProcessed*()
  proc processEvent*(event: InputEvent): jint

