import jnim

jclass java.net.CookieManager* of CookieHandler:
  proc setCookiePolicy*(cookiePolicy: CookiePolicy)
  proc getCookieStore*(): CookieStore
  proc get*(uri: URI, requestHeaders: Map[string, List[string]]): Map[string, List[string]]
  proc put*(uri: URI, responseHeaders: Map[string, List[string]])

