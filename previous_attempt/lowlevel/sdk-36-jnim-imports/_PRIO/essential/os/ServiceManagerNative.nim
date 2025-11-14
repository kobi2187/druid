import jnim

jclass android.os.ServiceManagerNative* of JVMObject:
  proc asInterface*(obj: IBinder): IServiceManager {.`static`.}

