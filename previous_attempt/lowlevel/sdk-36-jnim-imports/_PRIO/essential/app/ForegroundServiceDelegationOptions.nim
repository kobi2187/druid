import jnim

jclass android.app.ForegroundServiceDelegationOptions* of JVMObject:
  proc isSameDelegate*(that: ForegroundServiceDelegationOptions): jboolean
  proc getComponentName*(): ComponentName
  proc getDescription*(): string
  proc serviceCodeToString*(serviceCode: jint): string {.`static`.}
  DELEGATION_SERVICE_DEFAULT*: jint {.`static`.}
  DELEGATION_SERVICE_DATA_SYNC*: jint {.`static`.}
  DELEGATION_SERVICE_MEDIA_PLAYBACK*: jint {.`static`.}
  DELEGATION_SERVICE_PHONE_CALL*: jint {.`static`.}
  DELEGATION_SERVICE_LOCATION*: jint {.`static`.}
  DELEGATION_SERVICE_CONNECTED_DEVICE*: jint {.`static`.}
  DELEGATION_SERVICE_MEDIA_PROJECTION*: jint {.`static`.}
  DELEGATION_SERVICE_CAMERA*: jint {.`static`.}
  DELEGATION_SERVICE_MICROPHONE*: jint {.`static`.}
  DELEGATION_SERVICE_HEALTH*: jint {.`static`.}
  DELEGATION_SERVICE_REMOTE_MESSAGING*: jint {.`static`.}
  DELEGATION_SERVICE_SYSTEM_EXEMPTED*: jint {.`static`.}
  DELEGATION_SERVICE_SPECIAL_USE*: jint {.`static`.}
  mClientPid*: jint
  mClientUid*: jint
  mClientPackageName*: string
  mClientAppThread*: IApplicationThread
  mSticky*: jboolean
  mClientInstanceName*: string
  mForegroundServiceTypes*: jint
  mDelegationService*: jint
  mClientNotificationId*: jint
  mClientNotification*: Notification

jclass android.app.ForegroundServiceDelegationOptions.Builder* of JVMObject:
  proc setClientPid*(clientPid: jint): Builder
  proc setClientUid*(clientUid: jint): Builder
  proc setClientPackageName*(clientPackageName: string): Builder
  proc setClientNotification*(clientNotificationId: jint, clientNotification: Notification): Builder
  proc setClientAppThread*(clientAppThread: IApplicationThread): Builder
  proc setClientInstanceName*(clientInstanceName: string): Builder
  proc setSticky*(isSticky: jboolean): Builder
  proc setForegroundServiceTypes*(foregroundServiceTypes: jint): Builder
  proc setDelegationService*(delegationService: jint): Builder
  proc build*(): ForegroundServiceDelegationOptions

jclass android.app.Builder* of JVMObject:
  proc setClientPid*(clientPid: jint): Builder
  proc setClientUid*(clientUid: jint): Builder
  proc setClientPackageName*(clientPackageName: string): Builder
  proc setClientNotification*(clientNotificationId: jint, clientNotification: Notification): Builder
  proc setClientAppThread*(clientAppThread: IApplicationThread): Builder
  proc setClientInstanceName*(clientInstanceName: string): Builder
  proc setSticky*(isSticky: jboolean): Builder
  proc setForegroundServiceTypes*(foregroundServiceTypes: jint): Builder
  proc setDelegationService*(delegationService: jint): Builder
  proc build*(): ForegroundServiceDelegationOptions

