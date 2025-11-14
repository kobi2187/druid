import jnim

jclass android.app.KeyguardManager* of JVMObject:
  proc createConfirmDeviceCredentialIntent*(title: CharSequence, description: CharSequence): Intent
  proc createConfirmDeviceCredentialIntent*(title: CharSequence, description: CharSequence, userId: jint): Intent
  proc createConfirmDeviceCredentialIntent*(title: CharSequence, description: CharSequence, userId: jint, disallowBiometricsIfPolicyExists: jboolean): Intent
  proc createConfirmFactoryResetCredentialIntent*(title: CharSequence, description: CharSequence, alternateButtonLabel: CharSequence): Intent
  proc createConfirmDeviceCredentialForRemoteValidationIntent*(session: RemoteLockscreenValidationSession, remoteLockscreenValidationServiceComponent: ComponentName, title: CharSequence, description: CharSequence, checkboxLabel: CharSequence, alternateButtonLabel: CharSequence): Intent
  proc setPrivateNotificationsAllowed*(allow: jboolean)
  proc getPrivateNotificationsAllowed*(): jboolean
  proc newKeyguardLock*(tag: string): KeyguardLock
  proc isKeyguardLocked*(): jboolean
  proc isKeyguardSecure*(): jboolean
  proc inKeyguardRestrictedInputMode*(): jboolean
  proc isDeviceLocked*(): jboolean
  proc isDeviceLocked*(userId: jint): jboolean
  proc isDeviceLocked*(userId: jint, deviceId: jint): jboolean
  proc isDeviceSecure*(): jboolean
  proc isDeviceSecure*(userId: jint): jboolean
  proc isDeviceSecure*(userId: jint, deviceId: jint): jboolean
  proc requestDismissKeyguard*(activity: Activity, callback: KeyguardDismissCallback)
  proc requestDismissKeyguard*(activity: Activity, message: CharSequence, callback: KeyguardDismissCallback)
  proc exitKeyguardSecurely*(callback: OnKeyguardExitResult)
  proc checkInitialLockMethodUsage*(): jboolean
  proc isValidLockPasswordComplexity*(lockType: jint, password: seq[jbyte], complexity: jint): jboolean
  proc getMinLockLength*(isPin: jboolean, complexity: jint): jint
  proc setLock*(lockType: jint, password: seq[jbyte], complexity: jint): jboolean
  proc addWeakEscrowToken*(token: seq[jbyte], user: UserHandle, executor: Executor, listener: WeakEscrowTokenActivatedListener): jlong
  proc removeWeakEscrowToken*(handle: jlong, user: UserHandle): jboolean
  proc isWeakEscrowTokenActive*(handle: jlong, user: UserHandle): jboolean
  proc isWeakEscrowTokenValid*(handle: jlong, token: seq[jbyte], user: UserHandle): jboolean
  proc registerWeakEscrowTokenRemovedListener*(executor: Executor, listener: WeakEscrowTokenRemovedListener): jboolean
  proc unregisterWeakEscrowTokenRemovedListener*(listener: WeakEscrowTokenRemovedListener): jboolean
  proc setLock*(newLockType: jint, newPassword: seq[jbyte], currentLockType: jint, currentPassword: seq[jbyte]): jboolean
  proc checkLock*(lockType: jint, password: seq[jbyte]): jboolean
  proc startRemoteLockscreenValidation*(): RemoteLockscreenValidationSession
  proc validateRemoteLockscreen*(encryptedCredential: seq[jbyte]): RemoteLockscreenValidationResult
  proc addKeyguardLockedStateListener*(executor: Executor, listener: KeyguardLockedStateListener)
  proc removeKeyguardLockedStateListener*(listener: KeyguardLockedStateListener)
  proc addDeviceLockedStateListener*(executor: Executor, listener: DeviceLockedStateListener)
  proc removeDeviceLockedStateListener*(listener: DeviceLockedStateListener)
  ACTION_CONFIRM_DEVICE_CREDENTIAL*: string {.`static`.}
  ACTION_CONFIRM_DEVICE_CREDENTIAL_WITH_USER*: string {.`static`.}
  ACTION_CONFIRM_FRP_CREDENTIAL*: string {.`static`.}
  ACTION_CONFIRM_REMOTE_DEVICE_CREDENTIAL*: string {.`static`.}
  ACTION_PREPARE_REPAIR_MODE_DEVICE_CREDENTIAL*: string {.`static`.}
  ACTION_CONFIRM_REPAIR_MODE_DEVICE_CREDENTIAL*: string {.`static`.}
  EXTRA_TITLE*: string {.`static`.}
  EXTRA_DESCRIPTION*: string {.`static`.}
  EXTRA_ALTERNATE_BUTTON_LABEL*: string {.`static`.}
  EXTRA_CHECKBOX_LABEL*: string {.`static`.}
  EXTRA_REMOTE_LOCKSCREEN_VALIDATION_SESSION*: string {.`static`.}
  EXTRA_FORCE_TASK_OVERLAY*: string {.`static`.}
  RESULT_ALTERNATE*: jint {.`static`.}
  EXTRA_DISALLOW_BIOMETRICS_IF_POLICY_EXISTS*: string {.`static`.}
  LOCK_ON_USER_SWITCH_CALLBACK*: string {.`static`.}
  PASSWORD*: jint {.`static`.}
  PIN*: jint {.`static`.}
  PATTERN*: jint {.`static`.}

jclass android.app.KeyguardManager.KeyguardLock* of JVMObject:
  proc disableKeyguard*()
  proc reenableKeyguard*()

jclass android.app.KeyguardManager.KeyguardDismissCallback* of JVMObject:
  proc onDismissError*()
  proc onDismissSucceeded*()
  proc onDismissCancelled*()

jclass android.app.KeyguardLock* of JVMObject:
  proc disableKeyguard*()
  proc reenableKeyguard*()


jclass android.app.KeyguardDismissCallback* of JVMObject:
  proc onDismissError*()
  proc onDismissSucceeded*()
  proc onDismissCancelled*()



