import jnim

jclass android.media.AudioPortConfig* of JVMObject:
  proc port*(): AudioPort
  proc samplingRate*(): jint
  proc channelMask*(): jint
  proc format*(): jint
  proc gain*(): AudioGainConfig
  proc toString*(): string

