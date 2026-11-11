import jnim

jclass android.gesture.Prediction* of JVMObject:
  proc toString*(): string
  name*: string
  score*: jdouble

