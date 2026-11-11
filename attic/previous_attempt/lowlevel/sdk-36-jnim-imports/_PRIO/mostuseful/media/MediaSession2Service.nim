import jnim

jclass android.media.MediaSession2Service* of Service:
  proc onCreate*()
  proc onBind*(intent: Intent): IBinder
  proc onDestroy*()
  proc onGetSession*(controllerInfo: ControllerInfo): MediaSession2
  proc onUpdateNotification*(session: MediaSession2): MediaNotification
  proc addSession*(session: MediaSession2)
  proc removeSession*(session: MediaSession2)
  proc getSessions*(): List[MediaSession2]
  SERVICE_INTERFACE*: string {.`static`.}

jclass android.media.MediaSession2Service.MediaNotification* of JVMObject:
  proc getNotificationId*(): jint
  proc getNotification*(): Notification

jclass android.media.MediaNotification* of JVMObject:
  proc getNotificationId*(): jint
  proc getNotification*(): Notification

