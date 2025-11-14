import jnim

jclass android.os.HandlerThread* of Thread:
  proc run*()
  proc getLooper*(): Looper
  proc getThreadHandler*(): Handler
  proc getThreadExecutor*(): Executor
  proc quit*(): jboolean
  proc quitSafely*(): jboolean
  proc getThreadId*(): jint

