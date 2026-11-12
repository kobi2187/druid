import jnim

jclass android.widget.Button* of TextView:
  proc getAccessibilityClassName*(): CharSequence
  proc onResolvePointerIcon*(event: MotionEvent, pointerIndex: jint): PointerIcon

