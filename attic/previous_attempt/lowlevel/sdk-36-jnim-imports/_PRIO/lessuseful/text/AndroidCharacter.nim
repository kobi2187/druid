import jnim

jclass android.text.AndroidCharacter* of JVMObject:
  proc getDirectionalities*(src: seq[jchar], dest: seq[jbyte], count: jint) {.`static`.}
  proc getEastAsianWidth*(input: jchar): jint {.`static`.}
  proc getEastAsianWidths*(src: seq[jchar], start: jint, count: jint, dest: seq[jbyte]) {.`static`.}
  proc mirror*(text: seq[jchar], start: jint, count: jint): jboolean {.`static`.}
  proc getMirror*(ch: jchar): jchar {.`static`.}
  EAST_ASIAN_WIDTH_NEUTRAL*: jint {.`static`.}
  EAST_ASIAN_WIDTH_AMBIGUOUS*: jint {.`static`.}
  EAST_ASIAN_WIDTH_HALF_WIDTH*: jint {.`static`.}
  EAST_ASIAN_WIDTH_FULL_WIDTH*: jint {.`static`.}
  EAST_ASIAN_WIDTH_NARROW*: jint {.`static`.}
  EAST_ASIAN_WIDTH_WIDE*: jint {.`static`.}

