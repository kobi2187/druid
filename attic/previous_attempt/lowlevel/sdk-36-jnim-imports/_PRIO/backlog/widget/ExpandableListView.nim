import jnim

jclass android.widget.ExpandableListView* of ListView:
  proc onRtlPropertiesChanged*(layoutDirection: jint)
  proc setChildDivider*(childDivider: Drawable)
  proc setAdapter*(adapter: ListAdapter)
  proc getAdapter*(): ListAdapter
  proc setOnItemClickListener*(l: OnItemClickListener)
  proc setAdapter*(adapter: ExpandableListAdapter)
  proc getExpandableListAdapter*(): ExpandableListAdapter
  proc performItemClick*(v: View, position: jint, id: jlong): jboolean
  proc expandGroup*(groupPos: jint): jboolean
  proc expandGroup*(groupPos: jint, animate: jboolean): jboolean
  proc collapseGroup*(groupPos: jint): jboolean
  proc setOnGroupCollapseListener*(onGroupCollapseListener: OnGroupCollapseListener)
  proc setOnGroupExpandListener*(onGroupExpandListener: OnGroupExpandListener)
  proc setOnGroupClickListener*(onGroupClickListener: OnGroupClickListener)
  proc setOnChildClickListener*(onChildClickListener: OnChildClickListener)
  proc getExpandableListPosition*(flatListPosition: jint): jlong
  proc getFlatListPosition*(packedPosition: jlong): jint
  proc getSelectedPosition*(): jlong
  proc getSelectedId*(): jlong
  proc setSelectedGroup*(groupPosition: jint)
  proc setSelectedChild*(groupPosition: jint, childPosition: jint, shouldExpandGroup: jboolean): jboolean
  proc isGroupExpanded*(groupPosition: jint): jboolean
  proc getPackedPositionType*(packedPosition: jlong): jint {.`static`.}
  proc getPackedPositionGroup*(packedPosition: jlong): jint {.`static`.}
  proc getPackedPositionChild*(packedPosition: jlong): jint {.`static`.}
  proc getPackedPositionForChild*(groupPosition: jint, childPosition: jint): jlong {.`static`.}
  proc getPackedPositionForGroup*(groupPosition: jint): jlong {.`static`.}
  proc onInitializeAccessibilityNodeInfoForItem*(view: View, position: jint, info: AccessibilityNodeInfo)
  proc setChildIndicator*(childIndicator: Drawable)
  proc setChildIndicatorBounds*(left: jint, right: jint)
  proc setChildIndicatorBoundsRelative*(start: jint, end: jint)
  proc setGroupIndicator*(groupIndicator: Drawable)
  proc setIndicatorBounds*(left: jint, right: jint)
  proc setIndicatorBoundsRelative*(start: jint, end: jint)
  proc onSaveInstanceState*(): Parcelable
  proc onRestoreInstanceState*(state: Parcelable)
  proc getAccessibilityClassName*(): CharSequence
  PACKED_POSITION_TYPE_GROUP*: jint {.`static`.}
  PACKED_POSITION_TYPE_CHILD*: jint {.`static`.}
  PACKED_POSITION_TYPE_NULL*: jint {.`static`.}
  PACKED_POSITION_VALUE_NULL*: jlong {.`static`.}
  CHILD_INDICATOR_INHERIT*: jint {.`static`.}




jclass android.widget.ExpandableListContextMenuInfo* of JVMObject:
  targetView*: View
  packedPosition*: jlong
  id*: jlong

