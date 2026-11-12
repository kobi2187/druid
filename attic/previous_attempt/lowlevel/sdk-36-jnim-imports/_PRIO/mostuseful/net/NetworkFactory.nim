import jnim

jclass android.net.NetworkFactory* of JVMObject:
  proc obtainMessage*(what: jint, arg1: jint, arg2: jint, obj: JObject): Message
  proc getLooper*(): Looper
  proc register*()
  proc registerIgnoringScore*()
  proc terminate*()
  proc acceptRequest*(request: NetworkRequest): jboolean
  proc setScoreFilter*(score: jint)
  proc setScoreFilter*(score: NetworkScore)
  proc setCapabilityFilter*(netCap: NetworkCapabilities)
  proc getSerialNumber*(): jint
  proc getProvider*(): NetworkProvider
  proc dump*(fd: FileDescriptor, writer: PrintWriter, args: seq[string])
  proc toString*(): string
  CMD_REQUEST_NETWORK*: jint {.`static`.}
  CMD_CANCEL_REQUEST*: jint {.`static`.}

