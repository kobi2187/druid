import jnim

jclass android.util.Patterns* of JVMObject:
  proc concatGroups*(matcher: Matcher): string {.`static`.}
  proc digitsAndPlusOnly*(matcher: Matcher): string {.`static`.}
  TOP_LEVEL_DOMAIN_STR*: string {.`static`.}
  TOP_LEVEL_DOMAIN*: Pattern {.`static`.}
  TOP_LEVEL_DOMAIN_STR_FOR_WEB_URL*: string {.`static`.}
  GOOD_IRI_CHAR*: string {.`static`.}
  IP_ADDRESS*: Pattern {.`static`.}
  DOMAIN_NAME*: Pattern {.`static`.}
  WEB_URL*: Pattern {.`static`.}
  AUTOLINK_WEB_URL*: Pattern {.`static`.}
  AUTOLINK_EMAIL_ADDRESS*: Pattern {.`static`.}
  EMAIL_ADDRESS*: Pattern {.`static`.}
  PHONE*: Pattern {.`static`.}

