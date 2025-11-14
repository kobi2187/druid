import jnim

jclass android.bluetooth.CallbackWrapper* of JVMObject:
  proc forEach*(consumer: Consumer[T])
  proc registerCallback*(service: S, callback: T, executor: Executor)
  proc unregisterCallback*(service: S, callback: T)
  proc registerToNewService*(service: S)

