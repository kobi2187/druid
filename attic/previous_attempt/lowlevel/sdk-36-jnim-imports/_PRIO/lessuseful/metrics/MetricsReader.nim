import jnim

jclass android.metrics.MetricsReader* of JVMObject:
  proc setLogReader*(reader: LogReader)
  proc read*(horizonMs: jlong)
  proc checkpoint*()
  proc reset*()
  proc hasNext*(): jboolean
  proc next*(): LogMaker

jclass android.metrics.MetricsReader.Event* of JVMObject:
  proc getTimeMillis*(): jlong
  proc getProcessId*(): jint
  proc getUid*(): jint
  proc getData*(): JObject
  proc setData*(data: JObject)

jclass android.metrics.MetricsReader.LogReader* of JVMObject:
  proc readEvents*(tags: seq[jint], horizonMs: jlong, events: Collection[Event])
  proc writeCheckpoint*(tag: jint)

jclass android.metrics.Event* of JVMObject:
  proc getTimeMillis*(): jlong
  proc getProcessId*(): jint
  proc getUid*(): jint
  proc getData*(): JObject
  proc setData*(data: JObject)

jclass android.metrics.LogReader* of JVMObject:
  proc readEvents*(tags: seq[jint], horizonMs: jlong, events: Collection[Event])
  proc writeCheckpoint*(tag: jint)

