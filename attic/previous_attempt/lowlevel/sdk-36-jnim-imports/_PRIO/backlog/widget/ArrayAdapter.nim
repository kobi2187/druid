import jnim

jclass android.widget.ArrayAdapter* of BaseAdapter:
  proc add*(object: T)
  proc addAll*(collection: Collection[? extends T])
  proc addAll*(items: T)
  proc insert*(object: T, index: jint)
  proc remove*(object: T)
  proc clear*()
  proc sort*(comparator: Comparator[? super T])
  proc notifyDataSetChanged*()
  proc setNotifyOnChange*(notifyOnChange: jboolean)
  proc getContext*(): Context
  proc getCount*(): jint
  proc getItem*(position: jint): T
  proc getPosition*(item: T): jint
  proc getItemId*(position: jint): jlong
  proc getView*(position: jint, convertView: View, parent: ViewGroup): View
  proc setDropDownViewResource*(resource: jint)
  proc setDropDownViewTheme*(theme: Resources.Theme)
  proc getDropDownViewTheme*(): Resources.Theme
  proc getDropDownView*(position: jint, convertView: View, parent: ViewGroup): View
  proc createFromResource*(context: Context, textArrayResId: jint, textViewResId: jint): ArrayAdapter[CharSequence] {.`static`.}
  proc getFilter*(): Filter
  proc getAutofillOptions*(): seq[CharSequence]

