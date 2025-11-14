import jnim

jclass android.accessibilityservice.InputMethod* of JVMObject:
  proc getCurrentInputConnection*(): AccessibilityInputConnection
  proc getCurrentInputStarted*(): jboolean
  proc getCurrentInputEditorInfo*(): EditorInfo
  proc onStartInput*(attribute: EditorInfo, restarting: jboolean)
  proc onFinishInput*()
  proc onUpdateSelection*(oldSelStart: jint, oldSelEnd: jint, newSelStart: jint, newSelEnd: jint, candidatesStart: jint, candidatesEnd: jint)

jclass android.accessibilityservice.InputMethod.AccessibilityInputConnection* of JVMObject:
  proc commitText*(text: CharSequence, newCursorPosition: jint, textAttribute: TextAttribute)
  proc setSelection*(start: jint, end: jint)
  proc getSurroundingText*(beforeLength: jint, afterLength: jint, flags: jint): SurroundingText
  proc deleteSurroundingText*(beforeLength: jint, afterLength: jint)
  proc sendKeyEvent*(event: KeyEvent)
  proc performEditorAction*(editorAction: jint)
  proc performContextMenuAction*(id: jint)
  proc getCursorCapsMode*(reqModes: jint): jint
  proc clearMetaKeyStates*(states: jint)

jclass android.accessibilityservice.AccessibilityInputConnection* of JVMObject:
  proc commitText*(text: CharSequence, newCursorPosition: jint, textAttribute: TextAttribute)
  proc setSelection*(start: jint, end: jint)
  proc getSurroundingText*(beforeLength: jint, afterLength: jint, flags: jint): SurroundingText
  proc deleteSurroundingText*(beforeLength: jint, afterLength: jint)
  proc sendKeyEvent*(event: KeyEvent)
  proc performEditorAction*(editorAction: jint)
  proc performContextMenuAction*(id: jint)
  proc getCursorCapsMode*(reqModes: jint): jint
  proc clearMetaKeyStates*(states: jint)

