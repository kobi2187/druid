import jnim

jclass android.app.NotificationChannelGroup* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getId*(): string
  proc getName*(): CharSequence
  proc getDescription*(): string
  proc getChannels*(): List[NotificationChannel]
  proc isBlocked*(): jboolean
  proc setDescription*(description: string)
  proc setBlocked*(blocked: jboolean)
  proc addChannel*(channel: NotificationChannel)
  proc setChannels*(channels: List[NotificationChannel])
  proc lockFields*(field: jint)
  proc unlockFields*(field: jint)
  proc getUserLockedFields*(): jint
  proc populateFromXml*(parser: TypedXmlPullParser)
  proc writeXml*(output:TypedXmlSerializer)
  proc toJson*(): JSONObject
  proc describeContents*(): jint
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc clone*(): NotificationChannelGroup
  proc toString*(): string
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  MAX_TEXT_LENGTH*: jint {.`static`.}
  USER_LOCKED_BLOCKED_STATE*: jint {.`static`.}
  CREATOR*: Creator[NotificationChannelGroup] {.`static`.}

