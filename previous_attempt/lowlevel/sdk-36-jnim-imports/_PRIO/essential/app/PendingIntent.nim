import jnim

jclass android.app.PendingIntent* of JVMObject:
  proc setOnMarshaledListener*(listener: OnMarshaledListener) {.`static`.}
  proc isNewMutableDisallowedImplicitPendingIntent*(flags: jint, intent: Intent, isActivityResultType: jboolean): jboolean {.`static`.}
  proc getActivity*(context: Context, requestCode: jint, intent: Intent, flags: jint): PendingIntent {.`static`.}
  proc getActivity*(context: Context, requestCode: jint, intent: Intent, flags: jint, options: Bundle): PendingIntent {.`static`.}
  proc getActivityAsUser*(context: Context, requestCode: jint, intent: Intent, flags: jint, options: Bundle, user: UserHandle): PendingIntent {.`static`.}
  proc getActivities*(context: Context, requestCode: jint, intents: seq[Intent], flags: jint): PendingIntent {.`static`.}
  proc getActivities*(context: Context, requestCode: jint, intents: seq[Intent], flags: jint, options: Bundle): PendingIntent {.`static`.}
  proc getActivitiesAsUser*(context: Context, requestCode: jint, intents: seq[Intent], flags: jint, options: Bundle, user: UserHandle): PendingIntent {.`static`.}
  proc getBroadcast*(context: Context, requestCode: jint, intent: Intent, flags: jint): PendingIntent {.`static`.}
  proc getBroadcastAsUser*(context: Context, requestCode: jint, intent: Intent, flags: jint, userHandle: UserHandle): PendingIntent {.`static`.}
  proc getService*(context: Context, requestCode: jint, intent: Intent, flags: jint): PendingIntent {.`static`.}
  proc getForegroundService*(context: Context, requestCode: jint, intent: Intent, flags: jint): PendingIntent {.`static`.}
  proc getIntentSender*(): IntentSender
  proc cancel*()
  proc send*()
  proc send*(code: jint)
  proc send*(context: Context, code: jint, intent: Intent)
  proc send*(options: Bundle)
  proc send*(code: jint, onFinished: OnFinished, handler: Handler)
  proc send*(context: Context, code: jint, intent: Intent, onFinished: OnFinished, handler: Handler)
  proc send*(context: Context, code: jint, intent: Intent, onFinished: OnFinished, handler: Handler, requiredPermission: string)
  proc send*(context: Context, code: jint, intent: Intent, onFinished: OnFinished, handler: Handler, requiredPermission: string, options: Bundle)
  proc sendAndReturnResult*(context: Context, code: jint, intent: Intent, onFinished: OnFinished, handler: Handler, requiredPermission: string, options: Bundle): jint
  proc getTargetPackage*(): string
  proc getCreatorPackage*(): string
  proc getCreatorUid*(): jint
  proc registerCancelListener*(cancelListener: CancelListener)
  proc addCancelListener*(executor: Executor, cancelListener: CancelListener): jboolean
  proc unregisterCancelListener*(cancelListener: CancelListener)
  proc removeCancelListener*(cancelListener: CancelListener)
  proc getCreatorUserHandle*(): UserHandle
  proc isTargetedToPackage*(): jboolean
  proc isImmutable*(): jboolean
  proc isActivity*(): jboolean
  proc isForegroundService*(): jboolean
  proc isService*(): jboolean
  proc isBroadcast*(): jboolean
  proc getIntent*(): Intent
  proc getTag*(prefix: string): string
  proc queryIntentComponents*(flags: jint): List[ResolveInfo]
  proc intentFilterEquals*(other: PendingIntent): jboolean
  proc equals*(otherObj: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc writePendingIntentOrNullToParcel*(sender: PendingIntent, output:Parcel) {.`static`.}
  proc readPendingIntentOrNullFromParcel*(in: Parcel): PendingIntent {.`static`.}
  proc getTarget*(): IIntentSender
  proc getWhitelistToken*(): IBinder
  BLOCK_MUTABLE_IMPLICIT_PENDING_INTENT*: jlong {.`static`.}
  PENDING_INTENT_OPTIONS_CHECK*: jlong {.`static`.}
  FLAG_ONE_SHOT*: jint {.`static`.}
  FLAG_NO_CREATE*: jint {.`static`.}
  FLAG_CANCEL_CURRENT*: jint {.`static`.}
  FLAG_UPDATE_CURRENT*: jint {.`static`.}
  FLAG_IMMUTABLE*: jint {.`static`.}
  FLAG_MUTABLE*: jint {.`static`.}
  FLAG_MUTABLE_UNAUDITED*: jint {.`static`.}
  FLAG_ALLOW_UNSAFE_IMPLICIT_INTENT*: jint {.`static`.}
  CREATOR*: Creator[PendingIntent] {.`static`.}

jclass android.app.CanceledException* of AndroidException:



