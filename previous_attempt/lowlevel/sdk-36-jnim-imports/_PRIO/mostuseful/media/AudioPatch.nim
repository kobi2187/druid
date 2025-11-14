import jnim

jclass android.media.AudioPatch* of JVMObject:
  proc sources*(): seq[AudioPortConfig]
  proc sinks*(): seq[AudioPortConfig]
  proc id*(): jint
  proc toString*(): string

