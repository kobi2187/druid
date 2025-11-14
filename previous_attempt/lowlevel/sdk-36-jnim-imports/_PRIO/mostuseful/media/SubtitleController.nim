import jnim

jclass android.media.SubtitleController* of JVMObject:
  proc getTracks*(): seq[SubtitleTrack]
  proc getSelectedTrack*(): SubtitleTrack
  proc selectTrack*(track: SubtitleTrack): jboolean
  proc getDefaultTrack*(): SubtitleTrack
  proc selectDefaultTrack*()
  proc reset*()
  proc addTrack*(format: MediaFormat): SubtitleTrack
  proc show*()
  proc hide*()
  proc registerRenderer*(renderer: Renderer)
  proc hasRendererFor*(format: MediaFormat): jboolean
  proc setAnchor*(anchor: Anchor)

jclass android.media.SubtitleController.Renderer* of JVMObject:
  proc supports*(format: MediaFormat): jboolean
  proc createTrack*(format: MediaFormat): SubtitleTrack

jclass android.media.SubtitleController.Anchor* of JVMObject:
  proc setSubtitleWidget*(subtitleWidget: RenderingWidget)
  proc getSubtitleLooper*(): Looper

jclass android.media.SubtitleController.Listener* of JVMObject:
  proc onSubtitleTrackSelected*(track: SubtitleTrack)

jclass android.media.Renderer* of JVMObject:
  proc supports*(format: MediaFormat): jboolean
  proc createTrack*(format: MediaFormat): SubtitleTrack

jclass android.media.Anchor* of JVMObject:
  proc setSubtitleWidget*(subtitleWidget: RenderingWidget)
  proc getSubtitleLooper*(): Looper

jclass android.media.Listener* of JVMObject:
  proc onSubtitleTrackSelected*(track: SubtitleTrack)

