import jnim

jclass android.security.GateKeeper* of JVMObject:
  proc getService*(): IGateKeeperService {.`static`.}
  proc getSecureUserId*(): jlong {.`static`.}
  proc getSecureUserId*(userId: jint): jlong {.`static`.}
  INVALID_SECURE_USER_ID*: jlong {.`static`.}

