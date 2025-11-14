import jnim

jclass android.gesture.GestureLibrary* of JVMObject:
  proc save*(): jboolean
  proc load*(): jboolean
  proc isReadOnly*(): jboolean
  proc getLearner*(): Learner
  proc setOrientationStyle*(style: jint)
  proc getOrientationStyle*(): jint
  proc setSequenceType*(type: jint)
  proc getSequenceType*(): jint
  proc getGestureEntries*(): Set[string]
  proc recognize*(gesture: Gesture): ArrayList[Prediction]
  proc addGesture*(entryName: string, gesture: Gesture)
  proc removeGesture*(entryName: string, gesture: Gesture)
  proc removeEntry*(entryName: string)
  proc getGestures*(entryName: string): ArrayList[Gesture]

