import jnim

jclass android.inputmethodservice.ExtractEditText* of EditText:
  proc startInternalChanges*()
  proc finishInternalChanges*()
  proc setExtractedText*(text: ExtractedText)
  proc performClick*(): jboolean
  proc onTextContextMenuItem*(id: jint): jboolean
  proc isInputMethodTarget*(): jboolean
  proc hasVerticalScrollBar*(): jboolean
  proc hasWindowFocus*(): jboolean
  proc isFocused*(): jboolean
  proc hasFocus*(): jboolean
  proc isInExtractedMode*(): jboolean

