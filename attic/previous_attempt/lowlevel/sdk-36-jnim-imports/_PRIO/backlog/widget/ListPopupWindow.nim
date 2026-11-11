import jnim

jclass android.widget.ListPopupWindow* of JVMObject:
  proc setAdapter*(adapter: ListAdapter)
  proc setPromptPosition*(position: jint)
  proc getPromptPosition*(): jint
  proc setModal*(modal: jboolean)
  proc isModal*(): jboolean
  proc setForceIgnoreOutsideTouch*(forceIgnoreOutsideTouch: jboolean)
  proc setDropDownAlwaysVisible*(dropDownAlwaysVisible: jboolean)
  proc isDropDownAlwaysVisible*(): jboolean
  proc setSoftInputMode*(mode: jint)
  proc getSoftInputMode*(): jint
  proc setListSelector*(selector: Drawable)
  proc getBackground*(): Drawable
  proc setBackgroundDrawable*(d: Drawable)
  proc setAnimationStyle*(animationStyle: jint)
  proc getAnimationStyle*(): jint
  proc getAnchorView*(): View
  proc setAnchorView*(anchor: View)
  proc getHorizontalOffset*(): jint
  proc setHorizontalOffset*(offset: jint)
  proc getVerticalOffset*(): jint
  proc setVerticalOffset*(offset: jint)
  proc setEpicenterBounds*(bounds: Rect)
  proc getEpicenterBounds*(): Rect
  proc setDropDownGravity*(gravity: jint)
  proc getWidth*(): jint
  proc setWidth*(width: jint)
  proc setContentWidth*(width: jint)
  proc getHeight*(): jint
  proc setHeight*(height: jint)
  proc setWindowLayoutType*(layoutType: jint)
  proc setOnItemClickListener*(clickListener: AdapterView.OnItemClickListener)
  proc setOnItemSelectedListener*(selectedListener: OnItemSelectedListener)
  proc setPromptView*(prompt: View)
  proc postShow*()
  proc show*()
  proc dismiss*()
  proc dismissImmediate*()
  proc setOnDismissListener*(listener: PopupWindow.OnDismissListener)
  proc setInputMethodMode*(mode: jint)
  proc getInputMethodMode*(): jint
  proc setSelection*(position: jint)
  proc clearListSelection*()
  proc isShowing*(): jboolean
  proc isInputMethodNotNeeded*(): jboolean
  proc performItemClick*(position: jint): jboolean
  proc getSelectedItem*(): JObject
  proc getSelectedItemPosition*(): jint
  proc getSelectedItemId*(): jlong
  proc getSelectedView*(): View
  proc getListView*(): ListView
  proc onKeyDown*(keyCode: jint, event: KeyEvent): jboolean
  proc onKeyUp*(keyCode: jint, event: KeyEvent): jboolean
  proc onKeyPreIme*(keyCode: jint, event: KeyEvent): jboolean
  proc createDragToOpenListener*(src: View): OnTouchListener
  proc setOverlapAnchor*(overlap: jboolean)
  POSITION_PROMPT_ABOVE*: jint {.`static`.}
  POSITION_PROMPT_BELOW*: jint {.`static`.}
  MATCH_PARENT*: jint {.`static`.}
  WRAP_CONTENT*: jint {.`static`.}
  INPUT_METHOD_FROM_FOCUSABLE*: jint {.`static`.}
  INPUT_METHOD_NEEDED*: jint {.`static`.}
  INPUT_METHOD_NOT_NEEDED*: jint {.`static`.}

