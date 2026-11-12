import jnim

jclass android.text.AlteredCharSequence* of JVMObject:
  proc make*(source: CharSequence, sub: seq[jchar], substart: jint, subend: jint): AlteredCharSequence {.`static`.}
  proc charAt*(off: jint): jchar
  proc length*(): jint
  proc subSequence*(start: jint, end: jint): CharSequence
  proc getChars*(start: jint, end: jint, dest: seq[jchar], off: jint)
  proc toString*(): string

