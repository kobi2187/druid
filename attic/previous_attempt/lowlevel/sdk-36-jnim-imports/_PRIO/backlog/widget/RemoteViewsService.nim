import jnim

jclass android.widget.RemoteViewsService* of Service:
  proc onBind*(intent: Intent): IBinder
  proc onGetViewFactory*(intent: Intent): RemoteViewsFactory

jclass android.widget.RemoteViewsService.RemoteViewsFactory* of JVMObject:
  proc onCreate*()
  proc onDataSetChanged*()
  proc onDestroy*()
  proc getCount*(): jint
  proc getViewAt*(position: jint): RemoteViews
  proc getLoadingView*(): RemoteViews
  proc getViewTypeCount*(): jint
  proc getItemId*(position: jint): jlong
  proc hasStableIds*(): jboolean

jclass android.widget.RemoteViewsFactory* of JVMObject:
  proc onCreate*()
  proc onDataSetChanged*()
  proc onDestroy*()
  proc getCount*(): jint
  proc getViewAt*(position: jint): RemoteViews
  proc getLoadingView*(): RemoteViews
  proc getViewTypeCount*(): jint
  proc getItemId*(position: jint): jlong
  proc hasStableIds*(): jboolean

