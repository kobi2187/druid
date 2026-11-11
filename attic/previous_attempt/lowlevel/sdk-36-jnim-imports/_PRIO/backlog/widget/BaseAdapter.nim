import jnim

jclass android.widget.BaseAdapter* of JVMObject:
  proc hasStableIds*(): jboolean
  proc registerDataSetObserver*(observer: DataSetObserver)
  proc unregisterDataSetObserver*(observer: DataSetObserver)
  proc notifyDataSetChanged*()
  proc notifyDataSetInvalidated*()
  proc areAllItemsEnabled*(): jboolean
  proc isEnabled*(position: jint): jboolean
  proc getDropDownView*(position: jint, convertView: View, parent: ViewGroup): View
  proc getItemViewType*(position: jint): jint
  proc getViewTypeCount*(): jint
  proc isEmpty*(): jboolean
  proc getAutofillOptions*(): seq[CharSequence]
  proc setAutofillOptions*(options: CharSequence)

