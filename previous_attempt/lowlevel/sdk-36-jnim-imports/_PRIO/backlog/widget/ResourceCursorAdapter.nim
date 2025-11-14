import jnim

jclass android.widget.ResourceCursorAdapter* of CursorAdapter:
  proc setDropDownViewTheme*(theme: Resources.Theme)
  proc newView*(context: Context, cursor: Cursor, parent: ViewGroup): View
  proc newDropDownView*(context: Context, cursor: Cursor, parent: ViewGroup): View
  proc setViewResource*(layout: jint)
  proc setDropDownViewResource*(dropDownLayout: jint)

