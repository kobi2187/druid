import jnim

jclass java.lang.ScopedValue* of JVMObject:
  proc hashCode*(): jint
  proc where*(key: ScopedValue[T], value: T): Carrier {.`static`.}
  proc newInstance*(): ScopedValue[T] {.`static`.}
  proc get*(): T
  proc isBound*(): jboolean
  proc orElse*(other: T): T
  proc orElseThrow*(exceptionSupplier: Supplier[? extends X]): T

jclass java.lang.ScopedValue.Carrier* of JVMObject:
  proc where*(key: ScopedValue[T], value: T): Carrier
  proc get*(key: ScopedValue[T]): T
  proc call*(op: CallableOp[? extends R, X]): R
  proc run*(op: Runnable)

jclass java.lang.ScopedValue.CallableOp* of JVMObject:

jclass java.lang.Carrier* of JVMObject:
  proc where*(key: ScopedValue[T], value: T): Carrier
  proc get*(key: ScopedValue[T]): T
  proc call*(op: CallableOp[? extends R, X]): R
  proc run*(op: Runnable)

jclass java.lang.CallableOp* of JVMObject:

