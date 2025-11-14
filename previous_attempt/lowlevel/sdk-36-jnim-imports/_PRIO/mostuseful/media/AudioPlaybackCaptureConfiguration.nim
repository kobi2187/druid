import jnim

jclass android.media.AudioPlaybackCaptureConfiguration* of JVMObject:
  proc getMediaProjection*(): MediaProjection
  proc getMatchingUsages*(): seq[jint]
  proc getMatchingUids*(): seq[jint]
  proc getExcludeUsages*(): seq[jint]
  proc getExcludeUids*(): seq[jint]

jclass android.media.AudioPlaybackCaptureConfiguration.Builder* of JVMObject:
  proc addMatchingUsage*(usage: jint): Builder
  proc addMatchingUid*(uid: jint): Builder
  proc excludeUsage*(usage: jint): Builder
  proc excludeUid*(uid: jint): Builder
  proc build*(): AudioPlaybackCaptureConfiguration

jclass android.media.Builder* of JVMObject:
  proc addMatchingUsage*(usage: jint): Builder
  proc addMatchingUid*(uid: jint): Builder
  proc excludeUsage*(usage: jint): Builder
  proc excludeUid*(uid: jint): Builder
  proc build*(): AudioPlaybackCaptureConfiguration

