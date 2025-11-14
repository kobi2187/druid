import jnim

jclass android.appwidget.AppWidgetManager* of JVMObject:
  proc getInstance*(context: Context): AppWidgetManager {.`static`.}
  proc updateAppWidget*(appWidgetIds: seq[jint], views: RemoteViews)
  proc updateAppWidgetOptions*(appWidgetId: jint, options: Bundle)
  proc getAppWidgetOptions*(appWidgetId: jint): Bundle
  proc updateAppWidget*(appWidgetId: jint, views: RemoteViews)
  proc partiallyUpdateAppWidget*(appWidgetIds: seq[jint], views: RemoteViews)
  proc partiallyUpdateAppWidget*(appWidgetId: jint, views: RemoteViews)
  proc updateAppWidget*(provider: ComponentName, views: RemoteViews)
  proc updateAppWidgetProviderInfo*(provider: ComponentName, metaDataKey: string)
  proc notifyAppWidgetViewDataChanged*(appWidgetIds: seq[jint], viewId: jint)
  proc notifyAppWidgetViewDataChanged*(appWidgetId: jint, viewId: jint)
  proc getInstalledProvidersForProfile*(profile: UserHandle): List[AppWidgetProviderInfo]
  proc getInstalledProvidersForPackage*(packageName: string, profile: UserHandle): List[AppWidgetProviderInfo]
  proc getInstalledProviders*(): List[AppWidgetProviderInfo]
  proc getInstalledProviders*(categoryFilter: jint): List[AppWidgetProviderInfo]
  proc getInstalledProvidersForProfile*(categoryFilter: jint, profile: UserHandle, packageName: string): List[AppWidgetProviderInfo]
  proc getAppWidgetInfo*(appWidgetId: jint): AppWidgetProviderInfo
  proc bindAppWidgetId*(appWidgetId: jint, provider: ComponentName)
  proc bindAppWidgetId*(appWidgetId: jint, provider: ComponentName, options: Bundle)
  proc bindAppWidgetIdIfAllowed*(appWidgetId: jint, provider: ComponentName): jboolean
  proc bindAppWidgetIdIfAllowed*(appWidgetId: jint, provider: ComponentName, options: Bundle): jboolean
  proc bindAppWidgetIdIfAllowed*(appWidgetId: jint, user: UserHandle, provider: ComponentName, options: Bundle): jboolean
  proc hasBindAppWidgetPermission*(packageName: string, userId: jint): jboolean
  proc hasBindAppWidgetPermission*(packageName: string): jboolean
  proc setBindAppWidgetPermission*(packageName: string, permission: jboolean)
  proc setBindAppWidgetPermission*(packageName: string, userId: jint, permission: jboolean)
  proc bindRemoteViewsService*(context: Context, appWidgetId: jint, intent: Intent, connection: IServiceConnection, flags: jint): jboolean
  proc getAppWidgetIds*(provider: ComponentName): seq[jint]
  proc isBoundWidgetPackage*(packageName: string, userId: jint): jboolean
  proc isRequestPinAppWidgetSupported*(): jboolean
  proc requestPinAppWidget*(provider: ComponentName, successCallback: PendingIntent): jboolean
  proc requestPinAppWidget*(provider: ComponentName, extras: Bundle, successCallback: PendingIntent): jboolean
  proc noteAppWidgetTapped*(appWidgetId: jint)
  proc setWidgetPreview*(provider: ComponentName, widgetCategories: jint, preview: RemoteViews): jboolean
  proc getWidgetPreview*(provider: ComponentName, profile: UserHandle, widgetCategory: jint): RemoteViews
  proc removeWidgetPreview*(provider: ComponentName, widgetCategories: jint)
  proc createWidgetInteractionEvent*(appWidgetId: jint, durationMs: jlong, position: Rect, clickedIds: seq[jint], scrolledIds: seq[jint]): PersistableBundle {.`static`.}
  ACTION_APPWIDGET_PICK*: string {.`static`.}
  ACTION_KEYGUARD_APPWIDGET_PICK*: string {.`static`.}
  ACTION_APPWIDGET_BIND*: string {.`static`.}
  ACTION_APPWIDGET_CONFIGURE*: string {.`static`.}
  EXTRA_APPWIDGET_ID*: string {.`static`.}
  OPTION_APPWIDGET_RESTORE_COMPLETED*: string {.`static`.}
  OPTION_APPWIDGET_MIN_WIDTH*: string {.`static`.}
  OPTION_APPWIDGET_MIN_HEIGHT*: string {.`static`.}
  OPTION_APPWIDGET_MAX_WIDTH*: string {.`static`.}
  OPTION_APPWIDGET_MAX_HEIGHT*: string {.`static`.}
  OPTION_APPWIDGET_SIZES*: string {.`static`.}
  OPTION_APPWIDGET_HOST_CATEGORY*: string {.`static`.}
  EXTRA_APPWIDGET_OPTIONS*: string {.`static`.}
  EXTRA_APPWIDGET_IDS*: string {.`static`.}
  EXTRA_APPWIDGET_PROVIDER*: string {.`static`.}
  EXTRA_APPWIDGET_PROVIDER_PROFILE*: string {.`static`.}
  EXTRA_CUSTOM_INFO*: string {.`static`.}
  EXTRA_HOST_ID*: string {.`static`.}
  EXTRA_CUSTOM_EXTRAS*: string {.`static`.}
  EXTRA_CATEGORY_FILTER*: string {.`static`.}
  EXTRA_CUSTOM_SORT*: string {.`static`.}
  INVALID_APPWIDGET_ID*: jint {.`static`.}
  ACTION_APPWIDGET_UPDATE*: string {.`static`.}
  ACTION_APPWIDGET_ENABLE_AND_UPDATE*: string {.`static`.}
  ACTION_APPWIDGET_OPTIONS_CHANGED*: string {.`static`.}
  ACTION_APPWIDGET_DELETED*: string {.`static`.}
  ACTION_APPWIDGET_DISABLED*: string {.`static`.}
  ACTION_APPWIDGET_ENABLED*: string {.`static`.}
  ACTION_APPWIDGET_RESTORED*: string {.`static`.}
  ACTION_APPWIDGET_HOST_RESTORED*: string {.`static`.}
  EVENT_TYPE_WIDGET_INTERACTION*: string {.`static`.}
  EVENT_CATEGORY_APPWIDGET*: string {.`static`.}
  EXTRA_EVENT_CLICKED_VIEWS*: string {.`static`.}
  EXTRA_EVENT_SCROLLED_VIEWS*: string {.`static`.}
  EXTRA_EVENT_DURATION_MS*: string {.`static`.}
  EXTRA_EVENT_POSITION_RECT*: string {.`static`.}
  EXTRA_APPWIDGET_OLD_IDS*: string {.`static`.}
  EXTRA_APPWIDGET_PREVIEW*: string {.`static`.}
  META_DATA_APPWIDGET_PROVIDER*: string {.`static`.}

jclass android.appwidget.AppWidgetManager.ServiceCollectionCache* of JVMObject:
  proc connectAndConsume*(intent: Intent, task: Consumer[IBinder], executor: Executor)

jclass android.appwidget.ServiceCollectionCache* of JVMObject:
  proc connectAndConsume*(intent: Intent, task: Consumer[IBinder], executor: Executor)

