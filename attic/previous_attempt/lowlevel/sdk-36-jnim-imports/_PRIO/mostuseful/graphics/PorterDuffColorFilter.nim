import jnim

jclass android.graphics.PorterDuffColorFilter* of ColorFilter:
  proc getColor*(): jint
  proc getMode*(): PorterDuff.Mode
  proc equals*(object: JObject): jboolean
  proc hashCode*(): jint

