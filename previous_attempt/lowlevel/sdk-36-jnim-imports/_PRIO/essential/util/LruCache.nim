import jnim

jclass android.util.LruCache* of JVMObject:
  proc resize*(maxSize: jint)
  proc get*(key: K): V
  proc put*(key: K, value: V): V
  proc trimToSize*(maxSize: jint)
  proc remove*(key: K): V
  proc evictAll*()
  proc size*(): jint
  proc maxSize*(): jint
  proc hitCount*(): jint
  proc missCount*(): jint
  proc createCount*(): jint
  proc putCount*(): jint
  proc evictionCount*(): jint
  proc snapshot*(): Map[K, V]
  proc toString*(): string

