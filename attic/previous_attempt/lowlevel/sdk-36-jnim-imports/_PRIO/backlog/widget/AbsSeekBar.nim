import jnim

jclass android.widget.AbsSeekBar* of ProgressBar:
  proc setThumb*(thumb: Drawable)
  proc getThumb*(): Drawable
  proc setThumbTintList*(tint: ColorStateList)
  proc getThumbTintList*(): ColorStateList
  proc setThumbTintMode*(tintMode: PorterDuff.Mode)
  proc setThumbTintBlendMode*(blendMode: BlendMode)
  proc getThumbTintMode*(): PorterDuff.Mode
  proc getThumbTintBlendMode*(): BlendMode
  proc getThumbOffset*(): jint
  proc setThumbOffset*(thumbOffset: jint)
  proc setSplitTrack*(splitTrack: jboolean)
  proc getSplitTrack*(): jboolean
  proc setTickMark*(tickMark: Drawable)
  proc getTickMark*(): Drawable
  proc setTickMarkTintList*(tint: ColorStateList)
  proc getTickMarkTintList*(): ColorStateList
  proc setTickMarkTintMode*(tintMode: PorterDuff.Mode)
  proc setTickMarkTintBlendMode*(blendMode: BlendMode)
  proc getTickMarkTintMode*(): PorterDuff.Mode
  proc getTickMarkTintBlendMode*(): BlendMode
  proc setKeyProgressIncrement*(increment: jint)
  proc getKeyProgressIncrement*(): jint
  proc setMin*(min: jint)
  proc setMax*(max: jint)
  proc jumpDrawablesToCurrentState*()
  proc drawableHotspotChanged*(x: jfloat, y: jfloat)
  proc setSystemGestureExclusionRects*(rects: List[Rect])
  proc growRectTo*(r: Rect, minimumSize: jint)
  proc onResolveDrawables*(layoutDirection: jint)
  proc onTouchEvent*(event: MotionEvent): jboolean
  proc onKeyDown*(keyCode: jint, event: KeyEvent): jboolean
  proc getAccessibilityClassName*(): CharSequence
  proc onInitializeAccessibilityNodeInfoInternal*(info: AccessibilityNodeInfo)
  proc performAccessibilityActionInternal*(action: jint, arguments: Bundle): jboolean
  proc onRtlPropertiesChanged*(layoutDirection: jint)

