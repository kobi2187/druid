import jnim

jclass android.widget.AlphabetIndexer* of DataSetObserver:
  proc getSections*(): seq[JObject]
  proc setCursor*(cursor: Cursor)
  proc getPositionForSection*(sectionIndex: jint): jint
  proc getSectionForPosition*(position: jint): jint
  proc onChanged*()
  proc onInvalidated*()

