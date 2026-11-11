import jnim

jclass android.widget.BaseExpandableListAdapter* of JVMObject:
  proc registerDataSetObserver*(observer: DataSetObserver)
  proc unregisterDataSetObserver*(observer: DataSetObserver)
  proc notifyDataSetInvalidated*()
  proc notifyDataSetChanged*()
  proc areAllItemsEnabled*(): jboolean
  proc onGroupCollapsed*(groupPosition: jint)
  proc onGroupExpanded*(groupPosition: jint)
  proc getCombinedChildId*(groupId: jlong, childId: jlong): jlong
  proc getCombinedGroupId*(groupId: jlong): jlong
  proc isEmpty*(): jboolean
  proc getChildType*(groupPosition: jint, childPosition: jint): jint
  proc getChildTypeCount*(): jint
  proc getGroupType*(groupPosition: jint): jint
  proc getGroupTypeCount*(): jint

