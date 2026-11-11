import jnim

jclass android.widget.HeaderViewListAdapter* of JVMObject:
  proc getHeadersCount*(): jint
  proc getFootersCount*(): jint
  proc isEmpty*(): jboolean
  proc removeHeader*(v: View): jboolean
  proc removeFooter*(v: View): jboolean
  proc getCount*(): jint
  proc areAllItemsEnabled*(): jboolean
  proc isEnabled*(position: jint): jboolean
  proc getItem*(position: jint): JObject
  proc getItemId*(position: jint): jlong
  proc hasStableIds*(): jboolean
  proc getView*(position: jint, convertView: View, parent: ViewGroup): View
  proc getItemViewType*(position: jint): jint
  proc getViewTypeCount*(): jint
  proc registerDataSetObserver*(observer: DataSetObserver)
  proc unregisterDataSetObserver*(observer: DataSetObserver)
  proc getFilter*(): Filter
  proc getWrappedAdapter*(): ListAdapter

