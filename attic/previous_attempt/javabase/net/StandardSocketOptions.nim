import jnim

jclass java.net.StandardSocketOptions* of JVMObject:
  SO_BROADCAST*: SocketOption[Boolean] {.`static`.}
  SO_KEEPALIVE*: SocketOption[Boolean] {.`static`.}
  SO_SNDBUF*: SocketOption[Integer] {.`static`.}
  SO_RCVBUF*: SocketOption[Integer] {.`static`.}
  SO_REUSEADDR*: SocketOption[Boolean] {.`static`.}
  SO_REUSEPORT*: SocketOption[Boolean] {.`static`.}
  SO_LINGER*: SocketOption[Integer] {.`static`.}
  IP_TOS*: SocketOption[Integer] {.`static`.}
  IP_MULTICAST_IF*: SocketOption[NetworkInterface] {.`static`.}
  IP_MULTICAST_TTL*: SocketOption[Integer] {.`static`.}
  IP_MULTICAST_LOOP*: SocketOption[Boolean] {.`static`.}
  TCP_NODELAY*: SocketOption[Boolean] {.`static`.}

