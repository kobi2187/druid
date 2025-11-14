import jnim

jclass android.content.IntentSender* of JVMObject:
  proc sendIntent*(context: Context, code: jint, intent: Intent, onFinished: OnFinished, handler: Handler)
  proc sendIntent*(context: Context, code: jint, intent: Intent, onFinished: OnFinished, handler: Handler, requiredPermission: string)
  proc sendIntent*(context: Context, code: jint, intent: Intent, onFinished: OnFinished, handler: Handler, requiredPermission: string, options: Bundle)
  proc sendIntent*(context: Context, code: jint, intent: Intent, requiredPermission: string, options: Bundle, executor: Executor, onFinished: OnFinished)
  proc getTargetPackage*(): string
  proc getCreatorPackage*(): string
  proc getCreatorUid*(): jint
  proc getCreatorUserHandle*(): UserHandle
  proc equals*(otherObj: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc writeIntentSenderOrNullToParcel*(sender: IntentSender, output:Parcel) {.`static`.}
  proc readIntentSenderOrNullFromParcel*(in: Parcel): IntentSender {.`static`.}
  proc getTarget*(): IIntentSender
  proc getWhitelistToken*(): IBinder
  proc isImmutable*(): jboolean
  CREATOR*: Parcelable.Creator[IntentSender] {.`static`.}

jclass android.content.SendIntentException* of AndroidException:

