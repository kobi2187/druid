import jnim

jclass java.net.ContentHandler* of JVMObject:
  proc getContent*(urlc: URLConnection): JObject
  proc getContent*(urlc: URLConnection, classes: seq[Class]): JObject

