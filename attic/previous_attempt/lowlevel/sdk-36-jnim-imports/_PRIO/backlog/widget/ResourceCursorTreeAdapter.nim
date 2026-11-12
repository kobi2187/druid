import jnim

jclass android.widget.ResourceCursorTreeAdapter* of CursorTreeAdapter:
  proc newChildView*(context: Context, cursor: Cursor, isLastChild: jboolean, parent: ViewGroup): View
  proc newGroupView*(context: Context, cursor: Cursor, isExpanded: jboolean, parent: ViewGroup): View

