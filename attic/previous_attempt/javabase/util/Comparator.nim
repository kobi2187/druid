import jnim

jclass java.util.Comparator* of JVMObject:
  proc reverseOrder*(): Comparator[T] {.`static`.}
  proc naturalOrder*(): Comparator[T] {.`static`.}
  proc nullsFirst*(comparator: Comparator[? super T]): Comparator[T] {.`static`.}
  proc nullsLast*(comparator: Comparator[? super T]): Comparator[T] {.`static`.}
  proc comparing*(keyExtractor: Function[? super T, ? extends U], keyComparator: Comparator[? super U]): Comparator[T] {.`static`.}
  proc comparing*(keyExtractor: Function[? super T, ? extends U]): Comparator[T] {.`static`.}
  proc comparingInt*(keyExtractor: ToIntFunction[? super T]): Comparator[T] {.`static`.}
  proc comparingLong*(keyExtractor: ToLongFunction[? super T]): Comparator[T] {.`static`.}
  proc comparingDouble*(keyExtractor: ToDoubleFunction[? super T]): Comparator[T] {.`static`.}

