import jnim

jclass android.net.InterfaceConfiguration* of JVMObject:
  proc toString*(): string
  proc getFlags*(): Iterable[string]
  proc hasFlag*(flag: string): jboolean
  proc clearFlag*(flag: string)
  proc setFlag*(flag: string)
  proc setInterfaceUp*()
  proc setInterfaceDown*()
  proc ignoreInterfaceUpDownStatus*()
  proc getLinkAddress*(): LinkAddress
  proc setLinkAddress*(addr: LinkAddress)
  proc getHardwareAddress*(): string
  proc setHardwareAddress*(hwAddr: string)
  proc isActive*(): jboolean
  proc isUp*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[InterfaceConfiguration] {.`static`.}

