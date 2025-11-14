import jnim

jclass android.net.SSLCertificateSocketFactory* of SSLSocketFactory:
  proc getDefault*(handshakeTimeoutMillis: jint): SocketFactory {.`static`.}
  proc getDefault*(handshakeTimeoutMillis: jint, cache: SSLSessionCache): SSLSocketFactory {.`static`.}
  proc getInsecure*(handshakeTimeoutMillis: jint, cache: SSLSessionCache): SSLSocketFactory {.`static`.}
  proc getHttpSocketFactory*(handshakeTimeoutMillis: jint, cache: SSLSessionCache): org.apache.http.conn.ssl.SSLSocketFactory {.`static`.}
  proc verifyHostname*(socket: Socket, hostname: string) {.`static`.}
  proc setTrustManagers*(trustManager: seq[TrustManager])
  proc setNpnProtocols*(npnProtocols: seq[seq[jbyte]])
  proc setAlpnProtocols*(protocols: seq[seq[jbyte]])
  proc toLengthPrefixedList*(items: seq[jbyte]): seq[jbyte] {.`static`.}
  proc getNpnSelectedProtocol*(socket: Socket): seq[jbyte]
  proc getAlpnSelectedProtocol*(socket: Socket): seq[jbyte]
  proc setKeyManagers*(keyManagers: seq[KeyManager])
  proc setChannelIdPrivateKey*(privateKey: PrivateKey)
  proc setUseSessionTickets*(socket: Socket, useSessionTickets: jboolean)
  proc setHostname*(socket: Socket, hostName: string)
  proc setSoWriteTimeout*(socket: Socket, writeTimeoutMilliseconds: jint)
  proc createSocket*(k: Socket, host: string, port: jint, close: jboolean): Socket
  proc createSocket*(): Socket
  proc createSocket*(addr: InetAddress, port: jint, localAddr: InetAddress, localPort: jint): Socket
  proc createSocket*(addr: InetAddress, port: jint): Socket
  proc createSocket*(host: string, port: jint, localAddr: InetAddress, localPort: jint): Socket
  proc createSocket*(host: string, port: jint): Socket
  proc getDefaultCipherSuites*(): seq[string]
  proc getSupportedCipherSuites*(): seq[string]

