import jnim

jclass android.util.Range* of JVMObject:
  proc create*(lower: T, upper: T): Range[T] {.`static`.}
  proc getLower*(): T
  proc getUpper*(): T
  proc contains*(value: T): jboolean
  proc contains*(range: Range[T]): jboolean
  proc equals*(obj: JObject): jboolean
  proc clamp*(value: T): T
  proc intersect*(range: Range[T]): Range[T]
  proc intersect*(lower: T, upper: T): Range[T]
  proc extend*(range: Range[T]): Range[T]
  proc extend*(lower: T, upper: T): Range[T]
  proc extend*(value: T): Range[T]
  proc toString*(): string
  proc hashCode*(): jint

