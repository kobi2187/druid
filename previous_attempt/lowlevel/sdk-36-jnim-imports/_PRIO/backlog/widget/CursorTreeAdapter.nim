import jnim

jclass android.widget.CursorTreeAdapter* of BaseExpandableListAdapter:
  proc setGroupCursor*(cursor: Cursor)
  proc setChildrenCursor*(groupPosition: jint, childrenCursor: Cursor)
  proc getChild*(groupPosition: jint, childPosition: jint): Cursor
  proc getChildId*(groupPosition: jint, childPosition: jint): jlong
  proc getChildrenCount*(groupPosition: jint): jint
  proc getGroup*(groupPosition: jint): Cursor
  proc getGroupCount*(): jint
  proc getGroupId*(groupPosition: jint): jlong
  proc getGroupView*(groupPosition: jint, isExpanded: jboolean, convertView: View, parent: ViewGroup): View
  proc getChildView*(groupPosition: jint, childPosition: jint, isLastChild: jboolean, convertView: View, parent: ViewGroup): View
  proc isChildSelectable*(groupPosition: jint, childPosition: jint): jboolean
  proc hasStableIds*(): jboolean
  proc notifyDataSetChanged*()
  proc notifyDataSetChanged*(releaseCursors: jboolean)
  proc notifyDataSetInvalidated*()
  proc onGroupCollapsed*(groupPosition: jint)
  proc convertToString*(cursor: Cursor): string
  proc runQueryOnBackgroundThread*(constraint: CharSequence): Cursor
  proc getFilter*(): Filter
  proc getFilterQueryProvider*(): FilterQueryProvider
  proc setFilterQueryProvider*(filterQueryProvider: FilterQueryProvider)
  proc changeCursor*(cursor: Cursor)
  proc getCursor*(): Cursor

