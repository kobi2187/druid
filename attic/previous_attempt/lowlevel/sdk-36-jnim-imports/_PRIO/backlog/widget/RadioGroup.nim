import jnim

jclass android.widget.RadioGroup* of LinearLayout:
  proc setOnHierarchyChangeListener*(listener: OnHierarchyChangeListener)
  proc addView*(child: View, index: jint, params: ViewGroup.LayoutParams)
  proc check*(id: jint)
  proc getCheckedRadioButtonId*(): jint
  proc clearCheck*()
  proc setOnCheckedChangeListener*(listener: OnCheckedChangeListener)
  proc generateLayoutParams*(attrs: AttributeSet): LayoutParams
  proc getAccessibilityClassName*(): CharSequence
  proc autofill*(value: AutofillValue)
  proc getAutofillType*(): jint
  proc getAutofillValue*(): AutofillValue
  proc onInitializeAccessibilityNodeInfo*(info: AccessibilityNodeInfo)

jclass android.widget.LayoutParams* of LayoutParams:

