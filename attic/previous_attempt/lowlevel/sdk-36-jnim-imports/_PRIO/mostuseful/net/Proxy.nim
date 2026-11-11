import jnim

jclass android.net.Proxy* of JVMObject:
  proc getProxy*(ctx: Context, url: string): java.net.Proxy {.`static`.}
  proc getHost*(ctx: Context): string {.`static`.}
  proc getPort*(ctx: Context): jint {.`static`.}
  proc getDefaultHost*(): string {.`static`.}
  proc getDefaultPort*(): jint {.`static`.}
  proc setHttpProxySystemProperty*(p: ProxyInfo) {.`static`.}
  proc setHttpProxyConfiguration*(p: ProxyInfo) {.`static`.}
  proc setHttpProxyConfiguration*(host: string, port: string, exclList: string, pacFileUrl: Uri) {.`static`.}
  PROXY_CHANGE_ACTION*: string {.`static`.}
  EXTRA_PROXY_INFO*: string {.`static`.}

