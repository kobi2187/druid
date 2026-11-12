import jnim

jclass android.widget.ImageSwitcher* of ViewSwitcher:
  proc setImageResource*(resid: jint)
  proc setImageURI*(uri: Uri)
  proc setImageDrawable*(drawable: Drawable)
  proc getAccessibilityClassName*(): CharSequence

