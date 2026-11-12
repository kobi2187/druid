import jnim

jclass android.os.SystemUpdateManager* of JVMObject:
  proc retrieveSystemUpdateInfo*(): Bundle
  proc updateSystemUpdateInfo*(infoBundle: PersistableBundle)
  KEY_STATUS*: string {.`static`.}
  KEY_TITLE*: string {.`static`.}
  KEY_IS_SECURITY_UPDATE*: string {.`static`.}
  KEY_TARGET_BUILD_FINGERPRINT*: string {.`static`.}
  KEY_TARGET_SECURITY_PATCH_LEVEL*: string {.`static`.}
  STATUS_UNKNOWN*: jint {.`static`.}
  STATUS_IDLE*: jint {.`static`.}
  STATUS_WAITING_DOWNLOAD*: jint {.`static`.}
  STATUS_IN_PROGRESS*: jint {.`static`.}
  STATUS_WAITING_INSTALL*: jint {.`static`.}
  STATUS_WAITING_REBOOT*: jint {.`static`.}

