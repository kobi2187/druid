import jnim

jclass android.graphics.BlendModeColorFilter* of ColorFilter:
  proc getColor*(): jint
  proc getMode*(): BlendMode
  proc equals*(object: JObject): jboolean
  proc hashCode*(): jint

