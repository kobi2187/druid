import jnim

jclass android.widget.AutoCompleteTextView* of EditText:
  proc setOnClickListener*(listener: OnClickListener)
  proc setCompletionHint*(hint: CharSequence)
  proc getCompletionHint*(): CharSequence
  proc getDropDownWidth*(): jint
  proc setDropDownWidth*(width: jint)
  proc getDropDownHeight*(): jint
  proc setDropDownHeight*(height: jint)
  proc getDropDownAnchor*(): jint
  proc setDropDownAnchor*(id: jint)
  proc getDropDownBackground*(): Drawable
  proc setDropDownBackgroundDrawable*(d: Drawable)
  proc setDropDownBackgroundResource*(id: jint)
  proc setDropDownVerticalOffset*(offset: jint)
  proc getDropDownVerticalOffset*(): jint
  proc setDropDownHorizontalOffset*(offset: jint)
  proc getDropDownHorizontalOffset*(): jint
  proc setDropDownAnimationStyle*(animationStyle: jint)
  proc getDropDownAnimationStyle*(): jint
  proc isDropDownAlwaysVisible*(): jboolean
  proc setDropDownAlwaysVisible*(dropDownAlwaysVisible: jboolean)
  proc isDropDownDismissedOnCompletion*(): jboolean
  proc setDropDownDismissedOnCompletion*(dropDownDismissedOnCompletion: jboolean)
  proc getThreshold*(): jint
  proc setThreshold*(threshold: jint)
  proc setOnItemClickListener*(l: AdapterView.OnItemClickListener)
  proc setOnItemSelectedListener*(l: AdapterView.OnItemSelectedListener)
  proc getItemClickListener*(): AdapterView.OnItemClickListener
  proc getItemSelectedListener*(): AdapterView.OnItemSelectedListener
  proc getOnItemClickListener*(): AdapterView.OnItemClickListener
  proc getOnItemSelectedListener*(): AdapterView.OnItemSelectedListener
  proc setOnDismissListener*(dismissListener: OnDismissListener)
  proc getAdapter*(): ListAdapter
  proc setAdapter*(adapter: T)
  proc onKeyPreIme*(keyCode: jint, event: KeyEvent): jboolean
  proc onKeyUp*(keyCode: jint, event: KeyEvent): jboolean
  proc onKeyDown*(keyCode: jint, event: KeyEvent): jboolean
  proc enoughToFilter*(): jboolean
  proc refreshAutoCompleteResults*()
  proc isPopupShowing*(): jboolean
  proc clearListSelection*()
  proc setListSelection*(position: jint)
  proc getListSelection*(): jint
  proc performCompletion*()
  proc onCommitCompletion*(completion: CompletionInfo)
  proc isPerformingCompletion*(): jboolean
  proc setText*(text: CharSequence, filter: jboolean)
  proc onFilterComplete*(count: jint)
  proc onWindowFocusChanged*(hasWindowFocus: jboolean)
  proc dismissDropDown*()
  proc showDropDownAfterLayout*()
  proc ensureImeVisible*(visible: jboolean)
  proc isInputMethodNotNeeded*(): jboolean
  proc getInputMethodMode*(): jint
  proc setInputMethodMode*(mode: jint)
  proc showDropDown*()
  proc setForceIgnoreOutsideTouch*(forceIgnoreOutsideTouch: jboolean)
  proc setValidator*(validator: Validator)
  proc getValidator*(): Validator
  proc performValidation*()
  proc getAccessibilityClassName*(): CharSequence


