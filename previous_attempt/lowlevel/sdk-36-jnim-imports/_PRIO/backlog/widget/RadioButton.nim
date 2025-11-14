import jnim

jclass android.widget.RadioButton* of CompoundButton:
  proc toggle*()
  proc getAccessibilityClassName*(): CharSequence
  proc onInitializeAccessibilityNodeInfo*(info: AccessibilityNodeInfo)

