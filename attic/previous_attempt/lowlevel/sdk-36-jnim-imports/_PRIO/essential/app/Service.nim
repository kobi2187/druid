import jnim

jclass android.app.Service* of ContextWrapper:
  proc getApplication*(): Application
  proc onCreate*()
  proc onStart*(intent: Intent, startId: jint)
  proc onStartCommand*(intent: Intent, flags: jint, startId: jint): jint
  proc onDestroy*()
  proc onConfigurationChanged*(newConfig: Configuration)
  proc onLowMemory*()
  proc onTrimMemory*(level: jint)
  proc onBind*(intent: Intent): IBinder
  proc onUnbind*(intent: Intent): jboolean
  proc onRebind*(intent: Intent)
  proc onTaskRemoved*(rootIntent: Intent)
  proc stopSelf*()
  proc stopSelf*(startId: jint)
  proc stopSelfResult*(startId: jint): jboolean
  proc setForeground*(isForeground: jboolean)
  proc startForeground*(id: jint, notification: Notification)
  proc startForeground*(id: jint, notification: Notification, foregroundServiceType: jint)
  proc stopForeground*(removeNotification: jboolean)
  proc stopForeground*(notificationBehavior: jint)
  proc getForegroundServiceType*(): jint
  proc attach*(context: Context, thread: ActivityThread, className: string, token: IBinder, application: Application, activityManager: JObject)
  proc createServiceBaseContext*(mainThread: ActivityThread, packageInfo: LoadedApk): Context
  proc detachAndCleanUp*()
  proc getContentCaptureClient*(): ContentCaptureManager.ContentCaptureClient
  proc contentCaptureClientGetComponentName*(): ComponentName
  proc setStartForegroundServiceStackTrace*(className: string, stacktrace: StackTrace) {.`static`.}
  proc getStartForegroundServiceStackTrace*(className: string): StackTrace {.`static`.}
  proc callOnTimeout*(startId: jint)
  proc onTimeout*(startId: jint)
  proc callOnTimeLimitExceeded*(startId: jint, fgsType: jint)
  proc onTimeout*(startId: jint, fgsType: jint)
  STOP_FOREGROUND_LEGACY*: jint {.`static`.}
  STOP_FOREGROUND_REMOVE*: jint {.`static`.}
  STOP_FOREGROUND_DETACH*: jint {.`static`.}
  START_CONTINUATION_MASK*: jint {.`static`.}
  START_STICKY_COMPATIBILITY*: jint {.`static`.}
  START_STICKY*: jint {.`static`.}
  START_NOT_STICKY*: jint {.`static`.}
  START_REDELIVER_INTENT*: jint {.`static`.}
  START_TASK_REMOVED_COMPLETE*: jint {.`static`.}
  START_FLAG_REDELIVERY*: jint {.`static`.}
  START_FLAG_RETRY*: jint {.`static`.}

