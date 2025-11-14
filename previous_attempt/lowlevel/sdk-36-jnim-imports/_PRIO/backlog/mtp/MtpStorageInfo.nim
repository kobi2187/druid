import jnim

jclass android.mtp.MtpStorageInfo* of JVMObject:
  proc getStorageId*(): jint
  proc getMaxCapacity*(): jlong
  proc getFreeSpace*(): jlong
  proc getDescription*(): string
  proc getVolumeIdentifier*(): string

