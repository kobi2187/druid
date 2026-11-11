import jnim

jclass java.util.Objects* of JVMObject:
  proc equals*(a: JObject, b: JObject): jboolean {.`static`.}
  proc deepEquals*(a: JObject, b: JObject): jboolean {.`static`.}
  proc hashCode*(o: JObject): jint {.`static`.}
  proc hash*(values: JObject): jint {.`static`.}
  proc toString*(o: JObject): string {.`static`.}
  proc toString*(o: JObject, nullDefault: string): string {.`static`.}
  proc toIdentityString*(o: JObject): string {.`static`.}
  proc compare*(a: T, b: T, c: Comparator[? super T]): jint {.`static`.}
  proc requireNonNull*(obj: T): T {.`static`.}
  proc requireNonNull*(obj: T, message: string): T {.`static`.}
  proc isNull*(obj: JObject): jboolean {.`static`.}
  proc nonNull*(obj: JObject): jboolean {.`static`.}
  proc requireNonNullElse*(obj: T, defaultObj: T): T {.`static`.}
  proc requireNonNullElseGet*(obj: T, supplier: Supplier[? extends T]): T {.`static`.}
  proc requireNonNull*(obj: T, messageSupplier: Supplier[string]): T {.`static`.}
  proc checkIndex*(index: jint, length: jint): jint {.`static`.}
  proc checkFromToIndex*(fromIndex: jint, toIndex: jint, length: jint): jint {.`static`.}
  proc checkFromIndexSize*(fromIndex: jint, size: jint, length: jint): jint {.`static`.}
  proc checkIndex*(index: jlong, length: jlong): jlong {.`static`.}
  proc checkFromToIndex*(fromIndex: jlong, toIndex: jlong, length: jlong): jlong {.`static`.}
  proc checkFromIndexSize*(fromIndex: jlong, size: jlong, length: jlong): jlong {.`static`.}

