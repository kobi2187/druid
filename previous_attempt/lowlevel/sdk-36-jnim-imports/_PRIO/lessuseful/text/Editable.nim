import jnim

jclass android.text.Editable* of CharSequence:
  proc replace*(st: jint, en: jint, source: CharSequence, start: jint, end: jint): Editable
  proc replace*(st: jint, en: jint, text: CharSequence): Editable
  proc insert*(where: jint, text: CharSequence, start: jint, end: jint): Editable
  proc insert*(where: jint, text: CharSequence): Editable
  proc delete*(st: jint, en: jint): Editable
  proc append*(text: CharSequence): Editable
  proc append*(text: CharSequence, start: jint, end: jint): Editable
  proc append*(text: jchar): Editable
  proc clear*()
  proc clearSpans*()
  proc setFilters*(filters: seq[InputFilter])
  proc getFilters*(): seq[InputFilter]

jclass android.text.Editable.Factory* of JVMObject:
  proc getInstance*(): Editable.Factory {.`static`.}
  proc newEditable*(source: CharSequence): Editable

jclass android.text.Factory* of JVMObject:
  proc getInstance*(): Editable.Factory {.`static`.}
  proc newEditable*(source: CharSequence): Editable

