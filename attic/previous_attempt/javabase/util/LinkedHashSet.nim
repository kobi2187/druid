import jnim

jclass java.util.LinkedHashSet* of HashSet:
  proc spliterator*(): Spliterator[E]
  proc newLinkedHashSet*(numElements: jint): LinkedHashSet[T] {.`static`.}
  proc addFirst*(e: E)
  proc addLast*(e: E)
  proc getFirst*(): E
  proc getLast*(): E
  proc removeFirst*(): E
  proc removeLast*(): E
  proc reversed*(): SequencedSet[E]

