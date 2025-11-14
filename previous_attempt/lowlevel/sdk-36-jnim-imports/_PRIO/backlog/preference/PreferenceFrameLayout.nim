import jnim

jclass android.preference.PreferenceFrameLayout* of FrameLayout:
  proc generateLayoutParams*(attrs: AttributeSet): LayoutParams
  proc addView*(child: View)

jclass android.preference.LayoutParams* of LayoutParams:
  removeBorders*: jboolean

