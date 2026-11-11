import jnim

jclass android.media.AudioGainConfig* of JVMObject:
  proc mode*(): jint
  proc channelMask*(): jint
  proc values*(): seq[jint]
  proc rampDurationMs*(): jint

