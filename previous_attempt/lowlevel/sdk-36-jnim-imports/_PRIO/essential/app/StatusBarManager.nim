import jnim

jclass android.app.StatusBarManager* of JVMObject:
  proc disable*(what: jint)
  proc disable2*(what: jint)
  proc clickNotification*(key: string, rank: jint, count: jint, visible: jboolean)
  proc sendNotificationFeedback*(key: string, feedback: Bundle)
  proc expandNotificationsPanel*()
  proc collapsePanels*()
  proc togglePanel*()
  proc handleSystemKey*(key: KeyEvent)
  proc getLastSystemKey*(): jint
  proc expandSettingsPanel*()
  proc expandSettingsPanel*(subPanel: string)
  proc setIcon*(slot: string, iconId: jint, iconLevel: jint, contentDescription: string)
  proc removeIcon*(slot: string)
  proc setIconVisibility*(slot: string, visible: jboolean)
  proc setDisabledForSetup*(disabled: jboolean)
  proc setExpansionDisabledForSimNetworkLock*(disabled: jboolean)
  proc getDisableInfo*(): DisableInfo
  proc requestTileServiceListeningState*(componentName: ComponentName)
  proc requestAddTileService*(tileServiceComponentName: ComponentName, tileLabel: CharSequence, icon: Icon, resultExecutor: Executor, resultCallback: Consumer[Integer])
  proc cancelRequestAddTile*(packageName: string)
  proc setNavBarMode*(navBarMode: jint)
  proc getNavBarMode*(): jint
  proc updateMediaTapToTransferSenderDisplay*(displayState: jint, routeInfo: MediaRoute2Info, undoExecutor: Executor, undoCallback: Runnable)
  proc updateMediaTapToTransferReceiverDisplay*(displayState: jint, routeInfo: MediaRoute2Info, appIcon: Icon, appName: CharSequence)
  proc registerNearbyMediaDevicesProvider*(provider: NearbyMediaDevicesProvider)
  proc unregisterNearbyMediaDevicesProvider*(provider: NearbyMediaDevicesProvider)
  proc useMediaSessionActionsForApp*(packageName: string, user: UserHandle): jboolean {.`static`.}
  proc logBlankMediaTitle*(packageName: string, userId: jint)
  proc useMedia3ControllerForApp*(packageName: string, user: UserHandle): jboolean {.`static`.}
  proc canLaunchCaptureContentActivityForNote*(activity: Activity): jboolean
  proc navbarFlagsToString*(flags: jint): string {.`static`.}
  proc windowStateToString*(state: jint): string {.`static`.}
  DISABLE_EXPAND*: jint {.`static`.}
  DISABLE_NOTIFICATION_ICONS*: jint {.`static`.}
  DISABLE_NOTIFICATION_ALERTS*: jint {.`static`.}
  DISABLE_NOTIFICATION_TICKER*: jint {.`static`.}
  DISABLE_SYSTEM_INFO*: jint {.`static`.}
  DISABLE_HOME*: jint {.`static`.}
  DISABLE_RECENT*: jint {.`static`.}
  DISABLE_BACK*: jint {.`static`.}
  DISABLE_CLOCK*: jint {.`static`.}
  DISABLE_SEARCH*: jint {.`static`.}
  DISABLE_ONGOING_CALL_CHIP*: jint {.`static`.}
  DISABLE_NAVIGATION*: jint {.`static`.}
  DISABLE_NONE*: jint {.`static`.}
  DISABLE_MASK*: jint {.`static`.}
  DISABLE2_QUICK_SETTINGS*: jint {.`static`.}
  DISABLE2_SYSTEM_ICONS*: jint {.`static`.}
  DISABLE2_NOTIFICATION_SHADE*: jint {.`static`.}
  DISABLE2_GLOBAL_ACTIONS*: jint {.`static`.}
  DISABLE2_ROTATE_SUGGESTIONS*: jint {.`static`.}
  DISABLE2_NONE*: jint {.`static`.}
  DISABLE2_MASK*: jint {.`static`.}
  DEFAULT_SETUP_DISABLE_FLAGS*: jint {.`static`.}
  DEFAULT_SETUP_DISABLE2_FLAGS*: jint {.`static`.}
  NAVBAR_BACK_DISMISS_IME*: jint {.`static`.}
  NAVBAR_IME_VISIBLE*: jint {.`static`.}
  NAVBAR_IME_SWITCHER_BUTTON_VISIBLE*: jint {.`static`.}
  WINDOW_STATUS_BAR*: jint {.`static`.}
  WINDOW_NAVIGATION_BAR*: jint {.`static`.}
  WINDOW_STATE_SHOWING*: jint {.`static`.}
  WINDOW_STATE_HIDING*: jint {.`static`.}
  WINDOW_STATE_HIDDEN*: jint {.`static`.}
  CAMERA_LAUNCH_SOURCE_WIGGLE*: jint {.`static`.}
  CAMERA_LAUNCH_SOURCE_POWER_DOUBLE_TAP*: jint {.`static`.}
  CAMERA_LAUNCH_SOURCE_LIFT_TRIGGER*: jint {.`static`.}
  CAMERA_LAUNCH_SOURCE_QUICK_AFFORDANCE*: jint {.`static`.}
  ACTION_KEYGUARD_PRIVATE_NOTIFICATIONS_CHANGED*: string {.`static`.}
  EXTRA_KM_PRIVATE_NOTIFS_ALLOWED*: string {.`static`.}
  SESSION_KEYGUARD*: jint {.`static`.}
  SESSION_BIOMETRIC_PROMPT*: jint {.`static`.}
  ALL_SESSIONS*: Set[Integer] {.`static`.}
  TILE_ADD_REQUEST_RESULT_TILE_NOT_ADDED*: jint {.`static`.}
  TILE_ADD_REQUEST_RESULT_TILE_ALREADY_ADDED*: jint {.`static`.}
  TILE_ADD_REQUEST_RESULT_TILE_ADDED*: jint {.`static`.}
  TILE_ADD_REQUEST_RESULT_DIALOG_DISMISSED*: jint {.`static`.}
  TILE_ADD_REQUEST_ERROR_MISMATCHED_PACKAGE*: jint {.`static`.}
  TILE_ADD_REQUEST_ERROR_REQUEST_IN_PROGRESS*: jint {.`static`.}
  TILE_ADD_REQUEST_ERROR_BAD_COMPONENT*: jint {.`static`.}
  TILE_ADD_REQUEST_ERROR_NOT_CURRENT_USER*: jint {.`static`.}
  TILE_ADD_REQUEST_ERROR_APP_NOT_IN_FOREGROUND*: jint {.`static`.}
  TILE_ADD_REQUEST_ERROR_NO_STATUS_BAR_SERVICE*: jint {.`static`.}
  NAV_BAR_MODE_DEFAULT*: jint {.`static`.}
  NAV_BAR_MODE_KIDS*: jint {.`static`.}
  MEDIA_TRANSFER_SENDER_STATE_ALMOST_CLOSE_TO_START_CAST*: jint {.`static`.}
  MEDIA_TRANSFER_SENDER_STATE_ALMOST_CLOSE_TO_END_CAST*: jint {.`static`.}
  MEDIA_TRANSFER_SENDER_STATE_TRANSFER_TO_RECEIVER_TRIGGERED*: jint {.`static`.}
  MEDIA_TRANSFER_SENDER_STATE_TRANSFER_TO_THIS_DEVICE_TRIGGERED*: jint {.`static`.}
  MEDIA_TRANSFER_SENDER_STATE_TRANSFER_TO_RECEIVER_SUCCEEDED*: jint {.`static`.}
  MEDIA_TRANSFER_SENDER_STATE_TRANSFER_TO_THIS_DEVICE_SUCCEEDED*: jint {.`static`.}
  MEDIA_TRANSFER_SENDER_STATE_TRANSFER_TO_RECEIVER_FAILED*: jint {.`static`.}
  MEDIA_TRANSFER_SENDER_STATE_TRANSFER_TO_THIS_DEVICE_FAILED*: jint {.`static`.}
  MEDIA_TRANSFER_SENDER_STATE_FAR_FROM_RECEIVER*: jint {.`static`.}
  MEDIA_TRANSFER_RECEIVER_STATE_CLOSE_TO_SENDER*: jint {.`static`.}
  MEDIA_TRANSFER_RECEIVER_STATE_FAR_FROM_SENDER*: jint {.`static`.}
  MEDIA_TRANSFER_RECEIVER_STATE_TRANSFER_TO_RECEIVER_SUCCEEDED*: jint {.`static`.}
  MEDIA_TRANSFER_RECEIVER_STATE_TRANSFER_TO_RECEIVER_FAILED*: jint {.`static`.}

jclass android.app.StatusBarManager.DisableInfo* of JVMObject:
  proc isStatusBarExpansionDisabled*(): jboolean
  proc setStatusBarExpansionDisabled*(disabled: jboolean)
  proc isNavigateToHomeDisabled*(): jboolean
  proc setNagivationHomeDisabled*(disabled: jboolean)
  proc isNotificationPeekingDisabled*(): jboolean
  proc setNotificationPeekingDisabled*(disabled: jboolean)
  proc isRecentsDisabled*(): jboolean
  proc setRecentsDisabled*(disabled: jboolean)
  proc isSearchDisabled*(): jboolean
  proc setSearchDisabled*(disabled: jboolean)
  proc areSystemIconsDisabled*(): jboolean
  proc setSystemIconsDisabled*(disabled: jboolean)
  proc isClockDisabled*(): jboolean
  proc setClockDisabled*(disabled: jboolean)
  proc areNotificationIconsDisabled*(): jboolean
  proc setNotificationIconsDisabled*(disabled: jboolean)
  proc isRotationSuggestionDisabled*(): jboolean
  proc setQuickSettingsDisabled*(disabled: jboolean)
  proc isQuickSettingsDisabled*(): jboolean
  proc areAllComponentsEnabled*(): jboolean
  proc setEnableAll*()
  proc areAllComponentsDisabled*(): jboolean
  proc setDisableAll*()
  proc toString*(): string
  proc toFlags*(): Pair[Integer, Integer]

jclass android.app.DisableInfo* of JVMObject:
  proc isStatusBarExpansionDisabled*(): jboolean
  proc setStatusBarExpansionDisabled*(disabled: jboolean)
  proc isNavigateToHomeDisabled*(): jboolean
  proc setNagivationHomeDisabled*(disabled: jboolean)
  proc isNotificationPeekingDisabled*(): jboolean
  proc setNotificationPeekingDisabled*(disabled: jboolean)
  proc isRecentsDisabled*(): jboolean
  proc setRecentsDisabled*(disabled: jboolean)
  proc isSearchDisabled*(): jboolean
  proc setSearchDisabled*(disabled: jboolean)
  proc areSystemIconsDisabled*(): jboolean
  proc setSystemIconsDisabled*(disabled: jboolean)
  proc isClockDisabled*(): jboolean
  proc setClockDisabled*(disabled: jboolean)
  proc areNotificationIconsDisabled*(): jboolean
  proc setNotificationIconsDisabled*(disabled: jboolean)
  proc isRotationSuggestionDisabled*(): jboolean
  proc setQuickSettingsDisabled*(disabled: jboolean)
  proc isQuickSettingsDisabled*(): jboolean
  proc areAllComponentsEnabled*(): jboolean
  proc setEnableAll*()
  proc areAllComponentsDisabled*(): jboolean
  proc setDisableAll*()
  proc toString*(): string
  proc toFlags*(): Pair[Integer, Integer]

