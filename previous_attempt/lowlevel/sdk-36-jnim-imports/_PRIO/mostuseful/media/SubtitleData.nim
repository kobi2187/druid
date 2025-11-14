import jnim

jclass android.media.SubtitleData* of JVMObject:
  proc getTrackIndex*(): jint
  proc getStartTimeUs*(): jlong
  proc getDurationUs*(): jlong
  proc getData*(): seq[jbyte]

