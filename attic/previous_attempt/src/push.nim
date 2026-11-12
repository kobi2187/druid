# push.nim - Push notifications

import android, options

type
  NotificationPriority* = enum
    Min, Low, Default, High, Max
    
  NotificationImportance* = enum
    None, Min, Low, Default, High, Max
    
  NotificationVisibility* = enum
    Secret, Private, Public
    
  NotificationCategory* = enum
    Alarm, Call, Email, Error, Event, Message,
    Navigation, Progress, Promo, Recommendation,
    Reminder, Service, Social, Status, System, Transport
    
  NotificationAction* = object
    id*: string
    title*: string
    icon*: Option[int]
    launchesActivity*: bool
    
  NotificationData* = object
    title*: string
    content*: string
    channelId*: string
    smallIcon*: int
    largeIcon*: Option[int]
    priority*: Option[NotificationPriority]
    importance*: Option[NotificationImportance]
    category*: Option[NotificationCategory]
    visibility*: Option[NotificationVisibility]
    autoCancel*: bool
    ongoing*: bool
    timeoutAfter*: Option[int]  # milliseconds
    actions*: seq[NotificationAction]
    
  NotificationChannel* = object
    id*: string
    name*: string
    description*: Option[string]
    importance*: NotificationImportance
    enableLights*: bool
    lightColor*: Option[int]
    enableVibration*: bool
    vibrationPattern*: Option[seq[int]]
    
  PushTokenListener* = proc(token: string)
  NotificationReceivedListener* = proc(notification: NotificationData)
  NotificationClickListener* = proc(notification: NotificationData, actionId: Option[string])
    
  PushManager* = ref object of Manager
    tokenListeners: seq[PushTokenListener]
    receivedListeners: seq[NotificationReceivedListener]
    clickListeners: seq[NotificationClickListener]
    notificationManager: pointer  # JNI reference
    firebaseMessaging: pointer  # JNI reference

# Constructor
proc newPushManager*(context: Context): PushManager
  ## Creates a new push manager

# Token management
proc getToken*(m: PushManager): Option[string]
  ## Gets push notification token
  ## API 26+: Uses FirebaseMessaging.getToken
  
proc registerTokenListener*(m: PushManager, listener: PushTokenListener): bool
  ## Registers for token updates
  ## API 26+: Uses FirebaseMessaging.addOnNewTokenListener
  
proc unregisterTokenListener*(m: PushManager, listener: PushTokenListener): bool
  ## Unregisters token listener
  ## API 26+: Removes from internal list

# Notification handling
proc registerNotificationReceivedListener*(m: PushManager, listener: NotificationReceivedListener): bool
  ## Registers for notification received
  ## API 26+: Uses service to forward notifications
  
proc registerNotificationClickListener*(m: PushManager, listener: NotificationClickListener): bool
  ## Registers for notification clicks
  ## API 26+: Uses broadcast receiver to forward clicks
  
proc unregisterNotificationReceivedListener*(m: PushManager, listener: NotificationReceivedListener): bool
  ## Unregisters notification received listener
  ## API 26+: Removes from internal list
  
proc unregisterNotificationClickListener*(m: PushManager, listener: NotificationClickListener): bool
  ## Unregisters notification click listener
  ## API 26+: Removes from internal list

# Channel management
proc createNotificationChannel*(m: PushManager, channel: NotificationChannel): bool
  ## Creates notification channel
  ## API 26+: Uses NotificationManager.createNotificationChannel
  ## Pre-API 26: No-op, returns true
  
proc getNotificationChannels*(m: PushManager): seq[NotificationChannel]
  ## Gets notification channels
  ## API 26+: Uses NotificationManager.getNotificationChannels
  ## Pre-API 26: Returns empty list
  
proc deleteNotificationChannel*(m: PushManager, channelId: string): bool
  ## Deletes notification channel
  ## API 26+: Uses NotificationManager.deleteNotificationChannel
  ## Pre-API 26: No-op, returns true

# Notification display
proc showNotification*(m: PushManager, notification: NotificationData): int
  ## Shows notification
  ## Returns notification ID
  ## API 26+: Uses NotificationManager.notify
  
proc cancelNotification*(m: PushManager, notificationId: int): bool
  ## Cancels notification
  ## API 26+: Uses NotificationManager.cancel
  
proc cancelAllNotifications*(m: PushManager): bool
  ## Cancels all notifications
  ## API 26+: Uses NotificationManager.cancelAll

# Topic subscription
proc subscribeToTopic*(m: PushManager, topic: string): bool
  ## Subscribes to push topic
  ## API 26+: Uses FirebaseMessaging.subscribeToTopic
  
proc unsubscribeFromTopic*(m: PushManager, topic: string): bool
  ## Unsubscribes from push topic
  ## API 26+: Uses FirebaseMessaging.unsubscribeFromTopic