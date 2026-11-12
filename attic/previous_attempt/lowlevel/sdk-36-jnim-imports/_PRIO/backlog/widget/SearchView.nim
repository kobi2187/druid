import jnim

jclass android.widget.SearchView* of LinearLayout:
  proc setSearchableInfo*(searchable: SearchableInfo)
  proc setAppSearchData*(appSearchData: Bundle)
  proc setImeOptions*(imeOptions: jint)
  proc getImeOptions*(): jint
  proc setInputType*(inputType: jint)
  proc getInputType*(): jint
  proc requestFocus*(direction: jint, previouslyFocusedRect: Rect): jboolean
  proc clearFocus*()
  proc setOnQueryTextListener*(listener: OnQueryTextListener)
  proc setOnCloseListener*(listener: OnCloseListener)
  proc setOnQueryTextFocusChangeListener*(listener: OnFocusChangeListener)
  proc setOnSuggestionListener*(listener: OnSuggestionListener)
  proc setOnSearchClickListener*(listener: OnClickListener)
  proc getQuery*(): CharSequence
  proc setQuery*(query: CharSequence, submit: jboolean)
  proc setQueryHint*(hint: CharSequence)
  proc getQueryHint*(): CharSequence
  proc setIconifiedByDefault*(iconified: jboolean)
  proc isIconfiedByDefault*(): jboolean
  proc isIconifiedByDefault*(): jboolean
  proc setIconified*(iconify: jboolean)
  proc isIconified*(): jboolean
  proc setSubmitButtonEnabled*(enabled: jboolean)
  proc isSubmitButtonEnabled*(): jboolean
  proc setQueryRefinementEnabled*(enable: jboolean)
  proc isQueryRefinementEnabled*(): jboolean
  proc setSuggestionsAdapter*(adapter: CursorAdapter)
  proc getSuggestionsAdapter*(): CursorAdapter
  proc setMaxWidth*(maxpixels: jint)
  proc getMaxWidth*(): jint
  proc onKeyDown*(keyCode: jint, event: KeyEvent): jboolean
  proc onWindowFocusChanged*(hasWindowFocus: jboolean)
  proc onActionViewCollapsed*()
  proc onActionViewExpanded*()
  proc getAccessibilityClassName*(): CharSequence

jclass android.widget.SearchView.SearchAutoComplete* of JVMObject:
  proc setThreshold*(threshold: jint)
  proc performCompletion*()
  proc onWindowFocusChanged*(hasWindowFocus: jboolean)
  proc enoughToFilter*(): jboolean
  proc onKeyPreIme*(keyCode: jint, event: KeyEvent): jboolean
  proc onCreateInputConnection*(editorInfo: EditorInfo): InputConnection
  proc checkInputConnectionProxy*(view: View): jboolean



jclass android.widget.SearchAutoComplete* of AutoCompleteTextView:
  proc setThreshold*(threshold: jint)
  proc performCompletion*()
  proc onWindowFocusChanged*(hasWindowFocus: jboolean)
  proc enoughToFilter*(): jboolean
  proc onKeyPreIme*(keyCode: jint, event: KeyEvent): jboolean
  proc onCreateInputConnection*(editorInfo: EditorInfo): InputConnection
  proc checkInputConnectionProxy*(view: View): jboolean

