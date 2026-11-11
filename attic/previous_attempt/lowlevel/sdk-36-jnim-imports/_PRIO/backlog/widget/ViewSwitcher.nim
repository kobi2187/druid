import jnim

jclass android.widget.ViewSwitcher* of ViewAnimator:
  proc addView*(child: View, index: jint, params: ViewGroup.LayoutParams)
  proc getAccessibilityClassName*(): CharSequence
  proc getNextView*(): View
  proc setFactory*(factory: ViewFactory)
  proc reset*()

