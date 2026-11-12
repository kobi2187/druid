import jnim

jclass android.text.Selection* of JVMObject:
  proc getSelectionStart*(text: CharSequence): jint {.`static`.}
  proc getSelectionEnd*(text: CharSequence): jint {.`static`.}
  proc setSelection*(text: Spannable, start: jint, stop: jint) {.`static`.}
  proc setSelection*(text: Spannable, index: jint) {.`static`.}
  proc selectAll*(text: Spannable) {.`static`.}
  proc extendSelection*(text: Spannable, index: jint) {.`static`.}
  proc removeSelection*(text: Spannable) {.`static`.}
  proc moveUp*(text: Spannable, layout: Layout): jboolean {.`static`.}
  proc moveDown*(text: Spannable, layout: Layout): jboolean {.`static`.}
  proc moveLeft*(text: Spannable, layout: Layout): jboolean {.`static`.}
  proc moveRight*(text: Spannable, layout: Layout): jboolean {.`static`.}
  proc moveToParagraphStart*(text: Spannable, layout: Layout): jboolean {.`static`.}
  proc moveToParagraphEnd*(text: Spannable, layout: Layout): jboolean {.`static`.}
  proc extendToParagraphStart*(text: Spannable): jboolean {.`static`.}
  proc extendToParagraphEnd*(text: Spannable): jboolean {.`static`.}
  proc extendUp*(text: Spannable, layout: Layout): jboolean {.`static`.}
  proc extendDown*(text: Spannable, layout: Layout): jboolean {.`static`.}
  proc extendLeft*(text: Spannable, layout: Layout): jboolean {.`static`.}
  proc extendRight*(text: Spannable, layout: Layout): jboolean {.`static`.}
  proc extendToLeftEdge*(text: Spannable, layout: Layout): jboolean {.`static`.}
  proc extendToRightEdge*(text: Spannable, layout: Layout): jboolean {.`static`.}
  proc moveToLeftEdge*(text: Spannable, layout: Layout): jboolean {.`static`.}
  proc moveToRightEdge*(text: Spannable, layout: Layout): jboolean {.`static`.}
  proc moveToPreceding*(text: Spannable, iter: PositionIterator, extendSelection: jboolean): jboolean {.`static`.}
  proc moveToFollowing*(text: Spannable, iter: PositionIterator, extendSelection: jboolean): jboolean {.`static`.}
  SELECTION_START*: JObject {.`static`.}
  SELECTION_END*: JObject {.`static`.}

jclass android.text.Selection.MemoryTextWatcher* of JVMObject:
  proc beforeTextChanged*(s: CharSequence, start: jint, count: jint, after: jint)
  proc onTextChanged*(s: CharSequence, start: jint, before: jint, count: jint)
  proc afterTextChanged*(s: Editable)

jclass android.text.Selection.PositionIterator* of JVMObject:
  proc preceding*(position: jint): jint
  proc following*(position: jint): jint

jclass android.text.MemoryTextWatcher* of JVMObject:
  proc beforeTextChanged*(s: CharSequence, start: jint, count: jint, after: jint)
  proc onTextChanged*(s: CharSequence, start: jint, before: jint, count: jint)
  proc afterTextChanged*(s: Editable)

jclass android.text.PositionIterator* of JVMObject:
  proc preceding*(position: jint): jint
  proc following*(position: jint): jint
  DONE*: jint {.`static`.}

