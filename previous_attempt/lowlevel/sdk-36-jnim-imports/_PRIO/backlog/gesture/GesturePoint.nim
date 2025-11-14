import jnim

jclass android.gesture.GesturePoint* of JVMObject:
  proc clone*(): JObject
  x*: jfloat
  y*: jfloat
  timestamp*: jlong

