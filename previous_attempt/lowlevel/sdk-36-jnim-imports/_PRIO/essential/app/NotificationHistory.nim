import jnim

jclass android.app.NotificationHistory* of JVMObject:
  proc hasNextNotification*(): jboolean
  proc getNextNotification*(): HistoricalNotification
  proc addPooledStrings*(strings: List[string])
  proc poolStringsFromNotifications*()
  proc addNotificationToWrite*(notification: HistoricalNotification)
  proc addNewNotificationToWrite*(notification: HistoricalNotification)
  proc addNotificationsToWrite*(notificationHistory: NotificationHistory)
  proc removeNotificationsFromWrite*(packageName: string)
  proc removeNotificationFromWrite*(packageName: string, postedTime: jlong): jboolean
  proc removeConversationsFromWrite*(packageName: string, conversationIds: Set[string]): jboolean
  proc removeChannelFromWrite*(packageName: string, channelId: string): jboolean
  proc getPooledStringsToWrite*(): seq[string]
  proc getNotificationsToWrite*(): List[HistoricalNotification]
  proc getHistoryCount*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[NotificationHistory] {.`static`.}

jclass android.app.NotificationHistory.HistoricalNotification* of JVMObject:
  proc getPackage*(): string
  proc getChannelName*(): string
  proc getChannelId*(): string
  proc getUid*(): jint
  proc getUserId*(): jint
  proc getPostedTimeMs*(): jlong
  proc getTitle*(): string
  proc getText*(): string
  proc getIcon*(): Icon
  proc getKey*(): string
  proc getConversationId*(): string
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint

jclass android.app.HistoricalNotification* of JVMObject:
  proc getPackage*(): string
  proc getChannelName*(): string
  proc getChannelId*(): string
  proc getUid*(): jint
  proc getUserId*(): jint
  proc getPostedTimeMs*(): jlong
  proc getTitle*(): string
  proc getText*(): string
  proc getIcon*(): Icon
  proc getKey*(): string
  proc getConversationId*(): string
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint

jclass android.app.HistoricalNotification.Builder* of JVMObject:
  proc setPackage*(aPackage: string): Builder
  proc setChannelName*(channelName: string): Builder
  proc setChannelId*(channelId: string): Builder
  proc setUid*(uid: jint): Builder
  proc setUserId*(userId: jint): Builder
  proc setPostedTimeMs*(postedTimeMs: jlong): Builder
  proc setTitle*(title: string): Builder
  proc setText*(text: string): Builder
  proc setIcon*(icon: Icon): Builder
  proc setConversationId*(conversationId: string): Builder
  proc build*(): HistoricalNotification

jclass android.app.Builder* of JVMObject:
  proc setPackage*(aPackage: string): Builder
  proc setChannelName*(channelName: string): Builder
  proc setChannelId*(channelId: string): Builder
  proc setUid*(uid: jint): Builder
  proc setUserId*(userId: jint): Builder
  proc setPostedTimeMs*(postedTimeMs: jlong): Builder
  proc setTitle*(title: string): Builder
  proc setText*(text: string): Builder
  proc setIcon*(icon: Icon): Builder
  proc setConversationId*(conversationId: string): Builder
  proc build*(): HistoricalNotification

