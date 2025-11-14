import jnim

jclass java.net.CookieHandler* of JVMObject:
  proc getDefault*(): CookieHandler {.`static`.}
  proc setDefault*(cHandler: CookieHandler) {.`static`.}
  proc get*(uri: URI, requestHeaders: Map[string, List[string]]): Map[string, List[string]]
  proc put*(uri: URI, responseHeaders: Map[string, List[string]])

