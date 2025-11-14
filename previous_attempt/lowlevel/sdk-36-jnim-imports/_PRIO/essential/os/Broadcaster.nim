import jnim

jclass android.os.Broadcaster* of JVMObject:
  proc request*(senderWhat: jint, target: Handler, targetWhat: jint)
  proc cancelRequest*(senderWhat: jint, target: Handler, targetWhat: jint)
  proc dumpRegistrations*()
  proc broadcast*(msg: Message)

