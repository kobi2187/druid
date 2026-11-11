import jnim

jclass android.media.TimedText* of JVMObject:
  proc getText*(): string
  proc getBounds*(): Rect

jclass android.media.CharPos* of JVMObject:
  startChar*: jint
  endChar*: jint

jclass android.media.Justification* of JVMObject:
  horizontalJustification*: jint
  verticalJustification*: jint

jclass android.media.Style* of JVMObject:
  startChar*: jint
  endChar*: jint
  fontID*: jint
  isBold*: jboolean
  isItalic*: jboolean
  isUnderlined*: jboolean
  fontSize*: jint
  colorRGBA*: jint

jclass android.media.Font* of JVMObject:
  ID*: jint
  name*: string

jclass android.media.Karaoke* of JVMObject:
  startTimeMs*: jint
  endTimeMs*: jint
  startChar*: jint
  endChar*: jint

jclass android.media.HyperText* of JVMObject:
  startChar*: jint
  endChar*: jint
  URL*: string
  altString*: string

