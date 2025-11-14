import jnim

jclass android.widget.DateTimeView* of TextView:
  proc setTime*(timeMillis: jlong)
  proc setShowRelativeTime*(showRelativeTime: jboolean)
  proc setRelativeTimeDisambiguationTextMask*(disambiguationTextMask: jint)
  proc setRelativeTimeUnitDisplayLength*(unitDisplayLength: jint)
  proc isShowRelativeTime*(): jboolean
  proc setVisibility*(visibility: jint)
  proc onInitializeAccessibilityNodeInfoInternal*(info: AccessibilityNodeInfo)
  proc setReceiverHandler*(handler: Handler) {.`static`.}
  UNIT_DISPLAY_LENGTH_SHORTEST*: jint {.`static`.}
  UNIT_DISPLAY_LENGTH_MEDIUM*: jint {.`static`.}
  DISAMBIGUATION_TEXT_PAST*: jint {.`static`.}
  DISAMBIGUATION_TEXT_FUTURE*: jint {.`static`.}

