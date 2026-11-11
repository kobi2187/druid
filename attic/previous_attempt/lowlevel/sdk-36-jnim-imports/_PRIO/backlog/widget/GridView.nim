import jnim

jclass android.widget.GridView* of AbsListView:
  proc getAdapter*(): ListAdapter
  proc setRemoteViewsAdapter*(intent: Intent)
  proc setAdapter*(adapter: ListAdapter)
  proc smoothScrollToPosition*(position: jint)
  proc smoothScrollByOffset*(offset: jint)
  proc setSelection*(position: jint)
  proc onKeyDown*(keyCode: jint, event: KeyEvent): jboolean
  proc onKeyMultiple*(keyCode: jint, repeatCount: jint, event: KeyEvent): jboolean
  proc onKeyUp*(keyCode: jint, event: KeyEvent): jboolean
  proc setGravity*(gravity: jint)
  proc getGravity*(): jint
  proc setHorizontalSpacing*(horizontalSpacing: jint)
  proc getHorizontalSpacing*(): jint
  proc getRequestedHorizontalSpacing*(): jint
  proc setVerticalSpacing*(verticalSpacing: jint)
  proc getVerticalSpacing*(): jint
  proc setStretchMode*(stretchMode: jint)
  proc getStretchMode*(): jint
  proc setColumnWidth*(columnWidth: jint)
  proc getColumnWidth*(): jint
  proc getRequestedColumnWidth*(): jint
  proc setNumColumns*(numColumns: jint)
  proc getNumColumns*(): jint
  proc getAccessibilityClassName*(): CharSequence
  proc onInitializeAccessibilityNodeInfoInternal*(info: AccessibilityNodeInfo)
  proc performAccessibilityActionInternal*(action: jint, arguments: Bundle): jboolean
  proc onInitializeAccessibilityNodeInfoForItem*(view: View, position: jint, info: AccessibilityNodeInfo)
  NO_STRETCH*: jint {.`static`.}
  STRETCH_SPACING*: jint {.`static`.}
  STRETCH_COLUMN_WIDTH*: jint {.`static`.}
  STRETCH_SPACING_UNIFORM*: jint {.`static`.}
  AUTO_FIT*: jint {.`static`.}

