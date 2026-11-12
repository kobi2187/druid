import jnim

jclass android.media.MediaRoute2ProviderService* of Service:
  proc onBind*(intent: Intent): IBinder
  proc onSetRouteVolume*(requestId: jlong, routeId: string, volume: jint)
  proc onSetSessionVolume*(requestId: jlong, sessionId: string, volume: jint)
  proc getSessionInfo*(sessionId: string): RoutingSessionInfo
  proc getAllSessionInfo*(): List[RoutingSessionInfo]
  proc notifySessionCreated*(requestId: jlong, sessionInfo: RoutingSessionInfo)
  proc notifySystemRoutingSessionCreated*(requestId: jlong, sessionInfo: RoutingSessionInfo, formats: MediaStreamsFormats): MediaStreams
  proc notifySessionUpdated*(sessionInfo: RoutingSessionInfo)
  proc notifySessionReleased*(sessionId: string)
  proc notifyRequestFailed*(requestId: jlong, reason: jint)
  proc onCreateSession*(requestId: jlong, packageName: string, routeId: string, sessionHints: Bundle)
  proc onCreateSystemRoutingSession*(requestId: jlong, routeId: string, parameters: SystemRoutingSessionParams)
  proc onReleaseSession*(requestId: jlong, sessionId: string)
  proc onSelectRoute*(requestId: jlong, sessionId: string, routeId: string)
  proc onDeselectRoute*(requestId: jlong, sessionId: string, routeId: string)
  proc onTransferToRoute*(requestId: jlong, sessionId: string, routeId: string)
  proc onDiscoveryPreferenceChanged*(preference: RouteDiscoveryPreference)
  proc notifyRoutes*(routes: Collection[MediaRoute2Info])
  SERVICE_INTERFACE*: string {.`static`.}
  CATEGORY_SYSTEM_MEDIA*: string {.`static`.}
  CATEGORY_SELF_SCAN_ONLY*: string {.`static`.}
  REQUEST_ID_NONE*: jlong {.`static`.}
  REASON_UNKNOWN_ERROR*: jint {.`static`.}
  REASON_REJECTED*: jint {.`static`.}
  REASON_NETWORK_ERROR*: jint {.`static`.}
  REASON_ROUTE_NOT_AVAILABLE*: jint {.`static`.}
  REASON_INVALID_COMMAND*: jint {.`static`.}
  REASON_UNIMPLEMENTED*: jint {.`static`.}
  REASON_FAILED_TO_REROUTE_SYSTEM_MEDIA*: jint {.`static`.}

jclass android.media.MediaRoute2ProviderService.MediaStreams* of JVMObject:
  proc getAudioRecord*(): AudioRecord

jclass android.media.MediaRoute2ProviderService.SystemRoutingSessionParams* of JVMObject:
  proc getPackageName*(): string
  proc getExtras*(): Bundle

jclass android.media.MediaRoute2ProviderService.MediaStreamsFormats* of JVMObject:
  proc getAudioFormat*(): AudioFormat

jclass android.media.MediaStreams* of JVMObject:
  proc getAudioRecord*(): AudioRecord

jclass android.media.MediaStreams.Builder* of JVMObject:
  proc setAudioStream*(audioPolicy: AudioPolicy, audioRecord: AudioRecord): Builder
  proc build*(): MediaStreams

jclass android.media.Builder* of JVMObject:
  proc setAudioStream*(audioPolicy: AudioPolicy, audioRecord: AudioRecord): Builder
  proc build*(): MediaStreams

jclass android.media.SystemRoutingSessionParams* of JVMObject:
  proc getPackageName*(): string
  proc getExtras*(): Bundle

jclass android.media.SystemRoutingSessionParams.Builder* of JVMObject:
  proc setExtras*(extras: Bundle): Builder
  proc setPackageName*(packageName: string): Builder
  proc build*(): SystemRoutingSessionParams

jclass android.media.Builder* of JVMObject:
  proc setExtras*(extras: Bundle): Builder
  proc setPackageName*(packageName: string): Builder
  proc build*(): SystemRoutingSessionParams

jclass android.media.MediaStreamsFormats* of JVMObject:
  proc getAudioFormat*(): AudioFormat

jclass android.media.MediaStreamsFormats.Builder* of JVMObject:
  proc setAudioFormat*(audioFormat: AudioFormat): Builder
  proc build*(): MediaStreamsFormats

jclass android.media.Builder* of JVMObject:
  proc setAudioFormat*(audioFormat: AudioFormat): Builder
  proc build*(): MediaStreamsFormats

