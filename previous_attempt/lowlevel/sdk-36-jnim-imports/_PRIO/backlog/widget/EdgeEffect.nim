import jnim

jclass android.widget.EdgeEffect* of JVMObject:
  proc setSize*(width: jint, height: jint)
  proc isFinished*(): jboolean
  proc finish*()
  proc onPull*(deltaDistance: jfloat)
  proc onPull*(deltaDistance: jfloat, displacement: jfloat)
  proc onPullDistance*(deltaDistance: jfloat, displacement: jfloat): jfloat
  proc getDistance*(): jfloat
  proc onRelease*()
  proc onAbsorb*(velocity: jint)
  proc setColor*(color: jint)
  proc setBlendMode*(blendmode: BlendMode)
  proc getColor*(): jint
  proc getBlendMode*(): BlendMode
  proc draw*(canvas: Canvas): jboolean
  proc getMaxHeight*(): jint
  USE_STRETCH_EDGE_EFFECT_BY_DEFAULT*: jlong {.`static`.}
  DEFAULT_BLEND_MODE*: BlendMode {.`static`.}

