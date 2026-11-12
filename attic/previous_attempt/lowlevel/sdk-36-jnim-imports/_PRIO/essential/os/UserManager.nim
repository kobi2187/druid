import jnim

jclass android.os.UserManager* of JVMObject:
  proc get*(context: Context): UserManager {.`static`.}
  proc supportsMultipleUsers*(): jboolean {.`static`.}
  proc isGuestUserAlwaysEphemeral*(): jboolean {.`static`.}
  proc isGuestUserAllowEphemeralStateChange*(): jboolean {.`static`.}
  proc isCommunalProfileEnabled*(): jboolean {.`static`.}
  proc isPrivateProfileEnabled*(): jboolean {.`static`.}
  proc isMultipleAdminEnabled*(): jboolean {.`static`.}
  proc isHeadlessSystemUserMode*(): jboolean {.`static`.}
  proc canSwitchUsers*(): jboolean
  proc getUserSwitchability*(): jint
  proc getUserSwitchability*(userHandle: UserHandle): jint
  proc getUserLogoutability*(userId: jint): jint
  proc getUserHandle*(): jint
  proc getProcessUserId*(): jint
  proc getUserType*(): string
  proc getUserName*(): string
  proc isUserNameSet*(): jboolean
  proc isUserAGoat*(): jboolean
  proc isPrimaryUser*(): jboolean
  proc isSystemUser*(): jboolean
  proc isMainUser*(): jboolean
  proc getMainUser*(): UserHandle
  proc getCommunalProfile*(): UserHandle
  proc isCommunalProfile*(): jboolean
  proc isAdminUser*(): jboolean
  proc isUserAdmin*(userId: jint): jboolean
  proc isForegroundUserAdmin*(): jboolean
  proc isUserOfType*(userType: string): jboolean
  proc isUserTypeManagedProfile*(userType: string): jboolean {.`static`.}
  proc isUserTypeGuest*(userType: string): jboolean {.`static`.}
  proc isUserTypeRestricted*(userType: string): jboolean {.`static`.}
  proc isUserTypeDemo*(userType: string): jboolean {.`static`.}
  proc isUserTypeCloneProfile*(userType: string): jboolean {.`static`.}
  proc isUserTypeCommunalProfile*(userType: string): jboolean {.`static`.}
  proc isUserTypePrivateProfile*(userType: string): jboolean {.`static`.}
  proc isUserTypeSupervisingProfile*(userType: string): jboolean {.`static`.}
  proc isLinkedUser*(): jboolean
  proc isRestrictedProfile*(): jboolean
  proc isRestrictedProfile*(user: UserHandle): jboolean
  proc canHaveRestrictedProfile*(): jboolean
  proc canAddPrivateProfile*(): jboolean
  proc hasRestrictedProfiles*(): jboolean
  proc getRestrictedProfileParent*(): UserHandle
  proc isGuestUser*(userId: jint): jboolean
  proc isGuestUser*(): jboolean
  proc isDemoUser*(): jboolean
  proc isProfile*(): jboolean
  proc isProfile*(userId: jint): jboolean
  proc isManagedProfile*(): jboolean
  proc isManagedProfile*(userId: jint): jboolean
  proc isCloneProfile*(): jboolean
  proc isPrivateProfile*(): jboolean
  proc isEphemeralUser*(): jboolean
  proc isUserEphemeral*(userId: jint): jboolean
  proc isUserRunning*(user: UserHandle): jboolean
  proc isUserRunning*(userId: jint): jboolean
  proc isUserRunningOrStopping*(user: UserHandle): jboolean
  proc isUserForeground*(): jboolean
  proc isVisibleBackgroundUsersEnabled*(): jboolean {.`static`.}
  proc isVisibleBackgroundUsersSupported*(): jboolean
  proc isVisibleBackgroundUsersOnDefaultDisplayEnabled*(): jboolean {.`static`.}
  proc isVisibleBackgroundUsersOnDefaultDisplaySupported*(): jboolean
  proc isUserVisible*(): jboolean
  proc getVisibleUsers*(): Set[UserHandle]
  proc getMainDisplayIdAssignedToUser*(): jint
  proc isUserUnlocked*(): jboolean
  proc isUserUnlocked*(user: UserHandle): jboolean
  proc isUserUnlocked*(userId: jint): jboolean
  proc invalidateIsUserUnlockedCache*() {.`static`.}
  proc isUserUnlockingOrUnlocked*(user: UserHandle): jboolean
  proc isUserUnlockingOrUnlocked*(userId: jint): jboolean
  proc getUserStartRealtime*(): jlong
  proc getUserUnlockRealtime*(): jlong
  proc getUserInfo*(userId: jint): UserInfo
  proc getUserProperties*(userHandle: UserHandle): UserProperties
  proc invalidateUserPropertiesCache*() {.`static`.}
  proc getUserRestrictionSource*(restrictionKey: string, userHandle: UserHandle): jint
  proc getUserRestrictionSources*(restrictionKey: string, userHandle: UserHandle): List[EnforcingUser]
  proc getUserRestrictions*(): Bundle
  proc getUserRestrictions*(userHandle: UserHandle): Bundle
  proc hasBaseUserRestriction*(restrictionKey: string, userHandle: UserHandle): jboolean
  proc setUserRestrictions*(restrictions: Bundle)
  proc setUserRestrictions*(restrictions: Bundle, userHandle: UserHandle)
  proc setUserRestriction*(key: string, value: jboolean)
  proc setUserRestriction*(key: string, value: jboolean, userHandle: UserHandle)
  proc hasUserRestriction*(restrictionKey: string): jboolean
  proc hasUserRestriction*(restrictionKey: string, userHandle: UserHandle): jboolean
  proc hasUserRestrictionForUser*(restrictionKey: string, userHandle: UserHandle): jboolean
  proc invalidateUserRestriction*() {.`static`.}
  proc hasUserRestrictionOnAnyUser*(restrictionKey: string): jboolean
  proc isSettingRestrictedForUser*(setting: string, userId: jint, value: string, callingUid: jint): jboolean
  proc addUserRestrictionsListener*(listener: IUserRestrictionsListener)
  proc getSerialNumberForUser*(user: UserHandle): jlong
  proc getUserForSerialNumber*(serialNumber: jlong): UserHandle
  proc createUser*(name: string, flags: jint): UserInfo
  proc createUser*(name: string, userType: string, flags: jint): UserInfo
  proc createUser*(newUserRequest: NewUserRequest): NewUserResponse
  proc preCreateUser*(userType: string): UserInfo
  proc createGuest*(context: Context): UserInfo
  proc findCurrentGuestUser*(): UserInfo
  proc getGuestUsers*(): List[UserInfo]
  proc createProfile*(name: string, userType: string, disallowedPackages: Set[string]): UserHandle
  proc createProfileForUser*(name: string, flags: jint, userId: jint): UserInfo
  proc createProfileForUser*(name: string, userType: string, flags: jint, userId: jint): UserInfo
  proc createProfileForUser*(name: string, userType: string, flags: jint, userId: jint, disallowedPackages: seq[string]): UserInfo
  proc createProfileForUserEvenWhenDisallowed*(name: string, userType: string, flags: jint, userId: jint, disallowedPackages: seq[string]): UserInfo
  proc createRestrictedProfile*(name: string): UserInfo
  proc createUserCreationIntent*(userName: string, accountName: string, accountType: string, accountOptions: PersistableBundle): Intent {.`static`.}
  proc getPreInstallableSystemPackages*(userType: string): Set[string]
  proc getSeedAccountName*(): string
  proc getSeedAccountType*(): string
  proc getSeedAccountOptions*(): PersistableBundle
  proc setSeedAccountData*(userId: jint, accountName: string, accountType: string, accountOptions: PersistableBundle)
  proc clearSeedAccountData*()
  proc markGuestForDeletion*(userId: jint): jboolean
  proc setUserEnabled*(userId: jint)
  proc setUserAdmin*(userId: jint)
  proc revokeUserAdmin*(userId: jint)
  proc evictCredentialEncryptionKey*(userId: jint)
  proc getUserCount*(): jint
  proc getUsers*(): List[UserInfo]
  proc getAliveUsers*(): List[UserInfo]
  proc getUsers*(excludeDying: jboolean): List[UserInfo]
  proc getUsers*(excludePartial: jboolean, excludeDying: jboolean, excludePreCreated: jboolean): List[UserInfo]
  proc getUserHandles*(excludeDying: jboolean): List[UserHandle]
  proc getSerialNumbersOfUsers*(excludeDying: jboolean): seq[jlong]
  proc getUserAccount*(userId: jint): string
  proc setUserAccount*(userId: jint, accountName: string)
  proc getPrimaryUser*(): UserInfo
  proc getPreviousForegroundUser*(): UserHandle
  proc canAddMoreUsers*(): jboolean
  proc canAddMoreUsers*(userType: string): jboolean
  proc getRemainingCreatableUserCount*(userType: string): jint
  proc getRemainingCreatableProfileCount*(userType: string): jint
  proc canAddMoreManagedProfiles*(userId: jint, allowedToRemoveOne: jboolean): jboolean
  proc canAddMoreProfilesToUser*(userType: string, userId: jint): jboolean
  proc isUserTypeEnabled*(userType: string): jboolean
  proc getProfiles*(userId: jint): List[UserInfo]
  proc getProfilesIncludingCommunal*(userId: jint): List[UserInfo]
  proc isSameProfileGroup*(user: UserHandle, otherUser: UserHandle): jboolean
  proc isSameProfileGroup*(userId: jint, otherUserId: jint): jboolean
  proc getEnabledProfiles*(userId: jint): List[UserInfo]
  proc getUserProfiles*(): List[UserHandle]
  proc getEnabledProfiles*(): List[UserHandle]
  proc getAllProfiles*(): List[UserHandle]
  proc getProfileIds*(userId: jint, enabledOnly: jboolean): seq[jint]
  proc getProfileIdsWithDisabled*(userId: jint): seq[jint]
  proc getEnabledProfileIds*(userId: jint): seq[jint]
  proc invalidateEnabledProfileIds*() {.`static`.}
  proc getProfileIdsExcludingHidden*(userId: jint, enabled: jboolean): seq[jint]
  proc getCredentialOwnerProfile*(userId: jint): jint
  proc getProfileParent*(userId: jint): UserInfo
  proc getProfileParent*(user: UserHandle): UserHandle
  proc requestQuietModeEnabled*(enableQuietMode: jboolean, userHandle: UserHandle): jboolean
  proc requestQuietModeEnabled*(enableQuietMode: jboolean, userHandle: UserHandle, flags: jint): jboolean
  proc requestQuietModeEnabled*(enableQuietMode: jboolean, userHandle: UserHandle, target: IntentSender): jboolean
  proc requestQuietModeEnabled*(enableQuietMode: jboolean, userHandle: UserHandle, target: IntentSender, flags: jint): jboolean
  proc invalidateQuietModeEnabledCache*() {.`static`.}
  proc isQuietModeEnabled*(userHandle: UserHandle): jboolean
  proc hasBadge*(userId: jint): jboolean
  proc hasBadge*(): jboolean
  proc getUserBadgeColor*(userId: jint): jint
  proc getUserBadgeDarkColor*(userId: jint): jint
  proc getUserIconBadgeResId*(userId: jint): jint
  proc getUserBadgeResId*(userId: jint): jint
  proc getUserBadgeNoBackgroundResId*(userId: jint): jint
  proc getUserStatusBarIconResId*(userId: jint): jint
  proc getBadgedIconForUser*(icon: Drawable, user: UserHandle): Drawable
  proc getBadgedDrawableForUser*(badgedDrawable: Drawable, user: UserHandle, badgeLocation: Rect, badgeDensity: jint): Drawable
  proc getUserBadge*(): Drawable
  proc getBadgedLabelForUser*(label: CharSequence, user: UserHandle): CharSequence
  proc getProfileLabel*(): string
  proc getProfileAccessibilityString*(userId: jint): string
  proc isMediaSharedWithParent*(): jboolean
  proc isCredentialSharableWithParent*(): jboolean
  proc removeUser*(userId: jint): jboolean
  proc removeUser*(user: UserHandle): jboolean
  proc removeUserEvenWhenDisallowed*(userId: jint): jboolean
  proc removeUserWhenPossible*(user: UserHandle, overrideDevicePolicy: jboolean): jint
  proc isRemoveResultSuccessful*(result: jint): jboolean {.`static`.}
  proc setUserName*(userId: jint, name: string)
  proc setUserEphemeral*(userId: jint, enableEphemeral: jboolean): jboolean
  proc setUserName*(name: string)
  proc setUserIcon*(userId: jint, icon: Bitmap)
  proc setUserIcon*(icon: Bitmap)
  proc getUserIcon*(userId: jint): Bitmap
  proc getUserIcon*(): Bitmap
  proc getMaxSupportedUsers*(): jint {.`static`.}
  proc isUserSwitcherEnabled*(): jboolean
  proc isUserSwitcherEnabled*(showEvenIfNotActionable: jboolean): jboolean
  proc isDeviceInDemoMode*(context: Context): jboolean {.`static`.}
  proc invalidateCacheOnUserListChange*() {.`static`.}
  proc invalidateOnUserInfoFlagChange*(flags: jint) {.`static`.}
  proc invalidateCacheOnUserDataChanged*() {.`static`.}
  proc getUserSerialNumber*(userId: jint): jint
  proc getUserHandle*(userSerialNumber: jint): jint
  proc getApplicationRestrictions*(packageName: string): Bundle
  proc getApplicationRestrictions*(packageName: string, user: UserHandle): Bundle
  proc setApplicationRestrictions*(packageName: string, restrictions: Bundle, user: UserHandle)
  proc setRestrictionsChallenge*(newPin: string): jboolean
  proc setDefaultGuestRestrictions*(restrictions: Bundle)
  proc getDefaultGuestRestrictions*(): Bundle
  proc getUserCreationTime*(userHandle: UserHandle): jlong
  proc someUserHasSeedAccount*(accountName: string, accountType: string): jboolean
  proc someUserHasAccount*(accountName: string, accountType: string): jboolean
  proc setBootUser*(bootUser: UserHandle)
  proc getBootUser*(): UserHandle
  proc invalidateStaticUserProperties*() {.`static`.}
  MAX_USER_NAME_LENGTH*: jint {.`static`.}
  MAX_ACCOUNT_STRING_LENGTH*: jint {.`static`.}
  MAX_ACCOUNT_OPTIONS_LENGTH*: jint {.`static`.}
  USER_TYPE_FULL_SYSTEM*: string {.`static`.}
  USER_TYPE_FULL_SECONDARY*: string {.`static`.}
  USER_TYPE_FULL_GUEST*: string {.`static`.}
  USER_TYPE_FULL_DEMO*: string {.`static`.}
  USER_TYPE_FULL_RESTRICTED*: string {.`static`.}
  USER_TYPE_PROFILE_MANAGED*: string {.`static`.}
  USER_TYPE_PROFILE_CLONE*: string {.`static`.}
  USER_TYPE_PROFILE_PRIVATE*: string {.`static`.}
  USER_TYPE_PROFILE_TEST*: string {.`static`.}
  USER_TYPE_PROFILE_COMMUNAL*: string {.`static`.}
  USER_TYPE_PROFILE_SUPERVISING*: string {.`static`.}
  USER_TYPE_SYSTEM_HEADLESS*: string {.`static`.}
  QUIET_MODE_DISABLE_ONLY_IF_CREDENTIAL_NOT_REQUIRED*: jint {.`static`.}
  QUIET_MODE_DISABLE_DONT_ASK_CREDENTIAL*: jint {.`static`.}
  RESTRICTION_NOT_SET*: jint {.`static`.}
  RESTRICTION_SOURCE_SYSTEM*: jint {.`static`.}
  RESTRICTION_SOURCE_DEVICE_OWNER*: jint {.`static`.}
  RESTRICTION_SOURCE_PROFILE_OWNER*: jint {.`static`.}
  DISALLOW_MODIFY_ACCOUNTS*: string {.`static`.}
  DISALLOW_CONFIG_WIFI*: string {.`static`.}
  DISALLOW_CHANGE_WIFI_STATE*: string {.`static`.}
  DISALLOW_WIFI_TETHERING*: string {.`static`.}
  DISALLOW_GRANT_ADMIN*: string {.`static`.}
  DISALLOW_SHARING_ADMIN_CONFIGURED_WIFI*: string {.`static`.}
  DISALLOW_WIFI_DIRECT*: string {.`static`.}
  DISALLOW_ADD_WIFI_CONFIG*: string {.`static`.}
  DISALLOW_CONFIG_LOCALE*: string {.`static`.}
  DISALLOW_INSTALL_APPS*: string {.`static`.}
  DISALLOW_UNINSTALL_APPS*: string {.`static`.}
  DISALLOW_SHARE_LOCATION*: string {.`static`.}
  DISALLOW_AIRPLANE_MODE*: string {.`static`.}
  DISALLOW_CONFIG_BRIGHTNESS*: string {.`static`.}
  DISALLOW_AMBIENT_DISPLAY*: string {.`static`.}
  DISALLOW_CONFIG_SCREEN_TIMEOUT*: string {.`static`.}
  DISALLOW_INSTALL_UNKNOWN_SOURCES*: string {.`static`.}
  DISALLOW_INSTALL_UNKNOWN_SOURCES_GLOBALLY*: string {.`static`.}
  DISALLOW_CONFIG_BLUETOOTH*: string {.`static`.}
  DISALLOW_BLUETOOTH*: string {.`static`.}
  DISALLOW_BLUETOOTH_SHARING*: string {.`static`.}
  DISALLOW_USB_FILE_TRANSFER*: string {.`static`.}
  DISALLOW_CONFIG_CREDENTIALS*: string {.`static`.}
  DISALLOW_REMOVE_USER*: string {.`static`.}
  DISALLOW_REMOVE_MANAGED_PROFILE*: string {.`static`.}
  DISALLOW_DEBUGGING_FEATURES*: string {.`static`.}
  DISALLOW_CONFIG_VPN*: string {.`static`.}
  DISALLOW_CONFIG_LOCATION*: string {.`static`.}
  DISALLOW_CONFIG_DATE_TIME*: string {.`static`.}
  DISALLOW_CONFIG_TETHERING*: string {.`static`.}
  DISALLOW_NETWORK_RESET*: string {.`static`.}
  DISALLOW_FACTORY_RESET*: string {.`static`.}
  DISALLOW_ADD_USER*: string {.`static`.}
  DISALLOW_ADD_MANAGED_PROFILE*: string {.`static`.}
  DISALLOW_ADD_CLONE_PROFILE*: string {.`static`.}
  DISALLOW_ADD_PRIVATE_PROFILE*: string {.`static`.}
  ENSURE_VERIFY_APPS*: string {.`static`.}
  DISALLOW_CONFIG_CELL_BROADCASTS*: string {.`static`.}
  DISALLOW_CONFIG_MOBILE_NETWORKS*: string {.`static`.}
  DISALLOW_APPS_CONTROL*: string {.`static`.}
  DISALLOW_MOUNT_PHYSICAL_MEDIA*: string {.`static`.}
  DISALLOW_UNMUTE_MICROPHONE*: string {.`static`.}
  DISALLOW_ADJUST_VOLUME*: string {.`static`.}
  DISALLOW_OUTGOING_CALLS*: string {.`static`.}
  DISALLOW_SMS*: string {.`static`.}
  DISALLOW_FUN*: string {.`static`.}
  DISALLOW_CREATE_WINDOWS*: string {.`static`.}
  DISALLOW_SYSTEM_ERROR_DIALOGS*: string {.`static`.}
  DISALLOW_CROSS_PROFILE_COPY_PASTE*: string {.`static`.}
  DISALLOW_OUTGOING_BEAM*: string {.`static`.}
  DISALLOW_WALLPAPER*: string {.`static`.}
  DISALLOW_SET_WALLPAPER*: string {.`static`.}
  DISALLOW_SAFE_BOOT*: string {.`static`.}
  DISALLOW_RECORD_AUDIO*: string {.`static`.}
  DISALLOW_RUN_IN_BACKGROUND*: string {.`static`.}
  DISALLOW_CAMERA*: string {.`static`.}
  DISALLOW_UNMUTE_DEVICE*: string {.`static`.}
  DISALLOW_DATA_ROAMING*: string {.`static`.}
  DISALLOW_SET_USER_ICON*: string {.`static`.}
  DISALLOW_OEM_UNLOCK*: string {.`static`.}
  DISALLOW_UNIFIED_PASSWORD*: string {.`static`.}
  ALLOW_PARENT_PROFILE_APP_LINKING*: string {.`static`.}
  DISALLOW_AUTOFILL*: string {.`static`.}
  DISALLOW_CONTENT_CAPTURE*: string {.`static`.}
  DISALLOW_CONTENT_SUGGESTIONS*: string {.`static`.}
  DISALLOW_USER_SWITCH*: string {.`static`.}
  DISALLOW_SHARE_INTO_MANAGED_PROFILE*: string {.`static`.}
  DISALLOW_PRINTING*: string {.`static`.}
  DISALLOW_CONFIG_PRIVATE_DNS*: string {.`static`.}
  DISALLOW_MICROPHONE_TOGGLE*: string {.`static`.}
  DISALLOW_CAMERA_TOGGLE*: string {.`static`.}
  DISALLOW_BIOMETRIC*: string {.`static`.}
  DISALLOW_CONFIG_DEFAULT_APPS*: string {.`static`.}
  KEY_RESTRICTIONS_PENDING*: string {.`static`.}
  DISALLOW_CELLULAR_2G*: string {.`static`.}
  DISALLOW_ULTRA_WIDEBAND_RADIO*: string {.`static`.}
  DISALLOW_NEAR_FIELD_COMMUNICATION_RADIO*: string {.`static`.}
  DISALLOW_CHANGE_NEAR_FIELD_COMMUNICATION_RADIO*: string {.`static`.}
  DISALLOW_THREAD_NETWORK*: string {.`static`.}
  DISALLOW_SIM_GLOBALLY*: string {.`static`.}
  DISALLOW_ASSIST_CONTENT*: string {.`static`.}
  SYSTEM_USER_MODE_EMULATION_PROPERTY*: string {.`static`.}
  SYSTEM_USER_MODE_EMULATION_DEFAULT*: string {.`static`.}
  SYSTEM_USER_MODE_EMULATION_FULL*: string {.`static`.}
  SYSTEM_USER_MODE_EMULATION_HEADLESS*: string {.`static`.}
  DEV_CREATE_OVERRIDE_PROPERTY*: string {.`static`.}
  ACTION_CREATE_SUPERVISED_USER*: string {.`static`.}
  EXTRA_USER_NAME*: string {.`static`.}
  EXTRA_USER_ACCOUNT_NAME*: string {.`static`.}
  EXTRA_USER_ACCOUNT_TYPE*: string {.`static`.}
  EXTRA_USER_ACCOUNT_OPTIONS*: string {.`static`.}
  PIN_VERIFICATION_FAILED_INCORRECT*: jint {.`static`.}
  PIN_VERIFICATION_FAILED_NOT_SET*: jint {.`static`.}
  PIN_VERIFICATION_SUCCESS*: jint {.`static`.}
  ACTION_USER_RESTRICTIONS_CHANGED*: string {.`static`.}
  USER_CREATION_FAILED_NOT_PERMITTED*: jint {.`static`.}
  USER_CREATION_FAILED_NO_MORE_USERS*: jint {.`static`.}
  SWITCHABILITY_STATUS_OK*: jint {.`static`.}
  SWITCHABILITY_STATUS_USER_IN_CALL*: jint {.`static`.}
  SWITCHABILITY_STATUS_USER_SWITCH_DISALLOWED*: jint {.`static`.}
  SWITCHABILITY_STATUS_SYSTEM_USER_LOCKED*: jint {.`static`.}
  LOGOUTABILITY_STATUS_OK*: jint {.`static`.}
  LOGOUTABILITY_STATUS_CANNOT_LOGOUT_SYSTEM_USER*: jint {.`static`.}
  LOGOUTABILITY_STATUS_NO_SUITABLE_USER_TO_LOGOUT_TO*: jint {.`static`.}
  LOGOUTABILITY_STATUS_CANNOT_SWITCH*: jint {.`static`.}
  REMOVE_RESULT_REMOVED*: jint {.`static`.}
  REMOVE_RESULT_DEFERRED*: jint {.`static`.}
  REMOVE_RESULT_ALREADY_BEING_REMOVED*: jint {.`static`.}
  REMOVE_RESULT_USER_IS_REMOVABLE*: jint {.`static`.}
  REMOVE_RESULT_ERROR_UNKNOWN*: jint {.`static`.}
  REMOVE_RESULT_ERROR_USER_RESTRICTION*: jint {.`static`.}
  REMOVE_RESULT_ERROR_USER_NOT_FOUND*: jint {.`static`.}
  REMOVE_RESULT_ERROR_SYSTEM_USER*: jint {.`static`.}
  REMOVE_RESULT_ERROR_MAIN_USER_PERMANENT_ADMIN*: jint {.`static`.}
  USER_OPERATION_SUCCESS*: jint {.`static`.}
  USER_OPERATION_ERROR_UNKNOWN*: jint {.`static`.}
  USER_OPERATION_ERROR_MANAGED_PROFILE*: jint {.`static`.}
  USER_OPERATION_ERROR_MAX_RUNNING_USERS*: jint {.`static`.}
  USER_OPERATION_ERROR_CURRENT_USER*: jint {.`static`.}
  USER_OPERATION_ERROR_LOW_STORAGE*: jint {.`static`.}
  USER_OPERATION_ERROR_MAX_USERS*: jint {.`static`.}
  USER_OPERATION_ERROR_USER_ACCOUNT_ALREADY_EXISTS*: jint {.`static`.}
  USER_OPERATION_ERROR_DISABLED_USER*: jint {.`static`.}
  USER_OPERATION_ERROR_PRIVATE_PROFILE*: jint {.`static`.}
  USER_OPERATION_ERROR_USER_RESTRICTED*: jint {.`static`.}
  ALWAYS_USE_CONTEXT_USER*: jlong {.`static`.}

jclass android.os.UserManager.UserOperationException* of JVMObject:
  proc getUserOperationResult*(): jint
  proc from*(exception: ServiceSpecificException): UserOperationException {.`static`.}

jclass android.os.UserManager.CheckedUserOperationException* of JVMObject:
  proc getUserOperationResult*(): jint
  proc toServiceSpecificException*(): ServiceSpecificException

jclass android.os.UserManager.EnforcingUser* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getUserHandle*(): UserHandle
  proc getUserRestrictionSource*(): jint

jclass android.os.UserOperationException* of RuntimeException:
  proc getUserOperationResult*(): jint
  proc from*(exception: ServiceSpecificException): UserOperationException {.`static`.}

jclass android.os.CheckedUserOperationException* of AndroidException:
  proc getUserOperationResult*(): jint
  proc toServiceSpecificException*(): ServiceSpecificException

jclass android.os.EnforcingUser* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getUserHandle*(): UserHandle
  proc getUserRestrictionSource*(): jint
  CREATOR*: Creator[EnforcingUser] {.`static`.}

