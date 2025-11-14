import jnim

jclass android.media.SRTRenderer* of Renderer:
  proc supports*(format: MediaFormat): jboolean
  proc createTrack*(format: MediaFormat): SubtitleTrack

