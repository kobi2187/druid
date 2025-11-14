import jnim

jclass android.os.OomKillRecord* of JVMObject:
  proc logKillOccurred*()
  proc getTimestampMilli*(): jlong
  proc getPid*(): jint
  proc getUid*(): jint
  proc getProcessName*(): string
  proc getOomScoreAdj*(): jshort

