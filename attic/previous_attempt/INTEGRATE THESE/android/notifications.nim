## android/notifications.nim - Unified Notifications API

import std/[options, tables, times]
import core

type
  NotificationManager* = ref object
    ## High-level notification manager

  Notification* = ref object
    ## Individual notification

  NotificationChannel* = ref object
    ## Notification channel (Android 8.0+)

  NotificationPriority* = enum
    npMin = "Minimum priority"
    npLow = "Low priority"
    npDefault = "Default priority"
    npHigh = "High priority"
    npMax = "Maximum priority"

  NotificationCategory* = enum
    ncAlarm = "Alarm"
    ncCall = "Call"
    ncEmail = "Email"
    ncEvent = "Event"
    ncMessage = "Message"
    ncProgress = "Progress"
    ncPromo = "Promotion"
    ncRecommendation = "Recommendation"
    ncReminder = "Reminder"
    ncService = "Service"
    ncSocial = "Social"
    ncStatus = "Status"
    ncSystem = "System"
    ncTransport = "Transport"

  NotificationStyle* = enum
    nsDefault = "Default"
    nsBigText = "Big text"
    nsBigPicture = "Big picture"
    nsInbox = "Inbox style"
    nsProgress = "Progress bar"
    nsMediaPlayer = "Media player"

  NotificationAction* = object
    id*: string
    title*: string
    icon*: string

  NotificationConfig* = object
    title*: string
    message*: string
    icon*: string
    priority*: NotificationPriority
    category*: NotificationCategory
    style*: NotificationStyle
    autoCancel*: bool
    ongoing*: bool
    silent*: bool
    vibrate*: bool
    sound*: Option[string]
    ledColor*: Option[uint32]
    actions*: seq[NotificationAction]
    bigText*: Option[string]
    bigPicture*: Option[string]
    progress*: Option[(int32, int32)]  # (current, max)
    when*: Option[DateTime]

# Notification Manager
proc newNotificationManager*(): NotificationManager =
  ## Create notification manager
  trackFeature(afNotifications)

proc close*(manager: NotificationManager) =
  ## Close notification manager
  discard

proc isEnabled*(manager: NotificationManager): bool =
  ## Check if notifications are enabled for this app
  discard

proc requestPermission*(manager: NotificationManager) =
  ## Request notification permission (Android 13+)
  discard

# Simple Notifications
proc show*(manager: NotificationManager, title, message: string): int32 =
  ## Show simple notification, returns notification ID
  discard

proc showWithIcon*(manager: NotificationManager, title, message, icon: string): int32 =
  ## Show notification with custom icon
  discard

proc cancel*(manager: NotificationManager, id: int32) =
  ## Cancel notification by ID
  discard

proc cancelAll*(manager: NotificationManager) =
  ## Cancel all notifications
  discard

# Advanced Notifications
proc showNotification*(manager: NotificationManager, config: NotificationConfig): int32 =
  ## Show notification with full configuration
  discard

proc updateNotification*(manager: NotificationManager, id: int32, config: NotificationConfig) =
  ## Update existing notification
  discard

proc getActiveNotifications*(manager: NotificationManager): seq[int32] =
  ## Get list of active notification IDs
  discard

proc isNotificationActive*(manager: NotificationManager, id: int32): bool =
  ## Check if notification is still active
  discard

# Notification Channels (Android 8.0+)
proc createChannel*(manager: NotificationManager, 
                   id, name, description: string,
                   priority = npDefault): NotificationChannel =
  ## Create notification channel
  discard

proc deleteChannel*(manager: NotificationManager, channelId: string) =
  ## Delete notification channel
  discard

proc getChannels*(manager: NotificationManager): seq[NotificationChannel] =
  ## Get all notification channels
  discard

proc setChannelImportance*(channel: NotificationChannel, priority: NotificationPriority) =
  ## Set channel importance level
  discard

proc enableChannelVibration*(channel: NotificationChannel, enable: bool) =
  ## Enable/disable vibration for channel
  discard

proc setChannelSound*(channel: NotificationChannel, soundPath: string) =
  ## Set custom sound for channel
  discard

proc setChannelLedColor*(channel: NotificationChannel, color: uint32) =
  ## Set LED color for channel
  discard

# Notification Actions
proc onNotificationClicked*(manager: NotificationManager, 
                           callback: proc(notificationId: int32)) =
  ## Set notification click callback
  discard

proc onActionClicked*(manager: NotificationManager,
                     callback: proc(notificationId: int32, actionId: string)) =
  ## Set notification action callback
  discard

proc onNotificationDismissed*(manager: NotificationManager,
                             callback: proc(notificationId: int32)) =
  ## Set notification dismissed callback
  discard

# Progress Notifications
proc showProgress*(manager: NotificationManager, title: string, 
                  current, max: int32, indeterminate = false): int32 =
  ## Show progress notification
  discard

proc updateProgress*(manager: NotificationManager, id: int32, 
                    current, max: int32) =
  ## Update progress notification
  discard

proc setProgressIndeterminate*(manager: NotificationManager, id: int32, 
                              indeterminate: bool) =
  ## Set progress as indeterminate
  discard

proc finishProgress*(manager: NotificationManager, id: int32, 
                    finalTitle = "Complete", finalMessage = "Task finished") =
  ## Finish progress notification
  discard

# Rich Content Notifications
proc showBigText*(manager: NotificationManager, title, message, bigText: string): int32 =
  ## Show big text notification
  discard

proc showBigPicture*(manager: NotificationManager, title, message: string, 
                    picturePath: string): int32 =
  ## Show big picture notification
  discard

proc showInbox*(manager: NotificationManager, title: string, 
               messages: seq[string]): int32 =
  ## Show inbox-style notification
  discard

# Media Player Notifications
proc showMediaNotification*(manager: NotificationManager, 
                           title, artist, album: string,
                           isPlaying: bool): int32 =
  ## Show media player notification
  discard

proc updateMediaNotification*(manager: NotificationManager, id: int32,
                             title, artist, album: string,
                             isPlaying: bool) =
  ## Update media player notification
  discard

proc addMediaAction*(manager: NotificationManager, id: int32,
                    action: string, icon: string) =
  ## Add media control action
  discard

# Scheduling
proc scheduleNotification*(manager: NotificationManager, 
                          config: NotificationConfig,
                          delay: Duration): int32 =
  ## Schedule notification for later
  discard

proc scheduleRepeating*(manager: NotificationManager,
                       config: NotificationConfig,
                       interval: Duration): int32 =
  ## Schedule repeating notification
  discard

proc cancelScheduled*(manager: NotificationManager, id: int32) =
  ## Cancel scheduled notification
  discard

proc getScheduledNotifications*(manager: NotificationManager): seq[int32] =
  ## Get list of scheduled notification IDs
  discard

# Notification Settings
proc openNotificationSettings*(manager: NotificationManager) =
  ## Open system notification settings for this app
  discard

proc openChannelSettings*(manager: NotificationManager, channelId: string) =
  ## Open channel-specific settings
  discard

proc getNotificationPolicy*(manager: NotificationManager): string =
  ## Get current notification policy
  discard

proc requestDndAccess*(manager: NotificationManager) =
  ## Request Do Not Disturb access
  discard

proc canModifyDnd*(manager: NotificationManager): bool =
  ## Check if app can modify Do Not Disturb
  discard

# Notification Badges
proc setBadgeCount*(manager: NotificationManager, count: int32) =
  ## Set app badge count (launcher icon)
  discard

proc getBadgeCount*(manager: NotificationManager): int32 =
  ## Get current badge count
  discard

proc clearBadge*(manager: NotificationManager) =
  ## Clear app badge
  discard

# System Integration
proc areNotificationsEnabled*(): bool =
  ## Check if notifications are globally enabled
  trackFeature(afNotifications)

proc canShowNotifications*(): bool =
  ## Check if app can show notifications
  trackFeature(afNotifications)

proc getNotificationImportance*(): NotificationPriority =
  ## Get app's notification importance level
  trackFeature(afNotifications)

# Convenience Functions
proc notify*(title, message: string): int32 =
  ## Quick show notification
  trackFeature(afNotifications)

proc notifyWithIcon*(title, message, icon: string): int32 =
  ## Quick show notification with icon
  trackFeature(afNotifications)

proc notifyImportant*(title, message: string): int32 =
  ## Quick show high-priority notification
  trackFeature(afNotifications)

proc notifyProgress*(title: string, current, max: int32): int32 =
  ## Quick show progress notification
  trackFeature(afNotifications)

proc notifyWithAction*(title, message: string, 
                      actionTitle, actionId: string): int32 =
  ## Quick show notification with single action
  trackFeature(afNotifications)

proc cancelNotification*(id: int32) =
  ## Quick cancel notification
  trackFeature(afNotifications)

proc clearAllNotifications*() =
  ## Quick clear all notifications
  trackFeature(afNotifications)

# Notification Builder Pattern
proc newNotification*(): NotificationConfig =
  ## Create new notification config
  result = NotificationConfig(
    priority: npDefault,
    category: ncStatus,
    style: nsDefault,
    autoCancel: true,
    ongoing: false,
    silent: false,
    vibrate: true
  )

proc title*(config: var NotificationConfig, title: string): var NotificationConfig =
  ## Set notification title (builder pattern)
  config.title = title
  return config

proc message*(config: var NotificationConfig, message: string): var NotificationConfig =
  ## Set notification message
  config.message = message
  return config

proc icon*(config: var NotificationConfig, icon: string): var NotificationConfig =
  ## Set notification icon
  config.icon = icon
  return config

proc priority*(config: var NotificationConfig, priority: NotificationPriority): var NotificationConfig =
  ## Set notification priority
  config.priority = priority
  return config

proc vibrate*(config: var NotificationConfig, enable: bool): var NotificationConfig =
  ## Enable/disable vibration
  config.vibrate = enable
  return config

proc sound*(config: var NotificationConfig, soundPath: string): var NotificationConfig =
  ## Set notification sound
  config.sound = some(soundPath)
  return config

proc addAction*(config: var NotificationConfig, id, title, icon: string): var NotificationConfig =
  ## Add notification action
  config.actions.add(NotificationAction(id: id, title: title, icon: icon))
  return config

proc build*(config: NotificationConfig): int32 =
  ## Build and show notification
  trackFeature(afNotifications)