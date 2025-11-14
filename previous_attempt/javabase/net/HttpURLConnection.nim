import jnim

jclass java.net.HttpURLConnection* of URLConnection:
  proc setAuthenticator*(auth: Authenticator)
  proc getHeaderFieldKey*(n: jint): string
  proc setFixedLengthStreamingMode*(contentLength: jint)
  proc setFixedLengthStreamingMode*(contentLength: jlong)
  proc setChunkedStreamingMode*(chunklen: jint)
  proc getHeaderField*(n: jint): string
  proc setFollowRedirects*(set: jboolean) {.`static`.}
  proc getFollowRedirects*(): jboolean {.`static`.}
  proc setInstanceFollowRedirects*(followRedirects: jboolean)
  proc getInstanceFollowRedirects*(): jboolean
  proc setRequestMethod*(method: string)
  proc getRequestMethod*(): string
  proc getResponseCode*(): jint
  proc getResponseMessage*(): string
  proc getHeaderFieldDate*(name: string, defaultValue: jlong): jlong
  proc disconnect*()
  proc usingProxy*(): jboolean
  proc getPermission*(): Permission
  proc getErrorStream*(): InputStream
  HTTP_OK*: jint {.`static`.}
  HTTP_CREATED*: jint {.`static`.}
  HTTP_ACCEPTED*: jint {.`static`.}
  HTTP_NOT_AUTHORITATIVE*: jint {.`static`.}
  HTTP_NO_CONTENT*: jint {.`static`.}
  HTTP_RESET*: jint {.`static`.}
  HTTP_PARTIAL*: jint {.`static`.}
  HTTP_MULT_CHOICE*: jint {.`static`.}
  HTTP_MOVED_PERM*: jint {.`static`.}
  HTTP_MOVED_TEMP*: jint {.`static`.}
  HTTP_SEE_OTHER*: jint {.`static`.}
  HTTP_NOT_MODIFIED*: jint {.`static`.}
  HTTP_USE_PROXY*: jint {.`static`.}
  HTTP_BAD_REQUEST*: jint {.`static`.}
  HTTP_UNAUTHORIZED*: jint {.`static`.}
  HTTP_PAYMENT_REQUIRED*: jint {.`static`.}
  HTTP_FORBIDDEN*: jint {.`static`.}
  HTTP_NOT_FOUND*: jint {.`static`.}
  HTTP_BAD_METHOD*: jint {.`static`.}
  HTTP_NOT_ACCEPTABLE*: jint {.`static`.}
  HTTP_PROXY_AUTH*: jint {.`static`.}
  HTTP_CLIENT_TIMEOUT*: jint {.`static`.}
  HTTP_CONFLICT*: jint {.`static`.}
  HTTP_GONE*: jint {.`static`.}
  HTTP_LENGTH_REQUIRED*: jint {.`static`.}
  HTTP_PRECON_FAILED*: jint {.`static`.}
  HTTP_ENTITY_TOO_LARGE*: jint {.`static`.}
  HTTP_REQ_TOO_LONG*: jint {.`static`.}
  HTTP_UNSUPPORTED_TYPE*: jint {.`static`.}
  HTTP_SERVER_ERROR*: jint {.`static`.}
  HTTP_INTERNAL_ERROR*: jint {.`static`.}
  HTTP_NOT_IMPLEMENTED*: jint {.`static`.}
  HTTP_BAD_GATEWAY*: jint {.`static`.}
  HTTP_UNAVAILABLE*: jint {.`static`.}
  HTTP_GATEWAY_TIMEOUT*: jint {.`static`.}
  HTTP_VERSION*: jint {.`static`.}

