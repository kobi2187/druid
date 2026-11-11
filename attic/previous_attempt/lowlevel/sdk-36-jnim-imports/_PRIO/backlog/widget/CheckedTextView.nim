import jnim

jclass android.widget.CheckedTextView* of TextView:
  proc toggle*()
  proc isChecked*(): jboolean
  proc setChecked*(checked: jboolean)
  proc setCheckMarkDrawable*(resId: jint)
  proc setCheckMarkDrawable*(d: Drawable)
  proc setCheckMarkTintList*(tint: ColorStateList)
  proc getCheckMarkTintList*(): ColorStateList
  proc setCheckMarkTintMode*(tintMode: PorterDuff.Mode)
  proc setCheckMarkTintBlendMode*(tintMode: BlendMode)
  proc getCheckMarkTintMode*(): PorterDuff.Mode
  proc getCheckMarkTintBlendMode*(): BlendMode
  proc setVisibility*(visibility: jint)
  proc jumpDrawablesToCurrentState*()
  proc getCheckMarkDrawable*(): Drawable
  proc onRtlPropertiesChanged*(layoutDirection: jint)
  proc drawableHotspotChanged*(x: jfloat, y: jfloat)
  proc getAccessibilityClassName*(): CharSequence
  proc onSaveInstanceState*(): Parcelable
  proc onRestoreInstanceState*(state: Parcelable)
  proc onInitializeAccessibilityEventInternal*(event: AccessibilityEvent)
  proc onInitializeAccessibilityNodeInfoInternal*(info: AccessibilityNodeInfo)

