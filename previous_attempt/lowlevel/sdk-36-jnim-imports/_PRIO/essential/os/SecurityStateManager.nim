import jnim

jclass android.os.SecurityStateManager* of JVMObject:
  proc getGlobalSecurityState*(): Bundle
  KEY_SYSTEM_SPL*: string {.`static`.}
  KEY_VENDOR_SPL*: string {.`static`.}
  KEY_KERNEL_VERSION*: string {.`static`.}

