import jnim

jclass java.net.SocketOptions* of JVMObject:
  proc setOption*(optID: jint, value: JObject)
  proc getOption*(optID: jint): JObject
  TCP_NODELAY*: jint {.`static`.}
  SO_BINDADDR*: jint {.`static`.}
  SO_REUSEADDR*: jint {.`static`.}
  SO_REUSEPORT*: jint {.`static`.}
  SO_BROADCAST*: jint {.`static`.}
  IP_MULTICAST_IF*: jint {.`static`.}
  IP_MULTICAST_IF2*: jint {.`static`.}
  IP_MULTICAST_LOOP*: jint {.`static`.}
  IP_TOS*: jint {.`static`.}
  SO_LINGER*: jint {.`static`.}
  SO_TIMEOUT*: jint {.`static`.}
  SO_SNDBUF*: jint {.`static`.}
  SO_RCVBUF*: jint {.`static`.}
  SO_KEEPALIVE*: jint {.`static`.}
  SO_OOBINLINE*: jint {.`static`.}

