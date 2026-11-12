import jnim

jclass android.os.SynchronousResultReceiver* of ResultReceiver:
  proc getName*(): string
  proc awaitResult*(timeoutMillis: jlong): Result

jclass android.os.Result* of JVMObject:
  resultCode*: jint
  bundle*: Bundle

