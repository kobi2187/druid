import jnim

jclass android.graphics.BitmapShader* of Shader:
  proc getFilterMode*(): jint
  proc setFilterMode*(mode: jint)
  proc setMaxAnisotropy*(maxAnisotropy: jint)
  proc setOverrideGainmap*(overrideGainmap: Gainmap)
  proc getMaxAnisotropy*(): jint
  FILTER_MODE_DEFAULT*: jint {.`static`.}
  FILTER_MODE_NEAREST*: jint {.`static`.}
  FILTER_MODE_LINEAR*: jint {.`static`.}

