import jnim

jclass android.media.Controller2Link* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc notifyConnected*(seq: jint, connectionResult: Bundle)
  proc notifyDisconnected*(seq: jint)
  proc notifyPlaybackActiveChanged*(seq: jint, playbackActive: jboolean)
  proc sendSessionCommand*(seq: jint, command: Session2Command, args: Bundle, resultReceiver: ResultReceiver)
  proc cancelSessionCommand*(seq: jint)
  proc onConnected*(seq: jint, connectionResult: Bundle)
  proc onDisconnected*(seq: jint)
  proc onPlaybackActiveChanged*(seq: jint, playbackActive: jboolean)
  proc onSessionCommand*(seq: jint, command: Session2Command, args: Bundle, resultReceiver: ResultReceiver)
  proc onCancelCommand*(seq: jint)
  CREATOR*: Parcelable.Creator[Controller2Link] {.`static`.}

