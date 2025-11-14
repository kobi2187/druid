import jnim

jclass android.widget.SimpleAdapter* of BaseAdapter:
  proc getCount*(): jint
  proc getItem*(position: jint): JObject
  proc getItemId*(position: jint): jlong
  proc getView*(position: jint, convertView: View, parent: ViewGroup): View
  proc setDropDownViewResource*(resource: jint)
  proc setDropDownViewTheme*(theme: Resources.Theme)
  proc getDropDownViewTheme*(): Resources.Theme
  proc getDropDownView*(position: jint, convertView: View, parent: ViewGroup): View
  proc getViewBinder*(): ViewBinder
  proc setViewBinder*(viewBinder: ViewBinder)
  proc setViewImage*(v: ImageView, value: jint)
  proc setViewImage*(v: ImageView, value: string)
  proc setViewText*(v: TextView, text: string)
  proc getFilter*(): Filter

