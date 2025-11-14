import jnim

jclass android.util.FastImmutableArraySet* of AbstractSet:
  proc iterator*(): Iterator[T]
  proc size*(): jint

