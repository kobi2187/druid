import jnim

jclass java.net.URLConnection* of JVMObject:
  proc getFileNameMap*(): FileNameMap {.`static`.}
  proc setFileNameMap*(map: FileNameMap) {.`static`.}
  proc connect*()
  proc setConnectTimeout*(timeout: jint)
  proc getConnectTimeout*(): jint
  proc setReadTimeout*(timeout: jint)
  proc getReadTimeout*(): jint
  proc getURL*(): URL
  proc getContentLength*(): jint
  proc getContentLengthLong*(): jlong
  proc getContentType*(): string
  proc getContentEncoding*(): string
  proc getExpiration*(): jlong
  proc getDate*(): jlong
  proc getLastModified*(): jlong
  proc getHeaderField*(name: string): string
  proc getHeaderFields*(): Map[string, List[string]]
  proc getHeaderFieldInt*(name: string, defaultValue: jint): jint
  proc getHeaderFieldLong*(name: string, defaultValue: jlong): jlong
  proc getHeaderFieldDate*(name: string, defaultValue: jlong): jlong
  proc getHeaderFieldKey*(n: jint): string
  proc getHeaderField*(n: jint): string
  proc getContent*(): JObject
  proc getContent*(classes: Class[?]): JObject
  proc getPermission*(): Permission
  proc getInputStream*(): InputStream
  proc getOutputStream*(): OutputStream
  proc toString*(): string
  proc setDoInput*(doinput: jboolean)
  proc getDoInput*(): jboolean
  proc setDoOutput*(dooutput: jboolean)
  proc getDoOutput*(): jboolean
  proc setAllowUserInteraction*(allowuserinteraction: jboolean)
  proc getAllowUserInteraction*(): jboolean
  proc setDefaultAllowUserInteraction*(defaultallowuserinteraction: jboolean) {.`static`.}
  proc getDefaultAllowUserInteraction*(): jboolean {.`static`.}
  proc setUseCaches*(usecaches: jboolean)
  proc getUseCaches*(): jboolean
  proc setIfModifiedSince*(ifmodifiedsince: jlong)
  proc getIfModifiedSince*(): jlong
  proc getDefaultUseCaches*(): jboolean
  proc setDefaultUseCaches*(defaultusecaches: jboolean)
  proc setDefaultUseCaches*(protocol: string, defaultVal: jboolean) {.`static`.}
  proc getDefaultUseCaches*(protocol: string): jboolean {.`static`.}
  proc setRequestProperty*(key: string, value: string)
  proc addRequestProperty*(key: string, value: string)
  proc getRequestProperty*(key: string): string
  proc getRequestProperties*(): Map[string, List[string]]
  proc setDefaultRequestProperty*(key: string, value: string) {.`static`.}
  proc getDefaultRequestProperty*(key: string): string {.`static`.}
  proc setContentHandlerFactory*(fac: ContentHandlerFactory) {.`static`.}
  proc guessContentTypeFromName*(fname: string): string {.`static`.}
  proc guessContentTypeFromStream*(is: InputStream): string {.`static`.}

