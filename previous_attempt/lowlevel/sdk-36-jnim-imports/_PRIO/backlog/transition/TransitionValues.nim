import jnim

jclass android.transition.TransitionValues* of JVMObject:
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  view*: View
  values*: Map[string, JObject]

