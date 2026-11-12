import jnim

jclass android.app.RemoteServiceException* of AndroidRuntimeException:

jclass android.app.RemoteServiceException.ForegroundServiceDidNotStartInTimeException* of JVMObject:
  proc createExtrasForService*(service: ComponentName): Bundle {.`static`.}
  proc getServiceClassNameFromExtras*(extras: Bundle): string {.`static`.}

jclass android.app.RemoteServiceException.ForegroundServiceDidNotStopInTimeException* of JVMObject:
  proc createExtrasForService*(service: ComponentName): Bundle {.`static`.}
  proc getServiceClassNameFromExtras*(extras: Bundle): string {.`static`.}

jclass android.app.ForegroundServiceDidNotStartInTimeException* of RemoteServiceException:
  proc createExtrasForService*(service: ComponentName): Bundle {.`static`.}
  proc getServiceClassNameFromExtras*(extras: Bundle): string {.`static`.}
  TYPE_ID*: jint {.`static`.}

jclass android.app.ForegroundServiceDidNotStopInTimeException* of RemoteServiceException:
  proc createExtrasForService*(service: ComponentName): Bundle {.`static`.}
  proc getServiceClassNameFromExtras*(extras: Bundle): string {.`static`.}
  TYPE_ID*: jint {.`static`.}

jclass android.app.CannotPostForegroundServiceNotificationException* of RemoteServiceException:
  TYPE_ID*: jint {.`static`.}

jclass android.app.BadForegroundServiceNotificationException* of RemoteServiceException:
  TYPE_ID*: jint {.`static`.}

jclass android.app.BadUserInitiatedJobNotificationException* of RemoteServiceException:
  TYPE_ID*: jint {.`static`.}

jclass android.app.MissingRequestPasswordComplexityPermissionException* of RemoteServiceException:
  TYPE_ID*: jint {.`static`.}

jclass android.app.CrashedByAdbException* of RemoteServiceException:
  TYPE_ID*: jint {.`static`.}

