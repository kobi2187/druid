import jnim

jclass android.telephony.PhoneNumberFormattingTextWatcher* of JVMObject:
  proc beforeTextChanged*(s: CharSequence, start: jint, count: jint, after: jint)
  proc onTextChanged*(s: CharSequence, start: jint, before: jint, count: jint)
  proc afterTextChanged*(s: Editable)

