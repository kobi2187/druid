import jnim

jclass android.graphics.Interpolator* of JVMObject:
  proc reset*(valueCount: jint)
  proc reset*(valueCount: jint, frameCount: jint)
  proc getKeyFrameCount*(): jint
  proc getValueCount*(): jint
  proc setKeyFrame*(index: jint, msec: jint, values: seq[jfloat])
  proc setKeyFrame*(index: jint, msec: jint, values: seq[jfloat], blend: seq[jfloat])
  proc setRepeatMirror*(repeatCount: jfloat, mirror: jboolean)
  proc timeToValues*(values: seq[jfloat]): Result
  proc timeToValues*(msec: jint, values: seq[jfloat]): Result

