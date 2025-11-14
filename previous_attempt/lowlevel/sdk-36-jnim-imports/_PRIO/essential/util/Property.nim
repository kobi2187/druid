import jnim

jclass android.util.Property* of JVMObject:
  proc of*(hostType: Class[T], valueType: Class[V], name: string): Property[T, V] {.`static`.}
  proc isReadOnly*(): jboolean
  proc set*(object: T, value: V)
  proc get*(object: T): V
  proc getName*(): string
  proc getType*(): Class[V]

