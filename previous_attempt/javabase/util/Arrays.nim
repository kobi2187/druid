import jnim

jclass java.util.Arrays* of JVMObject:
  proc sort*(a: seq[jint]) {.`static`.}
  proc sort*(a: seq[jint], fromIndex: jint, toIndex: jint) {.`static`.}
  proc sort*(a: seq[jlong]) {.`static`.}
  proc sort*(a: seq[jlong], fromIndex: jint, toIndex: jint) {.`static`.}
  proc sort*(a: seq[jshort]) {.`static`.}
  proc sort*(a: seq[jshort], fromIndex: jint, toIndex: jint) {.`static`.}
  proc sort*(a: seq[jchar]) {.`static`.}
  proc sort*(a: seq[jchar], fromIndex: jint, toIndex: jint) {.`static`.}
  proc sort*(a: seq[jbyte]) {.`static`.}
  proc sort*(a: seq[jbyte], fromIndex: jint, toIndex: jint) {.`static`.}
  proc sort*(a: seq[jfloat]) {.`static`.}
  proc sort*(a: seq[jfloat], fromIndex: jint, toIndex: jint) {.`static`.}
  proc sort*(a: seq[jdouble]) {.`static`.}
  proc sort*(a: seq[jdouble], fromIndex: jint, toIndex: jint) {.`static`.}
  proc parallelSort*(a: seq[jbyte]) {.`static`.}
  proc parallelSort*(a: seq[jbyte], fromIndex: jint, toIndex: jint) {.`static`.}
  proc parallelSort*(a: seq[jchar]) {.`static`.}
  proc parallelSort*(a: seq[jchar], fromIndex: jint, toIndex: jint) {.`static`.}
  proc parallelSort*(a: seq[jshort]) {.`static`.}
  proc parallelSort*(a: seq[jshort], fromIndex: jint, toIndex: jint) {.`static`.}
  proc parallelSort*(a: seq[jint]) {.`static`.}
  proc parallelSort*(a: seq[jint], fromIndex: jint, toIndex: jint) {.`static`.}
  proc parallelSort*(a: seq[jlong]) {.`static`.}
  proc parallelSort*(a: seq[jlong], fromIndex: jint, toIndex: jint) {.`static`.}
  proc parallelSort*(a: seq[jfloat]) {.`static`.}
  proc parallelSort*(a: seq[jfloat], fromIndex: jint, toIndex: jint) {.`static`.}
  proc parallelSort*(a: seq[jdouble]) {.`static`.}
  proc parallelSort*(a: seq[jdouble], fromIndex: jint, toIndex: jint) {.`static`.}
  proc parallelSort*(a: seq[T]) {.`static`.}
  proc parallelSort*(a: seq[T], fromIndex: jint, toIndex: jint) {.`static`.}
  proc parallelSort*(a: seq[T], cmp: Comparator[? super T]) {.`static`.}
  proc parallelSort*(a: seq[T], fromIndex: jint, toIndex: jint, cmp: Comparator[? super T]) {.`static`.}
  proc sort*(a: seq[JObject]) {.`static`.}
  proc sort*(a: seq[JObject], fromIndex: jint, toIndex: jint) {.`static`.}
  proc sort*(a: seq[T], c: Comparator[? super T]) {.`static`.}
  proc sort*(a: seq[T], fromIndex: jint, toIndex: jint, c: Comparator[? super T]) {.`static`.}
  proc parallelPrefix*(array: seq[T], op: BinaryOperator[T]) {.`static`.}
  proc parallelPrefix*(array: seq[T], fromIndex: jint, toIndex: jint, op: BinaryOperator[T]) {.`static`.}
  proc parallelPrefix*(array: seq[jlong], op: LongBinaryOperator) {.`static`.}
  proc parallelPrefix*(array: seq[jlong], fromIndex: jint, toIndex: jint, op: LongBinaryOperator) {.`static`.}
  proc parallelPrefix*(array: seq[jdouble], op: DoubleBinaryOperator) {.`static`.}
  proc parallelPrefix*(array: seq[jdouble], fromIndex: jint, toIndex: jint, op: DoubleBinaryOperator) {.`static`.}
  proc parallelPrefix*(array: seq[jint], op: IntBinaryOperator) {.`static`.}
  proc parallelPrefix*(array: seq[jint], fromIndex: jint, toIndex: jint, op: IntBinaryOperator) {.`static`.}
  proc binarySearch*(a: seq[jlong], key: jlong): jint {.`static`.}
  proc binarySearch*(a: seq[jlong], fromIndex: jint, toIndex: jint, key: jlong): jint {.`static`.}
  proc binarySearch*(a: seq[jint], key: jint): jint {.`static`.}
  proc binarySearch*(a: seq[jint], fromIndex: jint, toIndex: jint, key: jint): jint {.`static`.}
  proc binarySearch*(a: seq[jshort], key: jshort): jint {.`static`.}
  proc binarySearch*(a: seq[jshort], fromIndex: jint, toIndex: jint, key: jshort): jint {.`static`.}
  proc binarySearch*(a: seq[jchar], key: jchar): jint {.`static`.}
  proc binarySearch*(a: seq[jchar], fromIndex: jint, toIndex: jint, key: jchar): jint {.`static`.}
  proc binarySearch*(a: seq[jbyte], key: jbyte): jint {.`static`.}
  proc binarySearch*(a: seq[jbyte], fromIndex: jint, toIndex: jint, key: jbyte): jint {.`static`.}
  proc binarySearch*(a: seq[jdouble], key: jdouble): jint {.`static`.}
  proc binarySearch*(a: seq[jdouble], fromIndex: jint, toIndex: jint, key: jdouble): jint {.`static`.}
  proc binarySearch*(a: seq[jfloat], key: jfloat): jint {.`static`.}
  proc binarySearch*(a: seq[jfloat], fromIndex: jint, toIndex: jint, key: jfloat): jint {.`static`.}
  proc binarySearch*(a: seq[JObject], key: JObject): jint {.`static`.}
  proc binarySearch*(a: seq[JObject], fromIndex: jint, toIndex: jint, key: JObject): jint {.`static`.}
  proc binarySearch*(a: seq[T], key: T, c: Comparator[? super T]): jint {.`static`.}
  proc binarySearch*(a: seq[T], fromIndex: jint, toIndex: jint, key: T, c: Comparator[? super T]): jint {.`static`.}
  proc equals*(a: seq[jlong], a2: seq[jlong]): jboolean {.`static`.}
  proc equals*(a: seq[jlong], aFromIndex: jint, aToIndex: jint, b: seq[jlong], bFromIndex: jint, bToIndex: jint): jboolean {.`static`.}
  proc equals*(a: seq[jint], a2: seq[jint]): jboolean {.`static`.}
  proc equals*(a: seq[jint], aFromIndex: jint, aToIndex: jint, b: seq[jint], bFromIndex: jint, bToIndex: jint): jboolean {.`static`.}
  proc equals*(a: seq[jshort], a2: seq[jshort]): jboolean {.`static`.}
  proc equals*(a: seq[jshort], aFromIndex: jint, aToIndex: jint, b: seq[jshort], bFromIndex: jint, bToIndex: jint): jboolean {.`static`.}
  proc equals*(a: seq[jchar], a2: seq[jchar]): jboolean {.`static`.}
  proc equals*(a: seq[jchar], aFromIndex: jint, aToIndex: jint, b: seq[jchar], bFromIndex: jint, bToIndex: jint): jboolean {.`static`.}
  proc equals*(a: seq[jbyte], a2: seq[jbyte]): jboolean {.`static`.}
  proc equals*(a: seq[jbyte], aFromIndex: jint, aToIndex: jint, b: seq[jbyte], bFromIndex: jint, bToIndex: jint): jboolean {.`static`.}
  proc equals*(a: seq[jboolean], a2: seq[jboolean]): jboolean {.`static`.}
  proc equals*(a: seq[jboolean], aFromIndex: jint, aToIndex: jint, b: seq[jboolean], bFromIndex: jint, bToIndex: jint): jboolean {.`static`.}
  proc equals*(a: seq[jdouble], a2: seq[jdouble]): jboolean {.`static`.}
  proc equals*(a: seq[jdouble], aFromIndex: jint, aToIndex: jint, b: seq[jdouble], bFromIndex: jint, bToIndex: jint): jboolean {.`static`.}
  proc equals*(a: seq[jfloat], a2: seq[jfloat]): jboolean {.`static`.}
  proc equals*(a: seq[jfloat], aFromIndex: jint, aToIndex: jint, b: seq[jfloat], bFromIndex: jint, bToIndex: jint): jboolean {.`static`.}
  proc equals*(a: seq[JObject], a2: seq[JObject]): jboolean {.`static`.}
  proc equals*(a: seq[JObject], aFromIndex: jint, aToIndex: jint, b: seq[JObject], bFromIndex: jint, bToIndex: jint): jboolean {.`static`.}
  proc equals*(a: seq[T], a2: seq[T], cmp: Comparator[? super T]): jboolean {.`static`.}
  proc equals*(a: seq[T], aFromIndex: jint, aToIndex: jint, b: seq[T], bFromIndex: jint, bToIndex: jint, cmp: Comparator[? super T]): jboolean {.`static`.}
  proc fill*(a: seq[jlong], val: jlong) {.`static`.}
  proc fill*(a: seq[jlong], fromIndex: jint, toIndex: jint, val: jlong) {.`static`.}
  proc fill*(a: seq[jint], val: jint) {.`static`.}
  proc fill*(a: seq[jint], fromIndex: jint, toIndex: jint, val: jint) {.`static`.}
  proc fill*(a: seq[jshort], val: jshort) {.`static`.}
  proc fill*(a: seq[jshort], fromIndex: jint, toIndex: jint, val: jshort) {.`static`.}
  proc fill*(a: seq[jchar], val: jchar) {.`static`.}
  proc fill*(a: seq[jchar], fromIndex: jint, toIndex: jint, val: jchar) {.`static`.}
  proc fill*(a: seq[jbyte], val: jbyte) {.`static`.}
  proc fill*(a: seq[jbyte], fromIndex: jint, toIndex: jint, val: jbyte) {.`static`.}
  proc fill*(a: seq[jboolean], val: jboolean) {.`static`.}
  proc fill*(a: seq[jboolean], fromIndex: jint, toIndex: jint, val: jboolean) {.`static`.}
  proc fill*(a: seq[jdouble], val: jdouble) {.`static`.}
  proc fill*(a: seq[jdouble], fromIndex: jint, toIndex: jint, val: jdouble) {.`static`.}
  proc fill*(a: seq[jfloat], val: jfloat) {.`static`.}
  proc fill*(a: seq[jfloat], fromIndex: jint, toIndex: jint, val: jfloat) {.`static`.}
  proc fill*(a: seq[JObject], val: JObject) {.`static`.}
  proc fill*(a: seq[JObject], fromIndex: jint, toIndex: jint, val: JObject) {.`static`.}
  proc copyOf*(original: seq[T], newLength: jint): seq[T] {.`static`.}
  proc copyOf*(original: seq[U], newLength: jint, newType: Class[seq[? extends T]]): seq[T] {.`static`.}
  proc copyOf*(original: seq[jbyte], newLength: jint): seq[jbyte] {.`static`.}
  proc copyOf*(original: seq[jshort], newLength: jint): seq[jshort] {.`static`.}
  proc copyOf*(original: seq[jint], newLength: jint): seq[jint] {.`static`.}
  proc copyOf*(original: seq[jlong], newLength: jint): seq[jlong] {.`static`.}
  proc copyOf*(original: seq[jchar], newLength: jint): seq[jchar] {.`static`.}
  proc copyOf*(original: seq[jfloat], newLength: jint): seq[jfloat] {.`static`.}
  proc copyOf*(original: seq[jdouble], newLength: jint): seq[jdouble] {.`static`.}
  proc copyOf*(original: seq[jboolean], newLength: jint): seq[jboolean] {.`static`.}
  proc copyOfRange*(original: seq[T], from: jint, to: jint): seq[T] {.`static`.}
  proc copyOfRange*(original: seq[U], from: jint, to: jint, newType: Class[seq[? extends T]]): seq[T] {.`static`.}
  proc copyOfRange*(original: seq[jbyte], from: jint, to: jint): seq[jbyte] {.`static`.}
  proc copyOfRange*(original: seq[jshort], from: jint, to: jint): seq[jshort] {.`static`.}
  proc copyOfRange*(original: seq[jint], from: jint, to: jint): seq[jint] {.`static`.}
  proc copyOfRange*(original: seq[jlong], from: jint, to: jint): seq[jlong] {.`static`.}
  proc copyOfRange*(original: seq[jchar], from: jint, to: jint): seq[jchar] {.`static`.}
  proc copyOfRange*(original: seq[jfloat], from: jint, to: jint): seq[jfloat] {.`static`.}
  proc copyOfRange*(original: seq[jdouble], from: jint, to: jint): seq[jdouble] {.`static`.}
  proc copyOfRange*(original: seq[jboolean], from: jint, to: jint): seq[jboolean] {.`static`.}
  proc asList*(a: T): List[T] {.`static`.}
  proc hashCode*(a: seq[jlong]): jint {.`static`.}
  proc hashCode*(a: seq[jint]): jint {.`static`.}
  proc hashCode*(a: seq[jshort]): jint {.`static`.}
  proc hashCode*(a: seq[jchar]): jint {.`static`.}
  proc hashCode*(a: seq[jbyte]): jint {.`static`.}
  proc hashCode*(a: seq[jboolean]): jint {.`static`.}
  proc hashCode*(a: seq[jfloat]): jint {.`static`.}
  proc hashCode*(a: seq[jdouble]): jint {.`static`.}
  proc hashCode*(a: seq[JObject]): jint {.`static`.}
  proc deepHashCode*(a: seq[JObject]): jint {.`static`.}
  proc deepEquals*(a1: seq[JObject], a2: seq[JObject]): jboolean {.`static`.}
  proc toString*(a: seq[jlong]): string {.`static`.}
  proc toString*(a: seq[jint]): string {.`static`.}
  proc toString*(a: seq[jshort]): string {.`static`.}
  proc toString*(a: seq[jchar]): string {.`static`.}
  proc toString*(a: seq[jbyte]): string {.`static`.}
  proc toString*(a: seq[jboolean]): string {.`static`.}
  proc toString*(a: seq[jfloat]): string {.`static`.}
  proc toString*(a: seq[jdouble]): string {.`static`.}
  proc toString*(a: seq[JObject]): string {.`static`.}
  proc deepToString*(a: seq[JObject]): string {.`static`.}
  proc setAll*(array: seq[T], generator: IntFunction[? extends T]) {.`static`.}
  proc parallelSetAll*(array: seq[T], generator: IntFunction[? extends T]) {.`static`.}
  proc setAll*(array: seq[jint], generator: IntUnaryOperator) {.`static`.}
  proc parallelSetAll*(array: seq[jint], generator: IntUnaryOperator) {.`static`.}
  proc setAll*(array: seq[jlong], generator: IntToLongFunction) {.`static`.}
  proc parallelSetAll*(array: seq[jlong], generator: IntToLongFunction) {.`static`.}
  proc setAll*(array: seq[jdouble], generator: IntToDoubleFunction) {.`static`.}
  proc parallelSetAll*(array: seq[jdouble], generator: IntToDoubleFunction) {.`static`.}
  proc spliterator*(array: seq[T]): Spliterator[T] {.`static`.}
  proc spliterator*(array: seq[T], startInclusive: jint, endExclusive: jint): Spliterator[T] {.`static`.}
  proc spliterator*(array: seq[jint]): Spliterator.OfInt {.`static`.}
  proc spliterator*(array: seq[jint], startInclusive: jint, endExclusive: jint): Spliterator.OfInt {.`static`.}
  proc spliterator*(array: seq[jlong]): Spliterator.OfLong {.`static`.}
  proc spliterator*(array: seq[jlong], startInclusive: jint, endExclusive: jint): Spliterator.OfLong {.`static`.}
  proc spliterator*(array: seq[jdouble]): Spliterator.OfDouble {.`static`.}
  proc spliterator*(array: seq[jdouble], startInclusive: jint, endExclusive: jint): Spliterator.OfDouble {.`static`.}
  proc stream*(array: seq[T]): Stream[T] {.`static`.}
  proc stream*(array: seq[T], startInclusive: jint, endExclusive: jint): Stream[T] {.`static`.}
  proc stream*(array: seq[jint]): IntStream {.`static`.}
  proc stream*(array: seq[jint], startInclusive: jint, endExclusive: jint): IntStream {.`static`.}
  proc stream*(array: seq[jlong]): LongStream {.`static`.}
  proc stream*(array: seq[jlong], startInclusive: jint, endExclusive: jint): LongStream {.`static`.}
  proc stream*(array: seq[jdouble]): DoubleStream {.`static`.}
  proc stream*(array: seq[jdouble], startInclusive: jint, endExclusive: jint): DoubleStream {.`static`.}
  proc compare*(a: seq[jboolean], b: seq[jboolean]): jint {.`static`.}
  proc compare*(a: seq[jboolean], aFromIndex: jint, aToIndex: jint, b: seq[jboolean], bFromIndex: jint, bToIndex: jint): jint {.`static`.}
  proc compare*(a: seq[jbyte], b: seq[jbyte]): jint {.`static`.}
  proc compare*(a: seq[jbyte], aFromIndex: jint, aToIndex: jint, b: seq[jbyte], bFromIndex: jint, bToIndex: jint): jint {.`static`.}
  proc compareUnsigned*(a: seq[jbyte], b: seq[jbyte]): jint {.`static`.}
  proc compareUnsigned*(a: seq[jbyte], aFromIndex: jint, aToIndex: jint, b: seq[jbyte], bFromIndex: jint, bToIndex: jint): jint {.`static`.}
  proc compare*(a: seq[jshort], b: seq[jshort]): jint {.`static`.}
  proc compare*(a: seq[jshort], aFromIndex: jint, aToIndex: jint, b: seq[jshort], bFromIndex: jint, bToIndex: jint): jint {.`static`.}
  proc compareUnsigned*(a: seq[jshort], b: seq[jshort]): jint {.`static`.}
  proc compareUnsigned*(a: seq[jshort], aFromIndex: jint, aToIndex: jint, b: seq[jshort], bFromIndex: jint, bToIndex: jint): jint {.`static`.}
  proc compare*(a: seq[jchar], b: seq[jchar]): jint {.`static`.}
  proc compare*(a: seq[jchar], aFromIndex: jint, aToIndex: jint, b: seq[jchar], bFromIndex: jint, bToIndex: jint): jint {.`static`.}
  proc compare*(a: seq[jint], b: seq[jint]): jint {.`static`.}
  proc compare*(a: seq[jint], aFromIndex: jint, aToIndex: jint, b: seq[jint], bFromIndex: jint, bToIndex: jint): jint {.`static`.}
  proc compareUnsigned*(a: seq[jint], b: seq[jint]): jint {.`static`.}
  proc compareUnsigned*(a: seq[jint], aFromIndex: jint, aToIndex: jint, b: seq[jint], bFromIndex: jint, bToIndex: jint): jint {.`static`.}
  proc compare*(a: seq[jlong], b: seq[jlong]): jint {.`static`.}
  proc compare*(a: seq[jlong], aFromIndex: jint, aToIndex: jint, b: seq[jlong], bFromIndex: jint, bToIndex: jint): jint {.`static`.}
  proc compareUnsigned*(a: seq[jlong], b: seq[jlong]): jint {.`static`.}
  proc compareUnsigned*(a: seq[jlong], aFromIndex: jint, aToIndex: jint, b: seq[jlong], bFromIndex: jint, bToIndex: jint): jint {.`static`.}
  proc compare*(a: seq[jfloat], b: seq[jfloat]): jint {.`static`.}
  proc compare*(a: seq[jfloat], aFromIndex: jint, aToIndex: jint, b: seq[jfloat], bFromIndex: jint, bToIndex: jint): jint {.`static`.}
  proc compare*(a: seq[jdouble], b: seq[jdouble]): jint {.`static`.}
  proc compare*(a: seq[jdouble], aFromIndex: jint, aToIndex: jint, b: seq[jdouble], bFromIndex: jint, bToIndex: jint): jint {.`static`.}
  proc compare*(a: seq[T], b: seq[T]): jint {.`static`.}
  proc compare*(a: seq[T], aFromIndex: jint, aToIndex: jint, b: seq[T], bFromIndex: jint, bToIndex: jint): jint {.`static`.}
  proc compare*(a: seq[T], b: seq[T], cmp: Comparator[? super T]): jint {.`static`.}
  proc compare*(a: seq[T], aFromIndex: jint, aToIndex: jint, b: seq[T], bFromIndex: jint, bToIndex: jint, cmp: Comparator[? super T]): jint {.`static`.}
  proc mismatch*(a: seq[jboolean], b: seq[jboolean]): jint {.`static`.}
  proc mismatch*(a: seq[jboolean], aFromIndex: jint, aToIndex: jint, b: seq[jboolean], bFromIndex: jint, bToIndex: jint): jint {.`static`.}
  proc mismatch*(a: seq[jbyte], b: seq[jbyte]): jint {.`static`.}
  proc mismatch*(a: seq[jbyte], aFromIndex: jint, aToIndex: jint, b: seq[jbyte], bFromIndex: jint, bToIndex: jint): jint {.`static`.}
  proc mismatch*(a: seq[jchar], b: seq[jchar]): jint {.`static`.}
  proc mismatch*(a: seq[jchar], aFromIndex: jint, aToIndex: jint, b: seq[jchar], bFromIndex: jint, bToIndex: jint): jint {.`static`.}
  proc mismatch*(a: seq[jshort], b: seq[jshort]): jint {.`static`.}
  proc mismatch*(a: seq[jshort], aFromIndex: jint, aToIndex: jint, b: seq[jshort], bFromIndex: jint, bToIndex: jint): jint {.`static`.}
  proc mismatch*(a: seq[jint], b: seq[jint]): jint {.`static`.}
  proc mismatch*(a: seq[jint], aFromIndex: jint, aToIndex: jint, b: seq[jint], bFromIndex: jint, bToIndex: jint): jint {.`static`.}
  proc mismatch*(a: seq[jlong], b: seq[jlong]): jint {.`static`.}
  proc mismatch*(a: seq[jlong], aFromIndex: jint, aToIndex: jint, b: seq[jlong], bFromIndex: jint, bToIndex: jint): jint {.`static`.}
  proc mismatch*(a: seq[jfloat], b: seq[jfloat]): jint {.`static`.}
  proc mismatch*(a: seq[jfloat], aFromIndex: jint, aToIndex: jint, b: seq[jfloat], bFromIndex: jint, bToIndex: jint): jint {.`static`.}
  proc mismatch*(a: seq[jdouble], b: seq[jdouble]): jint {.`static`.}
  proc mismatch*(a: seq[jdouble], aFromIndex: jint, aToIndex: jint, b: seq[jdouble], bFromIndex: jint, bToIndex: jint): jint {.`static`.}
  proc mismatch*(a: seq[JObject], b: seq[JObject]): jint {.`static`.}
  proc mismatch*(a: seq[JObject], aFromIndex: jint, aToIndex: jint, b: seq[JObject], bFromIndex: jint, bToIndex: jint): jint {.`static`.}
  proc mismatch*(a: seq[T], b: seq[T], cmp: Comparator[? super T]): jint {.`static`.}
  proc mismatch*(a: seq[T], aFromIndex: jint, aToIndex: jint, b: seq[T], bFromIndex: jint, bToIndex: jint, cmp: Comparator[? super T]): jint {.`static`.}

