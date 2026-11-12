import jnim

jclass android.appwidget.AppWidgetHost* of JVMObject:
  proc startListening*()
  proc stopListening*()
  proc allocateAppWidgetId*(): jint
  proc getIntentSenderForConfigureActivity*(appWidgetId: jint, intentFlags: jint): IntentSender
  proc startAppWidgetConfigureActivityForResult*(activity: Activity, appWidgetId: jint, intentFlags: jint, requestCode: jint, options: Bundle)
  proc setAppWidgetHidden*()
  proc setInteractionHandler*(interactionHandler: InteractionHandler)
  proc getAppWidgetIds*(): seq[jint]
  proc deleteAppWidgetId*(appWidgetId: jint)
  proc deleteHost*()
  proc deleteAllHosts*() {.`static`.}
  proc createView*(context: Context, appWidgetId: jint, appWidget: AppWidgetProviderInfo): AppWidgetHostView
  proc onAppWidgetRemoved*(appWidgetId: jint)
  proc setListener*(appWidgetId: jint, listener: AppWidgetHostListener)
  proc removeListener*(appWidgetId: jint)

