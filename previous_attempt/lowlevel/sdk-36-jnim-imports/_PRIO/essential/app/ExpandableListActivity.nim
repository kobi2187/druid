import jnim

jclass android.app.ExpandableListActivity* of Activity:
  proc onCreateContextMenu*(menu: ContextMenu, v: View, menuInfo: ContextMenuInfo)
  proc onChildClick*(parent: ExpandableListView, v: View, groupPosition: jint, childPosition: jint, id: jlong): jboolean
  proc onGroupCollapse*(groupPosition: jint)
  proc onGroupExpand*(groupPosition: jint)
  proc onContentChanged*()
  proc setListAdapter*(adapter: ExpandableListAdapter)
  proc getExpandableListView*(): ExpandableListView
  proc getExpandableListAdapter*(): ExpandableListAdapter
  proc getSelectedId*(): jlong
  proc getSelectedPosition*(): jlong
  proc setSelectedChild*(groupPosition: jint, childPosition: jint, shouldExpandGroup: jboolean): jboolean
  proc setSelectedGroup*(groupPosition: jint)

