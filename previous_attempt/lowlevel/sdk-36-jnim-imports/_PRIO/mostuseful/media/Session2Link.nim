import jnim

jclass android.media.Session2Link* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc linkToDeath*(recipient: IBinder.DeathRecipient, flags: jint)
  proc unlinkToDeath*(recipient: IBinder.DeathRecipient, flags: jint): jboolean
  proc connect*(caller: Controller2Link, seq: jint, connectionRequest: Bundle)
  proc disconnect*(caller: Controller2Link, seq: jint)
  proc sendSessionCommand*(caller: Controller2Link, seq: jint, command: Session2Command, args: Bundle, resultReceiver: ResultReceiver)
  proc cancelSessionCommand*(caller: Controller2Link, seq: jint)
  proc onConnect*(caller: Controller2Link, pid: jint, uid: jint, seq: jint, connectionRequest: Bundle)
  proc onDisconnect*(caller: Controller2Link, seq: jint)
  proc onSessionCommand*(caller: Controller2Link, seq: jint, command: Session2Command, args: Bundle, resultReceiver: ResultReceiver)
  proc onCancelCommand*(caller: Controller2Link, seq: jint)
  CREATOR*: Parcelable.Creator[Session2Link] {.`static`.}

