import jnim

jclass java.net.CookieStore* of JVMObject:
  proc add*(uri: URI, cookie: HttpCookie)
  proc get*(uri: URI): List[HttpCookie]
  proc getCookies*(): List[HttpCookie]
  proc getURIs*(): List[URI]
  proc remove*(uri: URI, cookie: HttpCookie): jboolean
  proc removeAll*(): jboolean

