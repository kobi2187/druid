import jnim

jclass android.media.WebVttRenderer* of Renderer:
  proc supports*(format: MediaFormat): jboolean
  proc createTrack*(format: MediaFormat): SubtitleTrack

