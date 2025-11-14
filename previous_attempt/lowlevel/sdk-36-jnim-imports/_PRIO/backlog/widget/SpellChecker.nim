import jnim

jclass android.widget.SpellChecker* of JVMObject:
  proc closeSession*()
  proc onSpellCheckSpanRemoved*(spellCheckSpan: SpellCheckSpan)
  proc onSelectionChanged*()
  proc spellCheck*(start: jint, end: jint)
  proc spellCheck*(start: jint, end: jint, forceCheckWhenEditingWord: jboolean)
  proc onGetSuggestions*(results: seq[SuggestionsInfo])
  proc onGetSentenceSuggestions*(results: seq[SentenceSuggestionsInfo])
  proc haveWordBoundariesChanged*(editable: Editable, start: jint, end: jint, spanStart: jint, spanEnd: jint): jboolean {.`static`.}
  MAX_NUMBER_OF_WORDS*: jint {.`static`.}
  AVERAGE_WORD_LENGTH*: jint {.`static`.}
  WORD_ITERATOR_INTERVAL*: jint {.`static`.}

