import jnim

jclass android.widget.TextSwitcher* of ViewSwitcher:
  proc addView*(child: View, index: jint, params: ViewGroup.LayoutParams)
  proc setText*(text: CharSequence)
  proc setCurrentText*(text: CharSequence)
  proc getAccessibilityClassName*(): CharSequence

