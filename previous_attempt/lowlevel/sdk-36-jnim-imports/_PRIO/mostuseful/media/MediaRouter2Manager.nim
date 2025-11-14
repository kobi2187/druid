import jnim

jclass android.media.MediaRouter2Manager* of JVMObject:
  proc getInstance*(context: Context): MediaRouter2Manager {.`static`.}
  proc registerCallback*(executor: Executor, callback: Callback)
  proc unregisterCallback*(callback: Callback)
  proc registerScanRequest*()
  proc unregisterScanRequest*()
  proc getMediaControllerForRoutingSession*(sessionInfo: RoutingSessionInfo): MediaController
  proc getAvailableRoutes*(packageName: string): List[MediaRoute2Info]
  proc getTransferableRoutes*(packageName: string): List[MediaRoute2Info]
  proc getAvailableRoutes*(sessionInfo: RoutingSessionInfo): List[MediaRoute2Info]
  proc getTransferableRoutes*(sessionInfo: RoutingSessionInfo): List[MediaRoute2Info]
  proc getDiscoveryPreference*(packageName: string): RouteDiscoveryPreference
  proc getRouteListingPreference*(packageName: string): RouteListingPreference
  proc getSystemRoutingSession*(targetPackageName: string): RoutingSessionInfo
  proc getRoutingSessionForMediaController*(mediaController: MediaController): RoutingSessionInfo
  proc getRoutingSessions*(packageName: string): List[RoutingSessionInfo]
  proc getRemoteSessions*(): List[RoutingSessionInfo]
  proc getAllRoutes*(): List[MediaRoute2Info]
  proc transfer*(packageName: string, route: MediaRoute2Info, userHandle: UserHandle)
  proc transfer*(sessionInfo: RoutingSessionInfo, route: MediaRoute2Info, transferInitiatorUserHandle: UserHandle, transferInitiatorPackageName: string)
  proc setRouteVolume*(route: MediaRoute2Info, volume: jint)
  proc setSessionVolume*(sessionInfo: RoutingSessionInfo, volume: jint)
  proc getSelectedRoutes*(sessionInfo: RoutingSessionInfo): List[MediaRoute2Info]
  proc getSelectableRoutes*(sessionInfo: RoutingSessionInfo): List[MediaRoute2Info]
  proc getDeselectableRoutes*(sessionInfo: RoutingSessionInfo): List[MediaRoute2Info]
  proc selectRoute*(sessionInfo: RoutingSessionInfo, route: MediaRoute2Info)
  proc deselectRoute*(sessionInfo: RoutingSessionInfo, route: MediaRoute2Info)
  proc releaseSession*(sessionInfo: RoutingSessionInfo)
  REQUEST_ID_NONE*: jint {.`static`.}
  TRANSFER_TIMEOUT_MS*: jint {.`static`.}

