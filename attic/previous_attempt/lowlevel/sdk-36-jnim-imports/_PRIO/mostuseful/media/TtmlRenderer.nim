import jnim

jclass android.media.TtmlRenderer* of Renderer:
  proc supports*(format: MediaFormat): jboolean
  proc createTrack*(format: MediaFormat): SubtitleTrack

