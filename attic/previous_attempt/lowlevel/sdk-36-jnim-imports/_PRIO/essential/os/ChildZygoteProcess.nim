import jnim

jclass android.os.ChildZygoteProcess* of ZygoteProcess:
  proc getPid*(): jint
  proc isDead*(): jboolean

