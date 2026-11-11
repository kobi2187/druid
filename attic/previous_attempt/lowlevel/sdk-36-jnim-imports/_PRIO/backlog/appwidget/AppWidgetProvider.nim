import jnim

jclass android.appwidget.AppWidgetProvider* of BroadcastReceiver:
  proc onReceive*(context: Context, intent: Intent)
  proc onUpdate*(context: Context, appWidgetManager: AppWidgetManager, appWidgetIds: seq[jint])
  proc onAppWidgetOptionsChanged*(context: Context, appWidgetManager: AppWidgetManager, appWidgetId: jint, newOptions: Bundle)
  proc onDeleted*(context: Context, appWidgetIds: seq[jint])
  proc onEnabled*(context: Context)
  proc onDisabled*(context: Context)
  proc onRestored*(context: Context, oldWidgetIds: seq[jint], newWidgetIds: seq[jint])

