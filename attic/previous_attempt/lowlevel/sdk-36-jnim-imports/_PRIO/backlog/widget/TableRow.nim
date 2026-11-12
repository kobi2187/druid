import jnim

jclass android.widget.TableRow* of LinearLayout:
  proc setOnHierarchyChangeListener*(listener: OnHierarchyChangeListener)
  proc getVirtualChildAt*(i: jint): View
  proc getVirtualChildCount*(): jint
  proc generateLayoutParams*(attrs: AttributeSet): LayoutParams
  proc getAccessibilityClassName*(): CharSequence

jclass android.widget.LayoutParams* of LayoutParams:
  column*: jint
  span*: jint

