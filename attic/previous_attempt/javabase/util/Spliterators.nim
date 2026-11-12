import jnim

jclass java.util.Spliterators* of JVMObject:
  proc emptySpliterator*(): Spliterator[T] {.`static`.}
  proc emptyIntSpliterator*(): Spliterator.OfInt {.`static`.}
  proc emptyLongSpliterator*(): Spliterator.OfLong {.`static`.}
  proc emptyDoubleSpliterator*(): Spliterator.OfDouble {.`static`.}
  proc spliterator*(array: seq[JObject], additionalCharacteristics: jint): Spliterator[T] {.`static`.}
  proc spliterator*(array: seq[JObject], fromIndex: jint, toIndex: jint, additionalCharacteristics: jint): Spliterator[T] {.`static`.}
  proc spliterator*(array: seq[jint], additionalCharacteristics: jint): Spliterator.OfInt {.`static`.}
  proc spliterator*(array: seq[jint], fromIndex: jint, toIndex: jint, additionalCharacteristics: jint): Spliterator.OfInt {.`static`.}
  proc spliterator*(array: seq[jlong], additionalCharacteristics: jint): Spliterator.OfLong {.`static`.}
  proc spliterator*(array: seq[jlong], fromIndex: jint, toIndex: jint, additionalCharacteristics: jint): Spliterator.OfLong {.`static`.}
  proc spliterator*(array: seq[jdouble], additionalCharacteristics: jint): Spliterator.OfDouble {.`static`.}
  proc spliterator*(array: seq[jdouble], fromIndex: jint, toIndex: jint, additionalCharacteristics: jint): Spliterator.OfDouble {.`static`.}
  proc spliterator*(c: Collection[? extends T], characteristics: jint): Spliterator[T] {.`static`.}
  proc spliterator*(iterator: Iterator[? extends T], size: jlong, characteristics: jint): Spliterator[T] {.`static`.}
  proc spliteratorUnknownSize*(iterator: Iterator[? extends T], characteristics: jint): Spliterator[T] {.`static`.}
  proc spliterator*(iterator: PrimitiveIterator.OfInt, size: jlong, characteristics: jint): Spliterator.OfInt {.`static`.}
  proc spliteratorUnknownSize*(iterator: PrimitiveIterator.OfInt, characteristics: jint): Spliterator.OfInt {.`static`.}
  proc spliterator*(iterator: PrimitiveIterator.OfLong, size: jlong, characteristics: jint): Spliterator.OfLong {.`static`.}
  proc spliteratorUnknownSize*(iterator: PrimitiveIterator.OfLong, characteristics: jint): Spliterator.OfLong {.`static`.}
  proc spliterator*(iterator: PrimitiveIterator.OfDouble, size: jlong, characteristics: jint): Spliterator.OfDouble {.`static`.}
  proc spliteratorUnknownSize*(iterator: PrimitiveIterator.OfDouble, characteristics: jint): Spliterator.OfDouble {.`static`.}
  proc iterator*(spliterator: Spliterator[? extends T]): Iterator[T] {.`static`.}
  proc iterator*(spliterator: Spliterator.OfInt): PrimitiveIterator.OfInt {.`static`.}
  proc iterator*(spliterator: Spliterator.OfLong): PrimitiveIterator.OfLong {.`static`.}
  proc iterator*(spliterator: Spliterator.OfDouble): PrimitiveIterator.OfDouble {.`static`.}

jclass java.util.Spliterators.AbstractSpliterator* of JVMObject:
  proc trySplit*(): Spliterator[T]
  proc estimateSize*(): jlong
  proc characteristics*(): jint

jclass java.util.Spliterators.AbstractIntSpliterator* of JVMObject:
  proc trySplit*(): Spliterator.OfInt
  proc estimateSize*(): jlong
  proc characteristics*(): jint

jclass java.util.Spliterators.AbstractLongSpliterator* of JVMObject:
  proc trySplit*(): Spliterator.OfLong
  proc estimateSize*(): jlong
  proc characteristics*(): jint

jclass java.util.Spliterators.AbstractDoubleSpliterator* of JVMObject:
  proc trySplit*(): Spliterator.OfDouble
  proc estimateSize*(): jlong
  proc characteristics*(): jint

jclass java.util.AbstractSpliterator* of JVMObject:
  proc trySplit*(): Spliterator[T]
  proc estimateSize*(): jlong
  proc characteristics*(): jint

jclass java.util.AbstractIntSpliterator* of JVMObject:
  proc trySplit*(): Spliterator.OfInt
  proc estimateSize*(): jlong
  proc characteristics*(): jint

jclass java.util.AbstractLongSpliterator* of JVMObject:
  proc trySplit*(): Spliterator.OfLong
  proc estimateSize*(): jlong
  proc characteristics*(): jint

jclass java.util.AbstractDoubleSpliterator* of JVMObject:
  proc trySplit*(): Spliterator.OfDouble
  proc estimateSize*(): jlong
  proc characteristics*(): jint

