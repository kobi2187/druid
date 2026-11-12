import jnim

jclass android.text.GetChars* of CharSequence:
  proc getChars*(start: jint, end: jint, dest: seq[jchar], destoff: jint)

