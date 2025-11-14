import jnim

jclass android.telephony.DropBoxManagerLoggerBackend* of JVMObject:
  proc getInstance*(context: Context): DropBoxManagerLoggerBackend {.`static`.}
  proc setLoggingEnabled*(isLoggingEnabled: jboolean)
  proc debug*(tag: string, msg: string)
  proc info*(tag: string, msg: string)
  proc warn*(tag: string, msg: string)
  proc warn*(tag: string, msg: string, t: Throwable)
  proc error*(tag: string, msg: string)
  proc error*(tag: string, msg: string, t: Throwable)
  proc flushAsync*()
  proc flush*()

