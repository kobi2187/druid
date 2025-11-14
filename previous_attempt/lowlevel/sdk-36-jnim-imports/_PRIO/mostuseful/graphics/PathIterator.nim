import jnim

jclass android.graphics.PathIterator* of JVMObject:
  proc next*(points: seq[jfloat], offset: jint): jint
  proc hasNext*(): jboolean
  proc peek*(): jint
  proc next*(): Segment
  VERB_MOVE*: jint {.`static`.}
  VERB_LINE*: jint {.`static`.}
  VERB_QUAD*: jint {.`static`.}
  VERB_CONIC*: jint {.`static`.}
  VERB_CUBIC*: jint {.`static`.}
  VERB_CLOSE*: jint {.`static`.}
  VERB_DONE*: jint {.`static`.}

jclass android.graphics.PathIterator.Segment* of JVMObject:
  proc getVerb*(): jint
  proc getPoints*(): seq[jfloat]
  proc getConicWeight*(): jfloat

jclass android.graphics.Segment* of JVMObject:
  proc getVerb*(): jint
  proc getPoints*(): seq[jfloat]
  proc getConicWeight*(): jfloat

