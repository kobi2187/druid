import jnim

jclass android.widget.SimpleCursorTreeAdapter* of ResourceCursorTreeAdapter:
  proc getViewBinder*(): ViewBinder
  proc setViewBinder*(viewBinder: ViewBinder)
  proc setViewText*(v: TextView, text: string)

