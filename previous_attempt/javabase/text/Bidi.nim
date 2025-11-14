import jnim

jclass java.text.Bidi* of JVMObject:
  proc createLineBidi*(lineStart: jint, lineLimit: jint): Bidi
  proc isMixed*(): jboolean
  proc isLeftToRight*(): jboolean
  proc isRightToLeft*(): jboolean
  proc getLength*(): jint
  proc baseIsLeftToRight*(): jboolean
  proc getBaseLevel*(): jint
  proc getLevelAt*(offset: jint): jint
  proc getRunCount*(): jint
  proc getRunLevel*(run: jint): jint
  proc getRunStart*(run: jint): jint
  proc getRunLimit*(run: jint): jint
  proc requiresBidi*(text: seq[jchar], start: jint, limit: jint): jboolean {.`static`.}
  proc reorderVisually*(levels: seq[jbyte], levelStart: jint, objects: seq[JObject], objectStart: jint, count: jint) {.`static`.}
  proc toString*(): string
  DIRECTION_LEFT_TO_RIGHT*: jint {.`static`.}
  DIRECTION_RIGHT_TO_LEFT*: jint {.`static`.}
  DIRECTION_DEFAULT_LEFT_TO_RIGHT*: jint {.`static`.}
  DIRECTION_DEFAULT_RIGHT_TO_LEFT*: jint {.`static`.}

