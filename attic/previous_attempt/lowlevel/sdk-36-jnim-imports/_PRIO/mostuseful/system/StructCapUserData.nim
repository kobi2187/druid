import jnim

jclass android.system.StructCapUserData* of JVMObject:
  proc toString*(): string
  effective*: jint
  permitted*: jint
  inheritable*: jint

