import jnim

jclass android.text.Emoji* of JVMObject:
  proc isRegionalIndicatorSymbol*(codePoint: jint): jboolean {.`static`.}
  proc isEmojiModifier*(codePoint: jint): jboolean {.`static`.}
  proc isEmojiModifierBase*(c: jint): jboolean {.`static`.}
  proc isEmoji*(codePoint: jint): jboolean {.`static`.}
  proc isKeycapBase*(codePoint: jint): jboolean {.`static`.}
  proc isTagSpecChar*(codePoint: jint): jboolean {.`static`.}
  COMBINING_ENCLOSING_KEYCAP*: jint {.`static`.}
  ZERO_WIDTH_JOINER*: jint {.`static`.}
  VARIATION_SELECTOR_16*: jint {.`static`.}
  CANCEL_TAG*: jint {.`static`.}

