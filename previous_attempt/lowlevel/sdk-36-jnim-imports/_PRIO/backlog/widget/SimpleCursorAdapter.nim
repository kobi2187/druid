import jnim

jclass android.widget.SimpleCursorAdapter* of ResourceCursorAdapter:
  proc bindView*(view: View, context: Context, cursor: Cursor)
  proc getViewBinder*(): ViewBinder
  proc setViewBinder*(viewBinder: ViewBinder)
  proc setViewImage*(v: ImageView, value: string)
  proc setViewText*(v: TextView, text: string)
  proc getStringConversionColumn*(): jint
  proc setStringConversionColumn*(stringConversionColumn: jint)
  proc getCursorToStringConverter*(): CursorToStringConverter
  proc setCursorToStringConverter*(cursorToStringConverter: CursorToStringConverter)
  proc convertToString*(cursor: Cursor): CharSequence
  proc swapCursor*(c: Cursor): Cursor
  proc changeCursorAndColumns*(c: Cursor, from: seq[string], to: seq[jint])


