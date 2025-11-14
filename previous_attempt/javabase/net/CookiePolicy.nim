import jnim

jclass java.net.CookiePolicy* of JVMObject:
  proc shouldAccept*(uri: URI, cookie: HttpCookie): jboolean
  ACCEPT_ALL*: CookiePolicy {.`static`.}
  ACCEPT_NONE*: CookiePolicy {.`static`.}
  ACCEPT_ORIGINAL_SERVER*: CookiePolicy {.`static`.}

