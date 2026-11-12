import jnim

jclass android.os.TestLooperManager* of JVMObject:
  proc getMessageQueue*(): MessageQueue
  proc getQueue*(): MessageQueue
  proc next*(): Message
  proc poll*(): Message
  proc peekWhen*(): Long
  proc isBlockedOnSyncBarrier*(): jboolean
  proc release*()
  proc execute*(message: Message)
  proc recycle*(msg: Message)
  proc hasMessages*(h: Handler, object: JObject, what: jint): jboolean
  proc hasMessages*(h: Handler, object: JObject, r: Runnable): jboolean

