import jnim

jclass android.view.FocusFinderHelper* of JVMObject:
  proc isBetterCandidate*(direction: jint, source: Rect, rect1: Rect, rect2: Rect): jboolean
  proc beamBeats*(direction: jint, source: Rect, rect1: Rect, rect2: Rect): jboolean
  proc isCandidate*(srcRect: Rect, destRect: Rect, direction: jint): jboolean
  proc beamsOverlap*(direction: jint, rect1: Rect, rect2: Rect): jboolean
  proc majorAxisDistance*(direction: jint, source: Rect, dest: Rect): jint {.`static`.}
  proc majorAxisDistanceToFarEdge*(direction: jint, source: Rect, dest: Rect): jint {.`static`.}

