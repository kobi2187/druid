import jnim

jclass android.widget.ToggleButton* of CompoundButton:
  proc setChecked*(checked: jboolean)
  proc getTextOn*(): CharSequence
  proc setTextOn*(textOn: CharSequence)
  proc getTextOff*(): CharSequence
  proc setTextOff*(textOff: CharSequence)
  proc getDisabledAlpha*(): jfloat
  proc setBackgroundDrawable*(d: Drawable)
  proc getAccessibilityClassName*(): CharSequence

