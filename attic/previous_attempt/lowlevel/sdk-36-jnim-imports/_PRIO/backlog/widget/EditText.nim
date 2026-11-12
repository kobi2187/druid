import jnim

jclass android.widget.EditText* of TextView:
  proc getFreezesText*(): jboolean
  proc getText*(): Editable
  proc setText*(text: CharSequence, type: BufferType)
  proc setSelection*(start: jint, stop: jint)
  proc setSelection*(index: jint)
  proc selectAll*()
  proc extendSelection*(index: jint)
  proc setEllipsize*(ellipsis: TextUtils.TruncateAt)
  proc getAccessibilityClassName*(): CharSequence
  proc onKeyShortcut*(keyCode: jint, event: KeyEvent): jboolean
  proc onTextContextMenuItem*(id: jint): jboolean
  proc setStyleShortcutsEnabled*(enabled: jboolean)
  proc isStyleShortcutEnabled*(): jboolean
  LINE_HEIGHT_FOR_LOCALE*: jlong {.`static`.}

