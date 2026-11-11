import jnim

jclass android.media.RemoteDisplay* of JVMObject:
  proc listen*(iface: string, listener: Listener, handler: Handler, opPackageName: string): RemoteDisplay {.`static`.}
  proc dispose*()
  proc pause*()
  proc resume*()
  DISPLAY_FLAG_SECURE*: jint {.`static`.}
  DISPLAY_ERROR_UNKOWN*: jint {.`static`.}
  DISPLAY_ERROR_CONNECTION_DROPPED*: jint {.`static`.}

