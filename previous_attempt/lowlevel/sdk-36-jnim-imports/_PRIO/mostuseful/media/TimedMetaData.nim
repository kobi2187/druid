import jnim

jclass android.media.TimedMetaData* of JVMObject:
  proc getTimestamp*(): jlong
  proc getMetaData*(): seq[jbyte]

