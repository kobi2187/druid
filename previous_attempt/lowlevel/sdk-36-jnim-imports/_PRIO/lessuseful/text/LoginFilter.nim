import jnim

jclass android.text.LoginFilter* of JVMObject:
  proc filter*(source: CharSequence, start: jint, end: jint, dest: Spanned, dstart: jint, dend: jint): CharSequence
  proc onStart*()
  proc onInvalidCharacter*(c: jchar)
  proc onStop*()
  proc isAllowed*(c: jchar): jboolean

jclass android.text.LoginFilter.UsernameFilterGMail* of JVMObject:
  proc isAllowed*(c: jchar): jboolean

jclass android.text.LoginFilter.UsernameFilterGeneric* of JVMObject:
  proc isAllowed*(c: jchar): jboolean

jclass android.text.LoginFilter.PasswordFilterGMail* of JVMObject:
  proc isAllowed*(c: jchar): jboolean

jclass android.text.UsernameFilterGMail* of LoginFilter:
  proc isAllowed*(c: jchar): jboolean

jclass android.text.UsernameFilterGeneric* of LoginFilter:
  proc isAllowed*(c: jchar): jboolean

jclass android.text.PasswordFilterGMail* of LoginFilter:
  proc isAllowed*(c: jchar): jboolean

