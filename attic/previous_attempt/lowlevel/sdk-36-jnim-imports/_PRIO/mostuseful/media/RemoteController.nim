import jnim

jclass android.media.RemoteController* of JVMObject:
  proc getEstimatedMediaPosition*(): jlong
  proc sendMediaKeyEvent*(keyEvent: KeyEvent): jboolean
  proc seekTo*(timeMs: jlong): jboolean
  proc setArtworkConfiguration*(wantBitmap: jboolean, width: jint, height: jint): jboolean
  proc setArtworkConfiguration*(width: jint, height: jint): jboolean
  proc clearArtworkConfiguration*(): jboolean
  proc setSynchronizationMode*(sync: jint): jboolean
  proc editMetadata*(): MetadataEditor
  POSITION_SYNCHRONIZATION_NONE*: jint {.`static`.}
  POSITION_SYNCHRONIZATION_CHECK*: jint {.`static`.}

jclass android.media.RemoteController.OnClientUpdateListener* of JVMObject:
  proc onClientChange*(clearing: jboolean)
  proc onClientPlaybackStateUpdate*(state: jint)
  proc onClientPlaybackStateUpdate*(state: jint, stateChangeTimeMs: jlong, currentPosMs: jlong, speed: jfloat)
  proc onClientTransportControlUpdate*(transportControlFlags: jint)
  proc onClientMetadataUpdate*(metadataEditor: MetadataEditor)

jclass android.media.RemoteController.MetadataEditor* of JVMObject:
  proc apply*()

jclass android.media.OnClientUpdateListener* of JVMObject:
  proc onClientChange*(clearing: jboolean)
  proc onClientPlaybackStateUpdate*(state: jint)
  proc onClientPlaybackStateUpdate*(state: jint, stateChangeTimeMs: jlong, currentPosMs: jlong, speed: jfloat)
  proc onClientTransportControlUpdate*(transportControlFlags: jint)
  proc onClientMetadataUpdate*(metadataEditor: MetadataEditor)

jclass android.media.MetadataEditor* of MediaMetadataEditor:
  proc apply*()

