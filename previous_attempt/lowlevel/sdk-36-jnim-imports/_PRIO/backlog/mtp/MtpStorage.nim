import jnim

jclass android.mtp.MtpStorage* of JVMObject:
  proc getStorageId*(): jint
  proc getPath*(): string
  proc getDescription*(): string
  proc isRemovable*(): jboolean
  proc getMaxFileSize*(): jlong
  proc getVolumeName*(): string
  proc isHostWindows*(): jboolean

