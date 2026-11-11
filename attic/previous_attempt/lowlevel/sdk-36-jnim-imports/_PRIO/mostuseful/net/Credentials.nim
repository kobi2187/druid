import jnim

jclass android.net.Credentials* of JVMObject:
  proc getPid*(): jint
  proc getUid*(): jint
  proc getGid*(): jint

