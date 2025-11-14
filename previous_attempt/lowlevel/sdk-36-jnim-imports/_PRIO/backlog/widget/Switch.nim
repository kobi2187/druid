import jnim

jclass android.widget.Switch* of CompoundButton:
  proc setSwitchTextAppearance*(context: Context, resid: jint)
  proc setSwitchTypeface*(tf: Typeface, style: jint)
  proc setSwitchTypeface*(tf: Typeface)
  proc setSwitchPadding*(pixels: jint)
  proc getSwitchPadding*(): jint
  proc setSwitchMinWidth*(pixels: jint)
  proc getSwitchMinWidth*(): jint
  proc setThumbTextPadding*(pixels: jint)
  proc getThumbTextPadding*(): jint
  proc setTrackDrawable*(track: Drawable)
  proc setTrackResource*(resId: jint)
  proc setTrackResourceAsync*(resId: jint): Runnable
  proc getTrackDrawable*(): Drawable
  proc setTrackIcon*(icon: Icon)
  proc setTrackIconAsync*(icon: Icon): Runnable
  proc setTrackTintList*(tint: ColorStateList)
  proc getTrackTintList*(): ColorStateList
  proc setTrackTintMode*(tintMode: PorterDuff.Mode)
  proc setTrackTintBlendMode*(blendMode: BlendMode)
  proc getTrackTintMode*(): PorterDuff.Mode
  proc getTrackTintBlendMode*(): BlendMode
  proc setThumbDrawable*(thumb: Drawable)
  proc setThumbResource*(resId: jint)
  proc setThumbResourceAsync*(resId: jint): Runnable
  proc getThumbDrawable*(): Drawable
  proc setThumbIcon*(icon: Icon)
  proc setThumbIconAsync*(icon: Icon): Runnable
  proc setThumbTintList*(tint: ColorStateList)
  proc getThumbTintList*(): ColorStateList
  proc setThumbTintMode*(tintMode: PorterDuff.Mode)
  proc setThumbTintBlendMode*(blendMode: BlendMode)
  proc getThumbTintMode*(): PorterDuff.Mode
  proc getThumbTintBlendMode*(): BlendMode
  proc setSplitTrack*(splitTrack: jboolean)
  proc getSplitTrack*(): jboolean
  proc getTextOn*(): CharSequence
  proc setTextOn*(textOn: CharSequence)
  proc getTextOff*(): CharSequence
  proc setTextOff*(textOff: CharSequence)
  proc setShowText*(showText: jboolean)
  proc getShowText*(): jboolean
  proc onMeasure*(widthMeasureSpec: jint, heightMeasureSpec: jint)
  proc onPopulateAccessibilityEventInternal*(event: AccessibilityEvent)
  proc onTouchEvent*(ev: MotionEvent): jboolean
  proc toggle*()
  proc setChecked*(checked: jboolean)
  proc draw*(c: Canvas)
  proc getCompoundPaddingLeft*(): jint
  proc getCompoundPaddingRight*(): jint
  proc drawableHotspotChanged*(x: jfloat, y: jfloat)
  proc jumpDrawablesToCurrentState*()
  proc getAccessibilityClassName*(): CharSequence

