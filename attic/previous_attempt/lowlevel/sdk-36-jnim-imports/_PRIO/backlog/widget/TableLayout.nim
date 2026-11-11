import jnim

jclass android.widget.TableLayout* of LinearLayout:
  proc setOnHierarchyChangeListener*(listener: OnHierarchyChangeListener)
  proc requestLayout*()
  proc isShrinkAllColumns*(): jboolean
  proc setShrinkAllColumns*(shrinkAllColumns: jboolean)
  proc isStretchAllColumns*(): jboolean
  proc setStretchAllColumns*(stretchAllColumns: jboolean)
  proc setColumnCollapsed*(columnIndex: jint, isCollapsed: jboolean)
  proc isColumnCollapsed*(columnIndex: jint): jboolean
  proc setColumnStretchable*(columnIndex: jint, isStretchable: jboolean)
  proc isColumnStretchable*(columnIndex: jint): jboolean
  proc setColumnShrinkable*(columnIndex: jint, isShrinkable: jboolean)
  proc isColumnShrinkable*(columnIndex: jint): jboolean
  proc addView*(child: View)
  proc addView*(child: View, index: jint)
  proc addView*(child: View, params: ViewGroup.LayoutParams)
  proc addView*(child: View, index: jint, params: ViewGroup.LayoutParams)
  proc generateLayoutParams*(attrs: AttributeSet): LayoutParams
  proc getAccessibilityClassName*(): CharSequence

jclass android.widget.LayoutParams* of LayoutParams:

