import jnim

jclass android.text.InputFilter* of JVMObject:
  proc filter*(source: CharSequence, start: jint, end: jint, dest: Spanned, dstart: jint, dend: jint): CharSequence

jclass android.text.InputFilter.AllCaps* of JVMObject:
  proc filter*(source: CharSequence, start: jint, end: jint, dest: Spanned, dstart: jint, dend: jint): CharSequence

jclass android.text.InputFilter.LengthFilter* of JVMObject:
  proc filter*(source: CharSequence, start: jint, end: jint, dest: Spanned, dstart: jint, dend: jint): CharSequence
  proc getMax*(): jint

jclass android.text.AllCaps* of JVMObject:
  proc filter*(source: CharSequence, start: jint, end: jint, dest: Spanned, dstart: jint, dend: jint): CharSequence

jclass android.text.LengthFilter* of JVMObject:
  proc filter*(source: CharSequence, start: jint, end: jint, dest: Spanned, dstart: jint, dend: jint): CharSequence
  proc getMax*(): jint

