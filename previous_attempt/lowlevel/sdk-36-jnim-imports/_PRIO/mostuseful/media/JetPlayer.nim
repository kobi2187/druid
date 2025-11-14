import jnim

jclass android.media.JetPlayer* of JVMObject:
  proc getJetPlayer*(): JetPlayer {.`static`.}
  proc clone*(): JObject
  proc release*()
  proc getMaxTracks*(): jint {.`static`.}
  proc loadJetFile*(path: string): jboolean
  proc loadJetFile*(afd: AssetFileDescriptor): jboolean
  proc closeJetFile*(): jboolean
  proc play*(): jboolean
  proc pause*(): jboolean
  proc queueJetSegment*(segmentNum: jint, libNum: jint, repeatCount: jint, transpose: jint, muteFlags: jint, userID: jbyte): jboolean
  proc queueJetSegmentMuteArray*(segmentNum: jint, libNum: jint, repeatCount: jint, transpose: jint, muteArray: seq[jboolean], userID: jbyte): jboolean
  proc setMuteFlags*(muteFlags: jint, sync: jboolean): jboolean
  proc setMuteArray*(muteArray: seq[jboolean], sync: jboolean): jboolean
  proc setMuteFlag*(trackId: jint, muteFlag: jboolean, sync: jboolean): jboolean
  proc triggerClip*(clipId: jint): jboolean
  proc clearQueue*(): jboolean
  proc setEventListener*(listener: OnJetEventListener)
  proc setEventListener*(listener: OnJetEventListener, handler: Handler)

