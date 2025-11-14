import jnim

jclass android.widget.SimpleExpandableListAdapter* of BaseExpandableListAdapter:
  proc getChild*(groupPosition: jint, childPosition: jint): JObject
  proc getChildId*(groupPosition: jint, childPosition: jint): jlong
  proc getChildView*(groupPosition: jint, childPosition: jint, isLastChild: jboolean, convertView: View, parent: ViewGroup): View
  proc newChildView*(isLastChild: jboolean, parent: ViewGroup): View
  proc getChildrenCount*(groupPosition: jint): jint
  proc getGroup*(groupPosition: jint): JObject
  proc getGroupCount*(): jint
  proc getGroupId*(groupPosition: jint): jlong
  proc getGroupView*(groupPosition: jint, isExpanded: jboolean, convertView: View, parent: ViewGroup): View
  proc newGroupView*(isExpanded: jboolean, parent: ViewGroup): View
  proc isChildSelectable*(groupPosition: jint, childPosition: jint): jboolean
  proc hasStableIds*(): jboolean

