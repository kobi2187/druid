import jnim

jclass java.text.Collator* of JVMObject:
  proc getInstance*(): Collator {.`static`.}
  proc getInstance*(desiredLocale: Locale): Collator {.`static`.}
  proc compare*(source: string, target: string): jint
  proc compare*(o1: JObject, o2: JObject): jint
  proc getCollationKey*(source: string): CollationKey
  proc equals*(source: string, target: string): jboolean
  proc getStrength*(): jint
  proc setStrength*(newStrength: jint)
  proc getDecomposition*(): jint
  proc setDecomposition*(decompositionMode: jint)
  proc getAvailableLocales*(): seq[Locale] {.`static`.}
  proc clone*(): JObject
  proc equals*(that: JObject): jboolean
  proc hashCode*(): jint
  PRIMARY*: jint {.`static`.}
  SECONDARY*: jint {.`static`.}
  TERTIARY*: jint {.`static`.}
  IDENTICAL*: jint {.`static`.}
  NO_DECOMPOSITION*: jint {.`static`.}
  CANONICAL_DECOMPOSITION*: jint {.`static`.}
  FULL_DECOMPOSITION*: jint {.`static`.}

