import jnim

jclass android.content.ContextParams* of JVMObject:
  proc getAttributionTag*(): string
  proc getRenouncedPermissions*(): Set[string]
  proc isRenouncedPermission*(permission: string): jboolean
  proc getNextAttributionSource*(): AttributionSource
  proc shouldRegisterAttributionSource*(): jboolean
  EMPTY*: ContextParams {.`static`.}

jclass android.content.ContextParams.Builder* of JVMObject:
  proc setAttributionTag*(attributionTag: string): Builder
  proc setNextAttributionSource*(next: AttributionSource): Builder
  proc setShouldRegisterAttributionSource*(shouldRegister: jboolean): Builder
  proc setRenouncedPermissions*(renouncedPermissions: Set[string]): Builder
  proc build*(): ContextParams

jclass android.content.Builder* of JVMObject:
  proc setAttributionTag*(attributionTag: string): Builder
  proc setNextAttributionSource*(next: AttributionSource): Builder
  proc setShouldRegisterAttributionSource*(shouldRegister: jboolean): Builder
  proc setRenouncedPermissions*(renouncedPermissions: Set[string]): Builder
  proc build*(): ContextParams

