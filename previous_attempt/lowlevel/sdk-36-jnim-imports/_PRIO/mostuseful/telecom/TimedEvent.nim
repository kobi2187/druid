import jnim

jclass android.telecom.TimedEvent* of JVMObject:
  proc getTime*(): jlong
  proc getKey*(): T
  proc averageTimings*(events: Collection[? extends TimedEvent[T]]): Map[T, Double] {.`static`.}

