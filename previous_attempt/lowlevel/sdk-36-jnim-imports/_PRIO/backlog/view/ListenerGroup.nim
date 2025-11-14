import jnim

jclass android.view.ListenerGroup* of JVMObject:
  proc accept*(value: T)
  proc addListener*(executor: Executor, consumer: Consumer[T])
  proc removeListener*(consumer: Consumer[T])
  proc isConsumerPresent*(consumer: Consumer[T]): jboolean

