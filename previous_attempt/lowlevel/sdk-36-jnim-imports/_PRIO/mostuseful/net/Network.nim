import jnim

jclass android.net.Network* of JVMObject:
  proc getAllByName*(host: string): seq[InetAddress]
  proc getByName*(host: string): InetAddress
  proc getPrivateDnsBypassingCopy*(): Network
  proc getNetId*(): jint
  proc getNetIdForResolv*(): jint
  proc getSocketFactory*(): SocketFactory
  proc openConnection*(url: URL): URLConnection
  proc openConnection*(url: URL, proxy: java.net.Proxy): URLConnection
  proc bindSocket*(socket: DatagramSocket)
  proc bindSocket*(socket: Socket)
  proc bindSocket*(fd: FileDescriptor)
  proc fromNetworkHandle*(networkHandle: jlong): Network {.`static`.}
  proc getNetworkHandle*(): jlong
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  netId*: jint
  CREATOR*: Creator[Network] {.`static`.}

