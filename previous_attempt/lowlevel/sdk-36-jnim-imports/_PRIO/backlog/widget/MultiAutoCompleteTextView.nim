import jnim

jclass android.widget.MultiAutoCompleteTextView* of AutoCompleteTextView:
  proc setTokenizer*(t: Tokenizer)
  proc enoughToFilter*(): jboolean
  proc performValidation*()
  proc getAccessibilityClassName*(): CharSequence

jclass android.widget.MultiAutoCompleteTextView.Tokenizer* of JVMObject:
  proc findTokenStart*(text: CharSequence, cursor: jint): jint
  proc findTokenEnd*(text: CharSequence, cursor: jint): jint
  proc terminateToken*(text: CharSequence): CharSequence

jclass android.widget.MultiAutoCompleteTextView.CommaTokenizer* of JVMObject:
  proc findTokenStart*(text: CharSequence, cursor: jint): jint
  proc findTokenEnd*(text: CharSequence, cursor: jint): jint
  proc terminateToken*(text: CharSequence): CharSequence

jclass android.widget.Tokenizer* of JVMObject:
  proc findTokenStart*(text: CharSequence, cursor: jint): jint
  proc findTokenEnd*(text: CharSequence, cursor: jint): jint
  proc terminateToken*(text: CharSequence): CharSequence

jclass android.widget.CommaTokenizer* of JVMObject:
  proc findTokenStart*(text: CharSequence, cursor: jint): jint
  proc findTokenEnd*(text: CharSequence, cursor: jint): jint
  proc terminateToken*(text: CharSequence): CharSequence

