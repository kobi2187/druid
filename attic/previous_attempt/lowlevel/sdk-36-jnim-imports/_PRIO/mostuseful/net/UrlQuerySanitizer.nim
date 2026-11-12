import jnim

jclass android.net.UrlQuerySanitizer* of JVMObject:
  proc getUnregisteredParameterValueSanitizer*(): ValueSanitizer
  proc setUnregisteredParameterValueSanitizer*(sanitizer: ValueSanitizer)
  proc getAllIllegal*(): ValueSanitizer {.`static`.}
  proc getAllButNulLegal*(): ValueSanitizer {.`static`.}
  proc getAllButWhitespaceLegal*(): ValueSanitizer {.`static`.}
  proc getUrlLegal*(): ValueSanitizer {.`static`.}
  proc getUrlAndSpaceLegal*(): ValueSanitizer {.`static`.}
  proc getAmpLegal*(): ValueSanitizer {.`static`.}
  proc getAmpAndSpaceLegal*(): ValueSanitizer {.`static`.}
  proc getSpaceLegal*(): ValueSanitizer {.`static`.}
  proc getAllButNulAndAngleBracketsLegal*(): ValueSanitizer {.`static`.}
  proc parseUrl*(url: string)
  proc parseQuery*(query: string)
  proc getParameterSet*(): Set[string]
  proc getParameterList*(): List[ParameterValuePair]
  proc hasParameter*(parameter: string): jboolean
  proc getValue*(parameter: string): string
  proc registerParameter*(parameter: string, valueSanitizer: ValueSanitizer)
  proc registerParameters*(parameters: seq[string], valueSanitizer: ValueSanitizer)
  proc setAllowUnregisteredParamaters*(allowUnregisteredParamaters: jboolean)
  proc getAllowUnregisteredParamaters*(): jboolean
  proc setPreferFirstRepeatedParameter*(preferFirstRepeatedParameter: jboolean)
  proc getPreferFirstRepeatedParameter*(): jboolean
  proc getValueSanitizer*(parameter: string): ValueSanitizer
  proc getEffectiveValueSanitizer*(parameter: string): ValueSanitizer
  proc unescape*(string: string): string

jclass android.net.UrlQuerySanitizer.ValueSanitizer* of JVMObject:
  proc sanitize*(value: string): string

jclass android.net.UrlQuerySanitizer.IllegalCharacterValueSanitizer* of JVMObject:
  proc sanitize*(value: string): string

jclass android.net.ParameterValuePair* of JVMObject:
  mParameter*: string
  mValue*: string

jclass android.net.ValueSanitizer* of JVMObject:
  proc sanitize*(value: string): string

jclass android.net.IllegalCharacterValueSanitizer* of JVMObject:
  proc sanitize*(value: string): string
  SPACE_OK*: jint {.`static`.}
  OTHER_WHITESPACE_OK*: jint {.`static`.}
  NON_7_BIT_ASCII_OK*: jint {.`static`.}
  DQUOTE_OK*: jint {.`static`.}
  SQUOTE_OK*: jint {.`static`.}
  LT_OK*: jint {.`static`.}
  GT_OK*: jint {.`static`.}
  AMP_OK*: jint {.`static`.}
  PCT_OK*: jint {.`static`.}
  NUL_OK*: jint {.`static`.}
  SCRIPT_URL_OK*: jint {.`static`.}
  ALL_OK*: jint {.`static`.}
  ALL_WHITESPACE_OK*: jint {.`static`.}
  ALL_ILLEGAL*: jint {.`static`.}
  ALL_BUT_NUL_LEGAL*: jint {.`static`.}
  ALL_BUT_WHITESPACE_LEGAL*: jint {.`static`.}
  URL_LEGAL*: jint {.`static`.}
  URL_AND_SPACE_LEGAL*: jint {.`static`.}
  AMP_LEGAL*: jint {.`static`.}
  AMP_AND_SPACE_LEGAL*: jint {.`static`.}
  SPACE_LEGAL*: jint {.`static`.}
  ALL_BUT_NUL_AND_ANGLE_BRACKETS_LEGAL*: jint {.`static`.}

