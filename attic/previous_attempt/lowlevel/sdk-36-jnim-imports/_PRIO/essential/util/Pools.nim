import jnim

jclass android.util.Pools.Pool* of JVMObject:
  proc acquire*(): T
  proc release*(instance: T): jboolean

jclass android.util.Pools.SimplePool* of JVMObject:
  proc acquire*(): T
  proc release*(instance: T): jboolean

jclass android.util.Pools.SynchronizedPool* of JVMObject:
  proc acquire*(): T
  proc release*(element: T): jboolean

jclass android.util.Pool* of JVMObject:
  proc acquire*(): T
  proc release*(instance: T): jboolean

jclass android.util.SimplePool* of JVMObject:
  proc acquire*(): T
  proc release*(instance: T): jboolean

jclass android.util.SynchronizedPool* of SimplePool:
  proc acquire*(): T
  proc release*(element: T): jboolean

