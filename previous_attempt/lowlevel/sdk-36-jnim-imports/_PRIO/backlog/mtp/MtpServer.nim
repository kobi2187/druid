import jnim

jclass android.mtp.MtpServer* of JVMObject:
  proc start*()
  proc run*()
  proc sendObjectAdded*(handle: jint)
  proc sendObjectRemoved*(handle: jint)
  proc sendObjectInfoChanged*(handle: jint)
  proc sendDevicePropertyChanged*(property: jint)
  proc addStorage*(storage: MtpStorage)
  proc removeStorage*(storage: MtpStorage)

