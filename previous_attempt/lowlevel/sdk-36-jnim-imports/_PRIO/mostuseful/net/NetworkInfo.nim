import jnim

jclass android.net.NetworkInfo* of JVMObject:
  proc getType*(): jint
  proc setType*(type: jint)
  proc getSubtype*(): jint
  proc setSubtype*(subtype: jint, subtypeName: string)
  proc getTypeName*(): string
  proc getSubtypeName*(): string
  proc isConnectedOrConnecting*(): jboolean
  proc isConnected*(): jboolean
  proc isSuspended*(): jboolean
  proc isAvailable*(): jboolean
  proc setIsAvailable*(isAvailable: jboolean)
  proc isFailover*(): jboolean
  proc setFailover*(isFailover: jboolean)
  proc isRoaming*(): jboolean
  proc setRoaming*(isRoaming: jboolean)
  proc getState*(): State
  proc getDetailedState*(): DetailedState
  proc setDetailedState*(detailedState: DetailedState, reason: string, extraInfo: string)
  proc setExtraInfo*(extraInfo: string)
  proc getReason*(): string
  proc getExtraInfo*(): string
  proc toString*(): string
  proc toShortString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[NetworkInfo] {.`static`.}

