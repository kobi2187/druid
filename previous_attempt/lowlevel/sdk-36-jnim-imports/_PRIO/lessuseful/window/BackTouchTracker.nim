import jnim

jclass android.window.BackTouchTracker* of JVMObject:
  proc update*(touchX: jfloat, touchY: jfloat)
  proc setTriggerBack*(triggerBack: jboolean)
  proc getTriggerBack*(): jboolean
  proc shouldUpdateStartLocation*(): jboolean
  proc setShouldUpdateStartLocation*(shouldUpdate: jboolean)
  proc setState*(state: TouchTrackerState)
  proc isInInitialState*(): jboolean
  proc isActive*(): jboolean
  proc isFinished*(): jboolean
  proc setGestureStartLocation*(touchX: jfloat, touchY: jfloat, swipeEdge: jint)
  proc updateStartLocation*()
  proc reset*()
  proc createStartEvent*(target: RemoteAnimationTarget): BackMotionEvent
  proc createProgressEvent*(): BackMotionEvent
  proc getProgress*(touchX: jfloat): jfloat
  proc getMaxDistance*(): jfloat
  proc getLinearDistance*(): jfloat
  proc getNonLinearFactor*(): jfloat
  proc createProgressEvent*(progress: jfloat): BackMotionEvent
  proc setProgressThresholds*(linearDistance: jfloat, maxDistance: jfloat, nonLinearFactor: jfloat)
  proc dump*(pw: PrintWriter, prefix: string)

