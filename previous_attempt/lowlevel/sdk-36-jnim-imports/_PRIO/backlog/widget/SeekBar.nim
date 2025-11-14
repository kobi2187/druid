import jnim

jclass android.widget.SeekBar* of AbsSeekBar:
  proc setOnSeekBarChangeListener*(l: OnSeekBarChangeListener)
  proc getAccessibilityClassName*(): CharSequence
  proc onInitializeAccessibilityNodeInfoInternal*(info: AccessibilityNodeInfo)

