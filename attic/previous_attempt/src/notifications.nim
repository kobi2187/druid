# notifications.nim - Notification handling

import android, options, sequtils

type
  NotificationPriority* = enum
    Min = -2,
    Low = -1,
    Default = 0,
    High = 1,
    Max = 2
    
  NotificationVisibility* = enum
    Secret,    # No content on lockscreen
    Private,   # Show content on lockscreen if unlocked
    Public     # Always show content
    
  NotificationCategory* = enum
    Alarm, Call, Email, Error, Event, Message,
    Navigation, Progress, Promo, Recommendation,
    Reminder, Service, Social, Status, System, Transport
    
  NotificationImportance* = enum
    None,      # No sound, no visual
    Min,       # No sound, minimized
    Low,       # No sound, normal size
    Default,   # Sound if enabled
    High       # Sound and peek
    
  NotificationChannel* = object
    id*: string
    name*: string
    description*: string
    importance*: NotificationImportance
    enableLights*: bool
    lightColor*: Option[int]
    enableVibration*: bool
    vibrationPattern*: Option[seq[int64]]
    lockscreenVisibility*: NotificationVisibility
    bypassDnd*: bool
    showBadge*: bool
    group*: Option[string]
    
  NotificationChannelGroup* = object
    id*: string
    name*: string
    description*: Option[string]
    
  NotificationActionType* = enum
    Default, Reply, Dismiss
    
  NotificationAction* = object
    id*: string
    title*: string
    actionType*: NotificationActionType
    # Intent handled by implementation
    
  NotificationStyle* = enum
    Bigtext,   # Large text block
    Inbox,     # Message-style list
    Media,     # Media controls
    Messaging, # Conversation
    BigPicture # Large image
    
  NotificationInfo* = object
    channelId*: string
    contentTitle*: string
    contentText*: string
    smallIconResId*: int
    largeIconResId*: Option[int]
    autoCancel*: bool
    ongoing*: bool
    timestamp*: Option[Time]
    category*: Option[NotificationCategory]
    visibility*: NotificationVisibility
    priority*: NotificationPriority  # For pre-Oreo
    style*: Option[NotificationStyle]
    styleData*: Option[Table[string, string]]  # Style-specific params
    actions*: seq[NotificationAction]
    
  NotificationListener* = proc(notificationId: int, actionId: Option[string])
    
  NotificationManager* = ref object of Manager
    channels: Table[string, NotificationChannel]
    channelGroups: Table[string, NotificationChannelGroup]
    listeners: Table[int, NotificationListener]
    systemService: pointer  # JNI reference

# Constructor
proc newNotificationManager*(context: Context): NotificationManager
  ## Creates a new notification manager
  ## API 26+ automatically configures notification channels

# Channel management
proc createChannelGroup*(m: NotificationManager, 
                        group: NotificationChannelGroup): bool
  ## Creates a notification channel group
  ## No-op for pre-API 26, always returns true
  
proc createChannel*(m: NotificationManager, 
                   channel: NotificationChannel): bool
  ## Creates a notification channel
  ## No-op for pre-API 26, always returns true
  
proc deleteChannel*(m: NotificationManager, channelId: string)
  ## Deletes a notification channel
  ## No-op for pre-API 26
  
proc getChannels*(m: NotificationManager): seq[NotificationChannel]
  ## Gets all notification channels
  ## Empty for pre-API 26

# Notification display
proc notify*(m: NotificationManager,
            notificationId: int,
            info: NotificationInfo,
            listener: Option[NotificationListener] = none(NotificationListener)): bool
  ## Displays a notification
  ## API 26+: Requires valid channel ID
  ## API 31+: Notifications with custom actions likely require SCHEDULE_EXACT_ALARM
            
proc cancel*(m: NotificationManager, notificationId: int)
  ## Cancels a notification
  
proc cancelAll*(m: NotificationManager)
  ## Cancels all notifications

# Specialized notification types
proc showProgressNotification*(m: NotificationManager,
                             notificationId: int,
                             channelId: string,
                             title: string,
                             progress: int,
                             max: int,
                             indeterminate: bool = false): bool
  ## Shows progress notification
  ## Consistent API across Android versions

proc updateProgressNotification*(m: NotificationManager,
                               notificationId: int,
                               progress: int,
                               max: int,
                               indeterminate: bool = false): bool
  ## Updates existing progress notification