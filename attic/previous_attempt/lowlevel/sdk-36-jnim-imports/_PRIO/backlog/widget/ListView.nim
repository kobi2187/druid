import jnim

jclass android.widget.ListView* of AbsListView:
  proc getMaxScrollAmount*(): jint
  proc addHeaderView*(v: View, data: JObject, isSelectable: jboolean)
  proc addHeaderView*(v: View)
  proc getHeaderViewsCount*(): jint
  proc removeHeaderView*(v: View): jboolean
  proc addFooterView*(v: View, data: JObject, isSelectable: jboolean)
  proc addFooterView*(v: View)
  proc getFooterViewsCount*(): jint
  proc removeFooterView*(v: View): jboolean
  proc getAdapter*(): ListAdapter
  proc setRemoteViewsAdapter*(intent: Intent)
  proc setAdapter*(adapter: ListAdapter)
  proc requestChildRectangleOnScreen*(child: View, rect: Rect, immediate: jboolean): jboolean
  proc smoothScrollToPosition*(position: jint)
  proc smoothScrollByOffset*(offset: jint)
  proc setSelection*(position: jint)
  proc setSelectionAfterHeaderView*()
  proc dispatchKeyEvent*(event: KeyEvent): jboolean
  proc onKeyDown*(keyCode: jint, event: KeyEvent): jboolean
  proc onKeyMultiple*(keyCode: jint, repeatCount: jint, event: KeyEvent): jboolean
  proc onKeyUp*(keyCode: jint, event: KeyEvent): jboolean
  proc setItemsCanFocus*(itemsCanFocus: jboolean)
  proc getItemsCanFocus*(): jboolean
  proc isOpaque*(): jboolean
  proc setCacheColorHint*(color: jint)
  proc getDivider*(): Drawable
  proc setDivider*(divider: Drawable)
  proc getDividerHeight*(): jint
  proc setDividerHeight*(height: jint)
  proc setHeaderDividersEnabled*(headerDividersEnabled: jboolean)
  proc areHeaderDividersEnabled*(): jboolean
  proc setFooterDividersEnabled*(footerDividersEnabled: jboolean)
  proc areFooterDividersEnabled*(): jboolean
  proc setOverscrollHeader*(header: Drawable)
  proc getOverscrollHeader*(): Drawable
  proc setOverscrollFooter*(footer: Drawable)
  proc getOverscrollFooter*(): Drawable
  proc getCheckItemIds*(): seq[jlong]
  proc getAccessibilityClassName*(): CharSequence
  proc onInitializeAccessibilityNodeInfoInternal*(info: AccessibilityNodeInfo)
  proc performAccessibilityActionInternal*(action: jint, arguments: Bundle): jboolean
  proc onInitializeAccessibilityNodeInfoForItem*(view: View, position: jint, info: AccessibilityNodeInfo)

jclass android.widget.FixedViewInfo* of JVMObject:
  view*: View
  data*: JObject
  isSelectable*: jboolean

