import jnim

jclass android.widget.CompoundButton* of Button:
  proc toggle*()
  proc performClick*(): jboolean
  proc isChecked*(): jboolean
  proc setStateDescription*(stateDescription: CharSequence)
  proc setChecked*(checked: jboolean)
  proc setOnCheckedChangeListener*(listener: OnCheckedChangeListener)
  proc setButtonDrawable*(resId: jint)
  proc setButtonDrawableAsync*(resId: jint): Runnable
  proc setButtonDrawable*(drawable: Drawable)
  proc onResolveDrawables*(layoutDirection: jint)
  proc getButtonDrawable*(): Drawable
  proc setButtonIcon*(icon: Icon)
  proc setButtonIconAsync*(icon: Icon): Runnable
  proc setButtonTintList*(tint: ColorStateList)
  proc getButtonTintList*(): ColorStateList
  proc setButtonTintMode*(tintMode: PorterDuff.Mode)
  proc setButtonTintBlendMode*(tintMode: BlendMode)
  proc getButtonTintMode*(): PorterDuff.Mode
  proc getButtonTintBlendMode*(): BlendMode
  proc getAccessibilityClassName*(): CharSequence
  proc onInitializeAccessibilityEventInternal*(event: AccessibilityEvent)
  proc onInitializeAccessibilityNodeInfoInternal*(info: AccessibilityNodeInfo)
  proc getCompoundPaddingLeft*(): jint
  proc getCompoundPaddingRight*(): jint
  proc getHorizontalOffsetForDrawables*(): jint
  proc drawableHotspotChanged*(x: jfloat, y: jfloat)
  proc jumpDrawablesToCurrentState*()
  proc onSaveInstanceState*(): Parcelable
  proc onRestoreInstanceState*(state: Parcelable)
  proc autofill*(value: AutofillValue)
  proc getAutofillType*(): jint
  proc getAutofillValue*(): AutofillValue

