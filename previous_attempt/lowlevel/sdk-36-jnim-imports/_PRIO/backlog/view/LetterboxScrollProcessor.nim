import jnim

jclass android.view.LetterboxScrollProcessor* of JVMObject:
  proc processMotionEvent*(motionEvent: MotionEvent): List[MotionEvent]
  proc processMotionEventBeforeFinish*(motionEvent: MotionEvent): InputEvent

