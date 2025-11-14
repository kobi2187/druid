import jnim

jclass java.lang.ThreadGroup* of JVMObject:
  proc getName*(): string
  proc getParent*(): ThreadGroup
  proc getMaxPriority*(): jint
  proc isDaemon*(): jboolean
  proc isDestroyed*(): jboolean
  proc setDaemon*(daemon: jboolean)
  proc setMaxPriority*(pri: jint)
  proc parentOf*(g: ThreadGroup): jboolean
  proc checkAccess*()
  proc activeCount*(): jint
  proc enumerate*(list: seq[Thread]): jint
  proc enumerate*(list: seq[Thread], recurse: jboolean): jint
  proc activeGroupCount*(): jint
  proc enumerate*(list: seq[ThreadGroup]): jint
  proc enumerate*(list: seq[ThreadGroup], recurse: jboolean): jint
  proc interrupt*()
  proc destroy*()
  proc list*()
  proc uncaughtException*(t: Thread, e: Throwable)
  proc toString*(): string

