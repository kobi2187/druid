import jnim

jclass android.widget.CursorAdapter* of BaseAdapter:
  proc setDropDownViewTheme*(theme: Resources.Theme)
  proc getDropDownViewTheme*(): Resources.Theme
  proc getCursor*(): Cursor
  proc getCount*(): jint
  proc getItem*(position: jint): JObject
  proc getItemId*(position: jint): jlong
  proc hasStableIds*(): jboolean
  proc getView*(position: jint, convertView: View, parent: ViewGroup): View
  proc getDropDownView*(position: jint, convertView: View, parent: ViewGroup): View
  proc newView*(context: Context, cursor: Cursor, parent: ViewGroup): View
  proc newDropDownView*(context: Context, cursor: Cursor, parent: ViewGroup): View
  proc bindView*(view: View, context: Context, cursor: Cursor)
  proc changeCursor*(cursor: Cursor)
  proc swapCursor*(newCursor: Cursor): Cursor
  proc convertToString*(cursor: Cursor): CharSequence
  proc runQueryOnBackgroundThread*(constraint: CharSequence): Cursor
  proc getFilter*(): Filter
  proc getFilterQueryProvider*(): FilterQueryProvider
  proc setFilterQueryProvider*(filterQueryProvider: FilterQueryProvider)
  FLAG_AUTO_REQUERY*: jint {.`static`.}
  FLAG_REGISTER_CONTENT_OBSERVER*: jint {.`static`.}

