import jnim

jclass android.database.Observable* of JVMObject:
  proc registerObserver*(observer: T)
  proc unregisterObserver*(observer: T)
  proc unregisterAll*()

