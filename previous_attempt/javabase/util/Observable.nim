import jnim

jclass java.util.Observable* of JVMObject:
  proc addObserver*(o: Observer)
  proc deleteObserver*(o: Observer)
  proc notifyObservers*()
  proc notifyObservers*(arg: JObject)
  proc deleteObservers*()
  proc hasChanged*(): jboolean
  proc countObservers*(): jint

