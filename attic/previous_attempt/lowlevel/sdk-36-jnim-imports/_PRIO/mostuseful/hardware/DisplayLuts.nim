import jnim

jclass android.hardware.DisplayLuts* of JVMObject:
  proc toString*(): string
  proc set*(entry: Entry)
  proc set*(first: Entry, second: Entry)
  proc valid*(): jboolean
  proc getLutBuffers*(): seq[jfloat]
  proc getOffsets*(): seq[jint]
  proc getLutSizes*(): seq[jint]
  proc getLutDimensions*(): seq[jint]
  proc getLutSamplingKeys*(): seq[jint]

jclass android.hardware.DisplayLuts.Entry* of JVMObject:
  proc getDimension*(): jint
  proc getSize*(): jint
  proc getBuffer*(): seq[jfloat]
  proc getSamplingKey*(): jint
  proc toString*(): string

jclass android.hardware.Entry* of JVMObject:
  proc getDimension*(): jint
  proc getSize*(): jint
  proc getBuffer*(): seq[jfloat]
  proc getSamplingKey*(): jint
  proc toString*(): string

