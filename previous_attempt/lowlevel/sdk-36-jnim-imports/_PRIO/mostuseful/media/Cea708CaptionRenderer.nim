import jnim

jclass android.media.Cea708CaptionRenderer* of Renderer:
  proc supports*(format: MediaFormat): jboolean
  proc createTrack*(format: MediaFormat): SubtitleTrack

jclass android.media.CaptionColor* of JVMObject:
  proc getArgbValue*(): jint
  OPACITY_SOLID*: jint {.`static`.}
  OPACITY_FLASH*: jint {.`static`.}
  OPACITY_TRANSLUCENT*: jint {.`static`.}
  OPACITY_TRANSPARENT*: jint {.`static`.}
  opacity*: jint
  red*: jint
  green*: jint
  blue*: jint

jclass android.media.CaptionEvent* of JVMObject:
  typ*: jint
  obj*: JObject

jclass android.media.CaptionPenAttr* of JVMObject:
  PEN_SIZE_SMALL*: jint {.`static`.}
  PEN_SIZE_STANDARD*: jint {.`static`.}
  PEN_SIZE_LARGE*: jint {.`static`.}
  OFFSET_SUBSCRIPT*: jint {.`static`.}
  OFFSET_NORMAL*: jint {.`static`.}
  OFFSET_SUPERSCRIPT*: jint {.`static`.}
  penSize*: jint
  penOffset*: jint
  textTag*: jint
  fontTag*: jint
  edgeType*: jint
  underline*: jboolean
  italic*: jboolean

jclass android.media.CaptionPenColor* of JVMObject:
  foregroundColor*: CaptionColor
  backgroundColor*: CaptionColor
  edgeColor*: CaptionColor

jclass android.media.CaptionPenLocation* of JVMObject:
  row*: jint
  column*: jint

jclass android.media.CaptionWindowAttr* of JVMObject:
  fillColor*: CaptionColor
  borderColor*: CaptionColor
  borderType*: jint
  wordWrap*: jboolean
  printDirection*: jint
  scrollDirection*: jint
  justify*: jint
  effectDirection*: jint
  effectSpeed*: jint
  displayEffect*: jint

jclass android.media.CaptionWindow* of JVMObject:
  id*: jint
  visible*: jboolean
  rowLock*: jboolean
  columnLock*: jboolean
  priority*: jint
  relativePositioning*: jboolean
  anchorVertical*: jint
  anchorHorizontal*: jint
  anchorId*: jint
  rowCount*: jint
  columnCount*: jint
  penStyle*: jint
  windowStyle*: jint

