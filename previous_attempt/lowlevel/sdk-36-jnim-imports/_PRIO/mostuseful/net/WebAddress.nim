import jnim

jclass android.net.WebAddress* of JVMObject:
  proc toString*(): string
  proc setScheme*(scheme: string)
  proc getScheme*(): string
  proc setHost*(host: string)
  proc getHost*(): string
  proc setPort*(port: jint)
  proc getPort*(): jint
  proc setPath*(path: string)
  proc getPath*(): string
  proc setAuthInfo*(authInfo: string)
  proc getAuthInfo*(): string

