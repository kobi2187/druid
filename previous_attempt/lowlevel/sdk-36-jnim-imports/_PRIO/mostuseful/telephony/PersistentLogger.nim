import jnim

jclass android.telephony.PersistentLogger* of JVMObject:
  proc debug*(tag: string, msg: string)
  proc info*(tag: string, msg: string)
  proc warn*(tag: string, msg: string)
  proc warn*(tag: string, msg: string, t: Throwable)
  proc error*(tag: string, msg: string)
  proc error*(tag: string, msg: string, t: Throwable)

