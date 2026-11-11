import jnim

jclass android.federatedcompute.ExampleStoreQueryCallbackImpl* of JVMObject:
  proc onStartQuerySuccess*(iterator: ExampleStoreIterator)
  proc onStartQueryFailure*(errorCode: jint)

jclass android.federatedcompute.ExampleStoreQueryCallbackImpl.IteratorAdapter* of JVMObject:
  proc next*(callback: IExampleStoreIteratorCallback)
  proc close*()

jclass android.federatedcompute.ExampleStoreQueryCallbackImpl.IteratorCallbackAdapter* of JVMObject:
  proc onIteratorNextSuccess*(result: Bundle): jboolean
  proc onIteratorNextFailure*(errorCode: jint)

jclass android.federatedcompute.IteratorAdapter* of Stub:
  proc next*(callback: IExampleStoreIteratorCallback)
  proc close*()

jclass android.federatedcompute.IteratorCallbackAdapter* of JVMObject:
  proc onIteratorNextSuccess*(result: Bundle): jboolean
  proc onIteratorNextFailure*(errorCode: jint)

