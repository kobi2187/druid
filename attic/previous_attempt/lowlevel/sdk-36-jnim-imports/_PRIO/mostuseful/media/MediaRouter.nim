import jnim

jclass android.media.MediaRouter* of JVMObject:
  proc getDefaultRoute*(): RouteInfo
  proc getFallbackRoute*(): RouteInfo
  proc getSystemCategory*(): RouteCategory
  proc getSelectedRoute*(): RouteInfo
  proc getSelectedRoute*(type: jint): RouteInfo
  proc isRouteAvailable*(types: jint, flags: jint): jboolean
  proc setRouterGroupId*(groupId: string)
  proc addCallback*(types: jint, cb: Callback)
  proc addCallback*(types: jint, cb: Callback, flags: jint)
  proc removeCallback*(cb: Callback)
  proc selectRoute*(types: jint, route: RouteInfo)
  proc selectRouteInt*(types: jint, route: RouteInfo, explicit: jboolean)
  proc addUserRoute*(info: UserRouteInfo)
  proc addRouteInt*(info: RouteInfo)
  proc removeUserRoute*(info: UserRouteInfo)
  proc clearUserRoutes*()
  proc removeRouteInt*(info: RouteInfo)
  proc getCategoryCount*(): jint
  proc getCategoryAt*(index: jint): RouteCategory
  proc getRouteCount*(): jint
  proc getRouteAt*(index: jint): RouteInfo
  proc createUserRoute*(category: RouteCategory): UserRouteInfo
  proc createRouteCategory*(name: CharSequence, isGroupable: jboolean): RouteCategory
  proc createRouteCategory*(nameResId: jint, isGroupable: jboolean): RouteCategory
  proc rebindAsUser*(userId: jint)
  ROUTE_TYPE_LIVE_AUDIO*: jint {.`static`.}
  ROUTE_TYPE_LIVE_VIDEO*: jint {.`static`.}
  ROUTE_TYPE_REMOTE_DISPLAY*: jint {.`static`.}
  ROUTE_TYPE_USER*: jint {.`static`.}
  CALLBACK_FLAG_PERFORM_ACTIVE_SCAN*: jint {.`static`.}
  CALLBACK_FLAG_UNFILTERED_EVENTS*: jint {.`static`.}
  CALLBACK_FLAG_REQUEST_DISCOVERY*: jint {.`static`.}
  CALLBACK_FLAG_PASSIVE_DISCOVERY*: jint {.`static`.}
  AVAILABILITY_FLAG_IGNORE_DEFAULT_ROUTE*: jint {.`static`.}
  MIRRORING_GROUP_ID*: string {.`static`.}

jclass android.media.MediaRouter.RouteInfo* of JVMObject:
  proc getName*(): CharSequence
  proc getName*(context: Context): CharSequence
  proc getDescription*(): CharSequence
  proc getStatus*(): CharSequence
  proc getStatusCode*(): jint
  proc getSupportedTypes*(): jint
  proc getDeviceType*(): jint
  proc matchesTypes*(types: jint): jboolean
  proc getGroup*(): RouteGroup
  proc getCategory*(): RouteCategory
  proc getIconDrawable*(): Drawable
  proc setTag*(tag: JObject)
  proc getTag*(): JObject
  proc getPlaybackType*(): jint
  proc getPlaybackStream*(): jint
  proc getVolume*(): jint
  proc requestSetVolume*(volume: jint)
  proc requestUpdateVolume*(direction: jint)
  proc getVolumeMax*(): jint
  proc getVolumeHandling*(): jint
  proc getPresentationDisplay*(): Display
  proc updatePresentationDisplay*(): jboolean
  proc getAllPresentationDisplays*(): seq[Display]
  proc getDefaultAudioVideo*(): RouteInfo
  proc getDeviceAddress*(): string
  proc isEnabled*(): jboolean
  proc isConnecting*(): jboolean
  proc isSelected*(): jboolean
  proc isDefault*(): jboolean
  proc isBluetooth*(): jboolean
  proc select*()
  proc toString*(): string

jclass android.media.MediaRouter.UserRouteInfo* of JVMObject:
  proc setName*(name: CharSequence)
  proc setName*(resId: jint)
  proc setDescription*(description: CharSequence)
  proc setStatus*(status: CharSequence)
  proc setRemoteControlClient*(rcc: RemoteControlClient)
  proc getRemoteControlClient*(): RemoteControlClient
  proc setIconDrawable*(icon: Drawable)
  proc setIconResource*(resId: jint)
  proc setVolumeCallback*(vcb: VolumeCallback)
  proc setPlaybackType*(type: jint)
  proc setVolumeHandling*(volumeHandling: jint)
  proc setVolume*(volume: jint)
  proc requestSetVolume*(volume: jint)
  proc requestUpdateVolume*(direction: jint)
  proc setVolumeMax*(volumeMax: jint)
  proc setPlaybackStream*(stream: jint)

jclass android.media.MediaRouter.RouteGroup* of JVMObject:
  proc addRoute*(route: RouteInfo)
  proc addRoute*(route: RouteInfo, insertAt: jint)
  proc removeRoute*(route: RouteInfo)
  proc removeRoute*(index: jint)
  proc getRouteCount*(): jint
  proc getRouteAt*(index: jint): RouteInfo
  proc setIconDrawable*(icon: Drawable)
  proc setIconResource*(resId: jint)
  proc requestSetVolume*(volume: jint)
  proc requestUpdateVolume*(direction: jint)
  proc toString*(): string

jclass android.media.MediaRouter.RouteCategory* of JVMObject:
  proc getName*(): CharSequence
  proc getName*(context: Context): CharSequence
  proc getRoutes*(output:List[RouteInfo]): List[RouteInfo]
  proc getSupportedTypes*(): jint
  proc isGroupable*(): jboolean
  proc isSystem*(): jboolean
  proc toString*(): string

jclass android.media.MediaRouter.Callback* of JVMObject:
  proc onRouteSelected*(router: MediaRouter, type: jint, info: RouteInfo)
  proc onRouteUnselected*(router: MediaRouter, type: jint, info: RouteInfo)
  proc onRouteAdded*(router: MediaRouter, info: RouteInfo)
  proc onRouteRemoved*(router: MediaRouter, info: RouteInfo)
  proc onRouteChanged*(router: MediaRouter, info: RouteInfo)
  proc onRouteGrouped*(router: MediaRouter, info: RouteInfo, group: RouteGroup, index: jint)
  proc onRouteUngrouped*(router: MediaRouter, info: RouteInfo, group: RouteGroup)
  proc onRouteVolumeChanged*(router: MediaRouter, info: RouteInfo)
  proc onRoutePresentationDisplayChanged*(router: MediaRouter, info: RouteInfo)

jclass android.media.MediaRouter.SimpleCallback* of JVMObject:
  proc onRouteSelected*(router: MediaRouter, type: jint, info: RouteInfo)
  proc onRouteUnselected*(router: MediaRouter, type: jint, info: RouteInfo)
  proc onRouteAdded*(router: MediaRouter, info: RouteInfo)
  proc onRouteRemoved*(router: MediaRouter, info: RouteInfo)
  proc onRouteChanged*(router: MediaRouter, info: RouteInfo)
  proc onRouteGrouped*(router: MediaRouter, info: RouteInfo, group: RouteGroup, index: jint)
  proc onRouteUngrouped*(router: MediaRouter, info: RouteInfo, group: RouteGroup)
  proc onRouteVolumeChanged*(router: MediaRouter, info: RouteInfo)

jclass android.media.MediaRouter.VolumeCallback* of JVMObject:
  proc onVolumeUpdateRequest*(info: RouteInfo, direction: jint)
  proc onVolumeSetRequest*(info: RouteInfo, volume: jint)

jclass android.media.RouteInfo* of JVMObject:
  proc getName*(): CharSequence
  proc getName*(context: Context): CharSequence
  proc getDescription*(): CharSequence
  proc getStatus*(): CharSequence
  proc getStatusCode*(): jint
  proc getSupportedTypes*(): jint
  proc getDeviceType*(): jint
  proc matchesTypes*(types: jint): jboolean
  proc getGroup*(): RouteGroup
  proc getCategory*(): RouteCategory
  proc getIconDrawable*(): Drawable
  proc setTag*(tag: JObject)
  proc getTag*(): JObject
  proc getPlaybackType*(): jint
  proc getPlaybackStream*(): jint
  proc getVolume*(): jint
  proc requestSetVolume*(volume: jint)
  proc requestUpdateVolume*(direction: jint)
  proc getVolumeMax*(): jint
  proc getVolumeHandling*(): jint
  proc getPresentationDisplay*(): Display
  proc updatePresentationDisplay*(): jboolean
  proc getAllPresentationDisplays*(): seq[Display]
  proc getDefaultAudioVideo*(): RouteInfo
  proc getDeviceAddress*(): string
  proc isEnabled*(): jboolean
  proc isConnecting*(): jboolean
  proc isSelected*(): jboolean
  proc isDefault*(): jboolean
  proc isBluetooth*(): jboolean
  proc select*()
  proc toString*(): string
  STATUS_NONE*: jint {.`static`.}
  STATUS_SCANNING*: jint {.`static`.}
  STATUS_CONNECTING*: jint {.`static`.}
  STATUS_AVAILABLE*: jint {.`static`.}
  STATUS_NOT_AVAILABLE*: jint {.`static`.}
  STATUS_IN_USE*: jint {.`static`.}
  STATUS_CONNECTED*: jint {.`static`.}
  DEVICE_TYPE_UNKNOWN*: jint {.`static`.}
  DEVICE_TYPE_TV*: jint {.`static`.}
  DEVICE_TYPE_SPEAKER*: jint {.`static`.}
  DEVICE_TYPE_BLUETOOTH*: jint {.`static`.}
  PLAYBACK_TYPE_LOCAL*: jint {.`static`.}
  PLAYBACK_TYPE_REMOTE*: jint {.`static`.}
  PLAYBACK_VOLUME_FIXED*: jint {.`static`.}
  PLAYBACK_VOLUME_VARIABLE*: jint {.`static`.}

jclass android.media.UserRouteInfo* of RouteInfo:
  proc setName*(name: CharSequence)
  proc setName*(resId: jint)
  proc setDescription*(description: CharSequence)
  proc setStatus*(status: CharSequence)
  proc setRemoteControlClient*(rcc: RemoteControlClient)
  proc getRemoteControlClient*(): RemoteControlClient
  proc setIconDrawable*(icon: Drawable)
  proc setIconResource*(resId: jint)
  proc setVolumeCallback*(vcb: VolumeCallback)
  proc setPlaybackType*(type: jint)
  proc setVolumeHandling*(volumeHandling: jint)
  proc setVolume*(volume: jint)
  proc requestSetVolume*(volume: jint)
  proc requestUpdateVolume*(direction: jint)
  proc setVolumeMax*(volumeMax: jint)
  proc setPlaybackStream*(stream: jint)

jclass android.media.RouteGroup* of RouteInfo:
  proc addRoute*(route: RouteInfo)
  proc addRoute*(route: RouteInfo, insertAt: jint)
  proc removeRoute*(route: RouteInfo)
  proc removeRoute*(index: jint)
  proc getRouteCount*(): jint
  proc getRouteAt*(index: jint): RouteInfo
  proc setIconDrawable*(icon: Drawable)
  proc setIconResource*(resId: jint)
  proc requestSetVolume*(volume: jint)
  proc requestUpdateVolume*(direction: jint)
  proc toString*(): string

jclass android.media.RouteCategory* of JVMObject:
  proc getName*(): CharSequence
  proc getName*(context: Context): CharSequence
  proc getRoutes*(output:List[RouteInfo]): List[RouteInfo]
  proc getSupportedTypes*(): jint
  proc isGroupable*(): jboolean
  proc isSystem*(): jboolean
  proc toString*(): string

jclass android.media.Callback* of JVMObject:
  proc onRouteSelected*(router: MediaRouter, type: jint, info: RouteInfo)
  proc onRouteUnselected*(router: MediaRouter, type: jint, info: RouteInfo)
  proc onRouteAdded*(router: MediaRouter, info: RouteInfo)
  proc onRouteRemoved*(router: MediaRouter, info: RouteInfo)
  proc onRouteChanged*(router: MediaRouter, info: RouteInfo)
  proc onRouteGrouped*(router: MediaRouter, info: RouteInfo, group: RouteGroup, index: jint)
  proc onRouteUngrouped*(router: MediaRouter, info: RouteInfo, group: RouteGroup)
  proc onRouteVolumeChanged*(router: MediaRouter, info: RouteInfo)
  proc onRoutePresentationDisplayChanged*(router: MediaRouter, info: RouteInfo)

jclass android.media.SimpleCallback* of Callback:
  proc onRouteSelected*(router: MediaRouter, type: jint, info: RouteInfo)
  proc onRouteUnselected*(router: MediaRouter, type: jint, info: RouteInfo)
  proc onRouteAdded*(router: MediaRouter, info: RouteInfo)
  proc onRouteRemoved*(router: MediaRouter, info: RouteInfo)
  proc onRouteChanged*(router: MediaRouter, info: RouteInfo)
  proc onRouteGrouped*(router: MediaRouter, info: RouteInfo, group: RouteGroup, index: jint)
  proc onRouteUngrouped*(router: MediaRouter, info: RouteInfo, group: RouteGroup)
  proc onRouteVolumeChanged*(router: MediaRouter, info: RouteInfo)

jclass android.media.VolumeCallback* of JVMObject:
  proc onVolumeUpdateRequest*(info: RouteInfo, direction: jint)
  proc onVolumeSetRequest*(info: RouteInfo, volume: jint)

