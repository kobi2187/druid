import jnim

jclass android.widget.ProgressBar* of View:
  proc setMinWidth*(minWidth: jint)
  proc getMinWidth*(): jint
  proc setMaxWidth*(maxWidth: jint)
  proc getMaxWidth*(): jint
  proc setMinHeight*(minHeight: jint)
  proc getMinHeight*(): jint
  proc setMaxHeight*(maxHeight: jint)
  proc getMaxHeight*(): jint
  proc isIndeterminate*(): jboolean
  proc setIndeterminate*(indeterminate: jboolean)
  proc getIndeterminateDrawable*(): Drawable
  proc setIndeterminateDrawable*(d: Drawable)
  proc setIndeterminateTintList*(tint: ColorStateList)
  proc getIndeterminateTintList*(): ColorStateList
  proc setIndeterminateTintMode*(tintMode: PorterDuff.Mode)
  proc setIndeterminateTintBlendMode*(blendMode: BlendMode)
  proc getIndeterminateTintMode*(): PorterDuff.Mode
  proc getIndeterminateTintBlendMode*(): BlendMode
  proc setIndeterminateDrawableTiled*(d: Drawable)
  proc getProgressDrawable*(): Drawable
  proc setProgressDrawable*(d: Drawable)
  proc getMirrorForRtl*(): jboolean
  proc setProgressTintList*(tint: ColorStateList)
  proc getProgressTintList*(): ColorStateList
  proc setProgressTintMode*(tintMode: PorterDuff.Mode)
  proc setProgressTintBlendMode*(blendMode: BlendMode)
  proc getProgressTintMode*(): PorterDuff.Mode
  proc getProgressTintBlendMode*(): BlendMode
  proc setProgressBackgroundTintList*(tint: ColorStateList)
  proc getProgressBackgroundTintList*(): ColorStateList
  proc setProgressBackgroundTintMode*(tintMode: PorterDuff.Mode)
  proc setProgressBackgroundTintBlendMode*(blendMode: BlendMode)
  proc getProgressBackgroundTintMode*(): PorterDuff.Mode
  proc getProgressBackgroundTintBlendMode*(): BlendMode
  proc setSecondaryProgressTintList*(tint: ColorStateList)
  proc getSecondaryProgressTintList*(): ColorStateList
  proc setSecondaryProgressTintMode*(tintMode: PorterDuff.Mode)
  proc setSecondaryProgressTintBlendMode*(blendMode: BlendMode)
  proc getSecondaryProgressTintMode*(): PorterDuff.Mode
  proc getSecondaryProgressTintBlendMode*(): BlendMode
  proc setProgressDrawableTiled*(d: Drawable)
  proc getCurrentDrawable*(): Drawable
  proc jumpDrawablesToCurrentState*()
  proc onResolveDrawables*(layoutDirection: jint)
  proc postInvalidate*()
  proc setStateDescription*(stateDescription: CharSequence)
  proc setProgress*(progress: jint)
  proc setProgress*(progress: jint, animate: jboolean)
  proc setSecondaryProgress*(secondaryProgress: jint)
  proc getProgress*(): jint
  proc getSecondaryProgress*(): jint
  proc getMin*(): jint
  proc getMax*(): jint
  proc setMin*(min: jint)
  proc setMax*(max: jint)
  proc incrementProgressBy*(diff: jint)
  proc incrementSecondaryProgressBy*(diff: jint)
  proc setInterpolator*(context: Context, resID: jint)
  proc setInterpolator*(interpolator: Interpolator)
  proc getInterpolator*(): Interpolator
  proc onVisibilityAggregated*(isVisible: jboolean)
  proc invalidateDrawable*(dr: Drawable)
  proc drawableHotspotChanged*(x: jfloat, y: jfloat)
  proc onSaveInstanceState*(): Parcelable
  proc onRestoreInstanceState*(state: Parcelable)
  proc getAccessibilityClassName*(): CharSequence
  proc onInitializeAccessibilityEventInternal*(event: AccessibilityEvent)
  proc onInitializeAccessibilityNodeInfoInternal*(info: AccessibilityNodeInfo)
  proc isAnimating*(): jboolean

