import jnim

jclass android.view.ListenerWrapper* of JVMObject:
  proc accept*(value: T)
  proc isConsumerSame*(consumer: Consumer[T]): jboolean

