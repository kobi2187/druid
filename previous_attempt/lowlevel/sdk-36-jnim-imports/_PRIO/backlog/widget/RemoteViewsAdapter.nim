import jnim

jclass android.widget.RemoteViewsAdapter* of BaseAdapter:
  proc isDataReady*(): jboolean
  proc setRemoteViewsInteractionHandler*(handler: InteractionHandler)
  proc saveRemoteViewsCache*()
  proc getRemoteViewsServiceIntent*(): Intent
  proc getCount*(): jint
  proc getItem*(position: jint): JObject
  proc getItemId*(position: jint): jlong
  proc getItemViewType*(position: jint): jint
  proc setVisibleRangeHint*(lowerBound: jint, upperBound: jint)
  proc getView*(position: jint, convertView: View, parent: ViewGroup): View
  proc getViewTypeCount*(): jint
  proc hasStableIds*(): jboolean
  proc isEmpty*(): jboolean
  proc notifyDataSetChanged*()
  proc handleMessage*(msg: Message): jboolean

jclass android.widget.RemoteViewsAdapter.AsyncRemoteAdapterAction* of JVMObject:
  proc run*()


jclass android.widget.AsyncRemoteAdapterAction* of JVMObject:
  proc run*()

