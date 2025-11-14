import jnim

jclass android.gesture.GestureStore* of JVMObject:
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
  proc hasChanged*(): jboolean
  proc save*(stream: OutputStream)
  proc save*(stream: OutputStream, closeStream: jboolean)
  proc load*(stream: InputStream)
  proc load*(stream: InputStream, closeStream: jboolean)
  SEQUENCE_INVARIANT*: jint {.`static`.}
  SEQUENCE_SENSITIVE*: jint {.`static`.}
  ORIENTATION_INVARIANT*: jint {.`static`.}
  ORIENTATION_SENSITIVE*: jint {.`static`.}

