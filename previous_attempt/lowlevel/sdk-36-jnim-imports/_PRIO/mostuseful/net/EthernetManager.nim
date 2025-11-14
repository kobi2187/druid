import jnim

jclass android.net.EthernetManager* of JVMObject:
  proc getConfiguration*(iface: string): IpConfiguration
  proc setConfiguration*(iface: string, config: IpConfiguration)
  proc isAvailable*(): jboolean
  proc isAvailable*(iface: string): jboolean
  proc addListener*(listener: Listener)
  proc addListener*(listener: Listener, executor: Executor)
  proc addInterfaceStateListener*(executor: Executor, listener: InterfaceStateListener)
  proc getAvailableInterfaces*(): seq[string]
  proc removeInterfaceStateListener*(listener: InterfaceStateListener)
  proc removeListener*(listener: Listener)
  proc setIncludeTestInterfaces*(include: jboolean)
  proc requestTetheredInterface*(executor: Executor, callback: TetheredInterfaceCallback): TetheredInterfaceRequest
  proc updateConfiguration*(iface: string, request: EthernetNetworkUpdateRequest, executor: Executor, callback: OutcomeReceiver[string, EthernetNetworkManagementException])
  proc enableInterface*(iface: string, executor: Executor, callback: OutcomeReceiver[string, EthernetNetworkManagementException])
  proc disableInterface*(iface: string, executor: Executor, callback: OutcomeReceiver[string, EthernetNetworkManagementException])
  proc setEthernetEnabled*(enabled: jboolean)
  proc addEthernetStateListener*(executor: Executor, listener: IntConsumer)
  proc removeEthernetStateListener*(listener: IntConsumer)
  proc getInterfaceList*(): List[string]
  ETHERNET_STATE_DISABLED*: jint {.`static`.}
  ETHERNET_STATE_ENABLED*: jint {.`static`.}
  STATE_ABSENT*: jint {.`static`.}
  STATE_LINK_DOWN*: jint {.`static`.}
  STATE_LINK_UP*: jint {.`static`.}
  ROLE_NONE*: jint {.`static`.}
  ROLE_CLIENT*: jint {.`static`.}
  ROLE_SERVER*: jint {.`static`.}

jclass android.net.EthernetManager.TetheredInterfaceRequest* of JVMObject:
  proc release*()


jclass android.net.Listener* of InterfaceStateListener:

jclass android.net.TetheredInterfaceRequest* of JVMObject:
  proc release*()

