import jnim

jclass android.widget.ImeAwareEditText* of EditText:
  proc onCreateInputConnection*(editorInfo: EditorInfo): InputConnection
  proc scheduleShowSoftInput*()

