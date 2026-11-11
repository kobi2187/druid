import jnim

jclass android.mtp.MtpDeviceInfo* of JVMObject:
  proc getManufacturer*(): string
  proc getModel*(): string
  proc getVersion*(): string
  proc getSerialNumber*(): string
  proc getOperationsSupported*(): seq[jint]
  proc getEventsSupported*(): seq[jint]
  proc getDevicePropertySupported*(): seq[jint]
  proc isOperationSupported*(code: jint): jboolean
  proc isEventSupported*(code: jint): jboolean
  proc isDevicePropertySupported*(code: jint): jboolean

