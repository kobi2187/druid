import jnim

jclass android.widget.PositionMetadata* of JVMObject:
  proc recycle*()
  proc isExpanded*(): jboolean
  position*: ExpandableListPosition
  groupMetadata*: GroupMetadata
  groupInsertIndex*: jint

