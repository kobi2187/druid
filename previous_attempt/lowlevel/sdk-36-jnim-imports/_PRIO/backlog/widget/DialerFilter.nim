import jnim

jclass android.widget.DialerFilter* of RelativeLayout:
  proc isQwertyKeyboard*(): jboolean
  proc onKeyDown*(keyCode: jint, event: KeyEvent): jboolean
  proc onKeyUp*(keyCode: jint, event: KeyEvent): jboolean
  proc getMode*(): jint
  proc setMode*(newMode: jint)
  proc getLetters*(): CharSequence
  proc getDigits*(): CharSequence
  proc getFilterText*(): CharSequence
  proc append*(text: string)
  proc clearText*()
  proc setLettersWatcher*(watcher: TextWatcher)
  proc setDigitsWatcher*(watcher: TextWatcher)
  proc setFilterWatcher*(watcher: TextWatcher)
  proc removeFilterWatcher*(watcher: TextWatcher)
  DIGITS_AND_LETTERS*: jint {.`static`.}
  DIGITS_AND_LETTERS_NO_DIGITS*: jint {.`static`.}
  DIGITS_AND_LETTERS_NO_LETTERS*: jint {.`static`.}
  DIGITS_ONLY*: jint {.`static`.}
  LETTERS_ONLY*: jint {.`static`.}

