import jnim

jclass java.net.Authenticator* of JVMObject:
  proc setDefault*(a: Authenticator) {.`static`.}
  proc getDefault*(): Authenticator {.`static`.}
  proc requestPasswordAuthentication*(addr: InetAddress, port: jint, protocol: string, prompt: string, scheme: string): PasswordAuthentication {.`static`.}
  proc requestPasswordAuthentication*(host: string, addr: InetAddress, port: jint, protocol: string, prompt: string, scheme: string): PasswordAuthentication {.`static`.}
  proc requestPasswordAuthentication*(host: string, addr: InetAddress, port: jint, protocol: string, prompt: string, scheme: string, url: URL, reqType: RequestorType): PasswordAuthentication {.`static`.}
  proc requestPasswordAuthentication*(authenticator: Authenticator, host: string, addr: InetAddress, port: jint, protocol: string, prompt: string, scheme: string, url: URL, reqType: RequestorType): PasswordAuthentication {.`static`.}
  proc requestPasswordAuthenticationInstance*(host: string, addr: InetAddress, port: jint, protocol: string, prompt: string, scheme: string, url: URL, reqType: RequestorType): PasswordAuthentication

