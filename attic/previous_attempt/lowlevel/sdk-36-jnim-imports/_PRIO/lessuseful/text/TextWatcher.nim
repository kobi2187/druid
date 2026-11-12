import jnim

jclass android.text.TextWatcher* of NoCopySpan:
  proc beforeTextChanged*(s: CharSequence, start: jint, count: jint, after: jint)
  proc onTextChanged*(s: CharSequence, start: jint, before: jint, count: jint)
  proc afterTextChanged*(s: Editable)

