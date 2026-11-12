import jnim

jclass android.util.SequenceUtils* of JVMObject:
  proc isIncomingSeqStale*(curSeq: jint, incomingSeq: jint): jboolean {.`static`.}
  proc getInitSeq*(): jint {.`static`.}
  proc getNextSeq*(seq: jint): jint {.`static`.}

