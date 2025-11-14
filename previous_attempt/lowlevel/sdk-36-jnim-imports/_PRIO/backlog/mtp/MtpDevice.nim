import jnim

jclass android.mtp.MtpDevice* of JVMObject:
  proc open*(connection: UsbDeviceConnection): jboolean
  proc close*()
  proc getDeviceName*(): string
  proc getDeviceId*(): jint
  proc toString*(): string
  proc getDeviceInfo*(): MtpDeviceInfo
  proc setDevicePropertyInitVersion*(propertyStr: string): jint
  proc getStorageIds*(): seq[jint]
  proc getObjectHandles*(storageId: jint, format: jint, objectHandle: jint): seq[jint]
  proc getObject*(objectHandle: jint, objectSize: jint): seq[jbyte]
  proc getPartialObject*(objectHandle: jint, offset: jlong, size: jlong, buffer: seq[jbyte]): jlong
  proc getPartialObject64*(objectHandle: jint, offset: jlong, size: jlong, buffer: seq[jbyte]): jlong
  proc getThumbnail*(objectHandle: jint): seq[jbyte]
  proc getStorageInfo*(storageId: jint): MtpStorageInfo
  proc getObjectInfo*(objectHandle: jint): MtpObjectInfo
  proc deleteObject*(objectHandle: jint): jboolean
  proc getParent*(objectHandle: jint): jlong
  proc getStorageId*(objectHandle: jint): jlong
  proc importFile*(objectHandle: jint, destPath: string): jboolean
  proc importFile*(objectHandle: jint, descriptor: ParcelFileDescriptor): jboolean
  proc sendObject*(objectHandle: jint, size: jlong, descriptor: ParcelFileDescriptor): jboolean
  proc sendObjectInfo*(info: MtpObjectInfo): MtpObjectInfo
  proc readEvent*(signal: CancellationSignal): MtpEvent
  proc getObjectSizeLong*(handle: jint, format: jint): jlong

