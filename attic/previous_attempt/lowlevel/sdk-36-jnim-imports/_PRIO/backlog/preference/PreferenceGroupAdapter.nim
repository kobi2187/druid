import jnim

jclass android.preference.PreferenceGroupAdapter* of BaseAdapter:
  proc getCount*(): jint
  proc getItem*(position: jint): Preference
  proc getItemId*(position: jint): jlong
  proc setHighlighted*(position: jint)
  proc setHighlightedDrawable*(drawable: Drawable)
  proc getView*(position: jint, convertView: View, parent: ViewGroup): View
  proc isEnabled*(position: jint): jboolean
  proc areAllItemsEnabled*(): jboolean
  proc onPreferenceChange*(preference: Preference)
  proc onPreferenceHierarchyChange*(preference: Preference)
  proc hasStableIds*(): jboolean
  proc getItemViewType*(position: jint): jint
  proc getViewTypeCount*(): jint

