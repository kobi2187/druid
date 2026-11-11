import jnim

jclass android.media.RoutingSessionInfo* of JVMObject:
  proc getId*(): string
  proc getName*(): CharSequence
  proc getOriginalId*(): string
  proc getOwnerPackageName*(): string
  proc getClientPackageName*(): string
  proc getProviderId*(): string
  proc getSelectedRoutes*(): List[string]
  proc getSelectableRoutes*(): List[string]
  proc getDeselectableRoutes*(): List[string]
  proc getTransferableRoutes*(): List[string]
  proc getVolumeHandling*(): jint
  proc getVolumeMax*(): jint
  proc getVolume*(): jint
  proc getControlHints*(): Bundle
  proc isSystemSession*(): jboolean
  proc getTransferReason*(): jint
  proc getTransferInitiatorUserHandle*(): UserHandle
  proc getTransferInitiatorPackageName*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc dump*(pw: PrintWriter, prefix: string)
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CREATOR*: Creator[RoutingSessionInfo] {.`static`.}
  TRANSFER_REASON_FALLBACK*: jint {.`static`.}
  TRANSFER_REASON_SYSTEM_REQUEST*: jint {.`static`.}
  TRANSFER_REASON_APP*: jint {.`static`.}

jclass android.media.RoutingSessionInfo.Builder* of JVMObject:
  proc setName*(name: CharSequence): Builder
  proc setOwnerPackageName*(packageName: string): Builder
  proc setClientPackageName*(packageName: string): Builder
  proc setProviderId*(providerId: string): Builder
  proc clearSelectedRoutes*(): Builder
  proc addSelectedRoute*(routeId: string): Builder
  proc removeSelectedRoute*(routeId: string): Builder
  proc clearSelectableRoutes*(): Builder
  proc addSelectableRoute*(routeId: string): Builder
  proc removeSelectableRoute*(routeId: string): Builder
  proc clearDeselectableRoutes*(): Builder
  proc addDeselectableRoute*(routeId: string): Builder
  proc removeDeselectableRoute*(routeId: string): Builder
  proc clearTransferableRoutes*(): Builder
  proc addTransferableRoute*(routeId: string): Builder
  proc removeTransferableRoute*(routeId: string): Builder
  proc setVolumeHandling*(volumeHandling: jint): RoutingSessionInfo.Builder
  proc setVolumeMax*(volumeMax: jint): RoutingSessionInfo.Builder
  proc setVolume*(volume: jint): RoutingSessionInfo.Builder
  proc setControlHints*(controlHints: Bundle): Builder
  proc setSystemSession*(isSystemSession: jboolean): Builder
  proc setTransferReason*(transferReason: jint): Builder
  proc setTransferInitiator*(transferInitiatorUserHandle: UserHandle, transferInitiatorPackageName: string): Builder
  proc build*(): RoutingSessionInfo

jclass android.media.Builder* of JVMObject:
  proc setName*(name: CharSequence): Builder
  proc setOwnerPackageName*(packageName: string): Builder
  proc setClientPackageName*(packageName: string): Builder
  proc setProviderId*(providerId: string): Builder
  proc clearSelectedRoutes*(): Builder
  proc addSelectedRoute*(routeId: string): Builder
  proc removeSelectedRoute*(routeId: string): Builder
  proc clearSelectableRoutes*(): Builder
  proc addSelectableRoute*(routeId: string): Builder
  proc removeSelectableRoute*(routeId: string): Builder
  proc clearDeselectableRoutes*(): Builder
  proc addDeselectableRoute*(routeId: string): Builder
  proc removeDeselectableRoute*(routeId: string): Builder
  proc clearTransferableRoutes*(): Builder
  proc addTransferableRoute*(routeId: string): Builder
  proc removeTransferableRoute*(routeId: string): Builder
  proc setVolumeHandling*(volumeHandling: jint): RoutingSessionInfo.Builder
  proc setVolumeMax*(volumeMax: jint): RoutingSessionInfo.Builder
  proc setVolume*(volume: jint): RoutingSessionInfo.Builder
  proc setControlHints*(controlHints: Bundle): Builder
  proc setSystemSession*(isSystemSession: jboolean): Builder
  proc setTransferReason*(transferReason: jint): Builder
  proc setTransferInitiator*(transferInitiatorUserHandle: UserHandle, transferInitiatorPackageName: string): Builder
  proc build*(): RoutingSessionInfo

