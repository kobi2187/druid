import jnim

jclass android.location.SettingInjectorService* of Service:
  proc onBind*(intent: Intent): IBinder
  proc onStart*(intent: Intent, startId: jint)
  proc onStartCommand*(intent: Intent, flags: jint, startId: jint): jint
  proc refreshSettings*(context: Context) {.`static`.}
  ACTION_SERVICE_INTENT*: string {.`static`.}
  META_DATA_NAME*: string {.`static`.}
  ATTRIBUTES_NAME*: string {.`static`.}
  ACTION_INJECTED_SETTING_CHANGED*: string {.`static`.}
  SUMMARY_KEY*: string {.`static`.}
  ENABLED_KEY*: string {.`static`.}
  MESSENGER_KEY*: string {.`static`.}

