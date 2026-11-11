import jnim

jclass android.text.ClipboardManager* of JVMObject:
  proc getText*(): CharSequence
  proc setText*(text: CharSequence)
  proc hasText*(): jboolean

