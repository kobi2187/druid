import jnim

jclass android.widget.ImageButton* of ImageView:
  proc getAccessibilityClassName*(): CharSequence
  proc onResolvePointerIcon*(event: MotionEvent, pointerIndex: jint): PointerIcon

