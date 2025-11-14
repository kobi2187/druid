import jnim

jclass android.os.Message* of JVMObject:
  proc obtain*(): Message {.`static`.}
  proc obtain*(orig: Message): Message {.`static`.}
  proc obtain*(h: Handler): Message {.`static`.}
  proc obtain*(h: Handler, callback: Runnable): Message {.`static`.}
  proc obtain*(h: Handler, what: jint): Message {.`static`.}
  proc obtain*(h: Handler, what: jint, obj: JObject): Message {.`static`.}
  proc obtain*(h: Handler, what: jint, arg1: jint, arg2: jint): Message {.`static`.}
  proc obtain*(h: Handler, what: jint, arg1: jint, arg2: jint, obj: JObject): Message {.`static`.}
  proc updateCheckRecycle*(targetSdkVersion: jint) {.`static`.}
  proc recycle*()
  proc copyFrom*(o: Message)
  proc getWhen*(): jlong
  proc setTarget*(target: Handler)
  proc getTarget*(): Handler
  proc getCallback*(): Runnable
  proc setCallback*(r: Runnable): Message
  proc getData*(): Bundle
  proc peekData*(): Bundle
  proc setData*(data: Bundle)
  proc setWhat*(what: jint): Message
  proc sendToTarget*()
  proc isAsynchronous*(): jboolean
  proc setAsynchronous*(async: jboolean)
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  mEventId*: AtomicLong
  what*: jint
  arg1*: jint
  arg2*: jint
  obj*: JObject
  replyTo*: Messenger
  UID_NONE*: jint {.`static`.}
  sendingUid*: jint
  workSourceUid*: jint
  mSendingThreadName*: string
  when*: jlong
  mInsertSeq*: jlong
  sPoolSync*: JObject {.`static`.}
  CREATOR*: Parcelable.Creator[Message] {.`static`.}

