import jnim

jclass android.debug.AdbNotifications* of JVMObject:
  proc createNotification*(context: Context, transportType: jbyte): Notification {.`static`.}

