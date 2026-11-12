import jnim

jclass android.widget.AdapterView* of ViewGroup:
  proc setOnItemClickListener*(listener: OnItemClickListener)
  proc getOnItemClickListener*(): OnItemClickListener
  proc performItemClick*(view: View, position: jint, id: jlong): jboolean
  proc setOnItemLongClickListener*(listener: OnItemLongClickListener)
  proc getOnItemLongClickListener*(): OnItemLongClickListener
  proc setOnItemSelectedListener*(listener: OnItemSelectedListener)
  proc getOnItemSelectedListener*(): OnItemSelectedListener
  proc getAdapter*(): T
  proc setAdapter*(adapter: T)
  proc addView*(child: View)
  proc addView*(child: View, index: jint)
  proc addView*(child: View, params: LayoutParams)
  proc addView*(child: View, index: jint, params: LayoutParams)
  proc removeView*(child: View)
  proc removeViewAt*(index: jint)
  proc removeAllViews*()
  proc getSelectedItemPosition*(): jint
  proc getSelectedItemId*(): jlong
  proc getSelectedView*(): View
  proc getSelectedItem*(): JObject
  proc getCount*(): jint
  proc getPositionForView*(view: View): jint
  proc getFirstVisiblePosition*(): jint
  proc getLastVisiblePosition*(): jint
  proc setSelection*(position: jint)
  proc setEmptyView*(emptyView: View)
  proc getEmptyView*(): View
  proc setFocusable*(focusable: jint)
  proc setFocusableInTouchMode*(focusable: jboolean)
  proc getItemAtPosition*(position: jint): JObject
  proc getItemIdAtPosition*(position: jint): jlong
  proc setOnClickListener*(l: OnClickListener)
  proc dispatchPopulateAccessibilityEventInternal*(event: AccessibilityEvent): jboolean
  proc onRequestSendAccessibilityEventInternal*(child: View, event: AccessibilityEvent): jboolean
  proc getAccessibilityClassName*(): CharSequence
  proc onInitializeAccessibilityNodeInfoInternal*(info: AccessibilityNodeInfo)
  proc onInitializeAccessibilityEventInternal*(event: AccessibilityEvent)
  proc onProvideAutofillStructure*(structure: ViewStructure, flags: jint)
  ITEM_VIEW_TYPE_IGNORE*: jint {.`static`.}
  ITEM_VIEW_TYPE_HEADER_OR_FOOTER*: jint {.`static`.}
  INVALID_POSITION*: jint {.`static`.}
  INVALID_ROW_ID*: jlong {.`static`.}



jclass android.widget.AdapterContextMenuInfo* of JVMObject:
  targetView*: View
  position*: jint
  id*: jlong

