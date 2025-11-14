import jnim

jclass android.widget.AbsSpinner* of AdapterView:
  proc setAdapter*(adapter: SpinnerAdapter)
  proc setSelection*(position: jint, animate: jboolean)
  proc setSelection*(position: jint)
  proc getSelectedView*(): View
  proc requestLayout*()
  proc getAdapter*(): SpinnerAdapter
  proc getCount*(): jint
  proc pointToPosition*(x: jint, y: jint): jint
  proc onSaveInstanceState*(): Parcelable
  proc onRestoreInstanceState*(state: Parcelable)
  proc getAccessibilityClassName*(): CharSequence
  proc autofill*(value: AutofillValue)
  proc getAutofillType*(): jint
  proc getAutofillValue*(): AutofillValue

