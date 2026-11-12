import jnim

jclass android.media.ClosedCaptionRenderer* of Renderer:
  proc supports*(format: MediaFormat): jboolean
  proc createTrack*(format: MediaFormat): SubtitleTrack

jclass android.media.MutableBackgroundColorSpan* of CharacterStyle:
  proc setBackgroundColor*(color: jint)
  proc getBackgroundColor*(): jint
  proc updateDrawState*(ds: TextPaint)

