import jnim

jclass android.window.BackProgressAnimator* of JVMObject:
  proc onAnimationUpdate*(animation: DynamicAnimation, value: jfloat, velocity: jfloat)
  proc onBackProgressed*(event: BackMotionEvent)
  proc onBackStarted*(event: BackMotionEvent, callback: ProgressCallback)
  proc reset*()
  proc onBackInvoked*(finishCallback: Runnable)
  proc onBackCancelled*(finishCallback: Runnable)
  proc removeOnBackCancelledFinishCallback*()
  proc removeOnBackInvokedFinishCallback*()
  proc isBackAnimationInProgress*(): jboolean
  proc getVelocity*(): jfloat

