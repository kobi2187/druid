import jnim

jclass android.app.ActivityManagerNative* of JVMObject:
  proc asInterface*(obj: IBinder): IActivityManager {.`static`.}
  proc getDefault*(): IActivityManager {.`static`.}
  proc isSystemReady*(): jboolean {.`static`.}
  proc broadcastStickyIntent*(intent: Intent, permission: string, userId: jint) {.`static`.}
  proc broadcastStickyIntent*(intent: Intent, permission: string, appOp: jint, userId: jint) {.`static`.}
  proc noteWakeupAlarm*(ps: PendingIntent, sourceUid: jint, sourcePkg: string, tag: string) {.`static`.}
  proc noteAlarmStart*(ps: PendingIntent, sourceUid: jint, tag: string) {.`static`.}
  proc noteAlarmFinish*(ps: PendingIntent, sourceUid: jint, tag: string) {.`static`.}

