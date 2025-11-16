## SDK Notification Manager - Show local notifications
##
## Uses Android SDK NotificationManager API (Java)
##
## Handles:
## - Creating and showing notifications
## - Notification channels (API 26+)
## - Notification actions
## - Custom notification layouts (future)

import ../../../core
import ../../../art  # For API level detection
import jnim
import options
import tables

# jnimport:
#   import android.content.Context
#   import android.app.NotificationManager as JNM
#   import android.app.Notification
#   import android.app.NotificationChannel
#   import android.app.PendingIntent
#   import android.content.Intent
#   import androidx.core.app.NotificationCompat
#   import androidx.core.app.NotificationCompat$Builder
# 
type
  NotificationImportance* = enum
    ## Notification importance levels (API 26+)
    niNone = 0        # No notifications
    niMin = 1         # Minimal, no sound
    niLow = 2         # Low, no sound, collapsed
    niDefault = 3     # Default, makes sound
    niHigh = 4        # High, makes sound and appears on screen
    niMax = 5         # Urgent, makes sound and appears on screen

  NotificationChannel* = object
    ## Notification channel (required for API 26+)
    id*: string
    name*: string
    description*: string
    importance*: NotificationImportance

  NotificationBuilder* = ref object
    ## Builder for creating notifications
    title*: string
    message*: string
    channelId*: string
    smallIcon*: int32  # R.drawable.icon_name
    autoCancel*: bool
    priority*: NotificationImportance
    # TODO: Add actions, custom layout, etc.

  SdkNotificationManager* = ref object
    context: jobject
    notificationManager: jobject
    apiLevel: int
    createdChannels: Table[string, bool]

const
  DEFAULT_CHANNEL_ID = "druid_default"
  DEFAULT_CHANNEL_NAME = "General Notifications"

proc init*(_: typedesc[SdkNotificationManager]): SdkNotificationManager =
  ## Initialize SdkNotificationManager
  result = SdkNotificationManager()
  result.context = getContext()
  result.apiLevel = detectApiLevel()
  result.createdChannels = initTable[string, bool]()

  # Get NotificationManager system service
  let serviceName = "notification".toJString
  result.notificationManager = result.context.getSystemService(serviceName)

  # Create default channel on API 26+
  if result.apiLevel >= 26:
    result.createChannelIfNeeded(NotificationChannel(
      id: DEFAULT_CHANNEL_ID,
      name: DEFAULT_CHANNEL_NAME,
      description: "Default notification channel for Druid apps",
      importance: niDefault
    ))

proc createChannelIfNeeded(nm: SdkNotificationManager, channel: NotificationChannel) =
  ## Create notification channel if on API 26+ and not already created
  if nm.apiLevel < 26:
    return  # Channels not supported

  if channel.id in nm.createdChannels:
    return  # Already created

  # Create NotificationChannel
  let jChannel = newJVMObject("android/app/NotificationChannel",
    channel.id.toJString,
    channel.name.toJString,
    channel.importance.int.jint
  )

  if channel.description.len > 0:
    jChannel.call("setDescription", channel.description.toJString)

  # Register channel
  nm.notificationManager.call("createNotificationChannel", jChannel)
  nm.createdChannels[channel.id] = true

proc createChannel*(nm: SdkNotificationManager, channel: NotificationChannel) =
  ## Create a notification channel (API 26+ only)
  ##
  ## On API < 26, this is a no-op (channels not needed)
  ##
  ## Example:
  ##   let channel = NotificationChannel(
  ##     id: "important",
  ##     name: "Important Alerts",
  ##     description: "Critical app notifications",
  ##     importance: niHigh
  ##   )
  ##   notifications().createChannel(channel)

  nm.createChannelIfNeeded(channel)

proc notify*(nm: SdkNotificationManager, notifId: int, builder: NotificationBuilder) =
  ## Show a notification with custom settings
  ##
  ## Args:
  ##   notifId: Unique notification ID (use same ID to update existing notification)
  ##   builder: NotificationBuilder with notification settings

  # Ensure channel exists (API 26+)
  if nm.apiLevel >= 26:
    if builder.channelId.len == 0:
      # Use default channel if none specified
      nm.createChannelIfNeeded(NotificationChannel(
        id: DEFAULT_CHANNEL_ID,
        name: DEFAULT_CHANNEL_NAME,
        importance: niDefault
      ))
    else:
      # Channel should have been created already via createChannel()
      # If not, create with default settings
      if builder.channelId notin nm.createdChannels:
        nm.createChannelIfNeeded(NotificationChannel(
          id: builder.channelId,
          name: builder.channelId,
          importance: builder.priority
        ))

  # Build notification using NotificationCompat for backward compatibility
  let channelId = if builder.channelId.len > 0: builder.channelId else: DEFAULT_CHANNEL_ID
  let compatBuilder = newJVMObject("androidx/core/app/NotificationCompat$Builder",
    nm.context,
    channelId.toJString
  )

  # Set notification properties
  discard compatBuilder.call("setContentTitle", builder.title.toJString)
  discard compatBuilder.call("setContentText", builder.message.toJString)

  if builder.smallIcon != 0:
    discard compatBuilder.call("setSmallIcon", builder.smallIcon.jint)

  discard compatBuilder.call("setAutoCancel", builder.autoCancel.jboolean)

  # Set priority (for API < 26)
  if nm.apiLevel < 26:
    discard compatBuilder.call("setPriority", builder.priority.int.jint)

  # Build and show notification
  let notification = compatBuilder.call("build")
  nm.notificationManager.call("notify", notifId.jint, notification)

proc notify*(nm: SdkNotificationManager, title: string, message: string): int =
  ## Simple notification with just title and message
  ## Uses default channel and auto-incremented ID
  ##
  ## Returns:
  ##   The notification ID (can be used to cancel later)
  ##
  ## Example:
  ##   let id = notifications().notify("Hello", "World!")

  # Generate simple ID based on current time
  let notifId = (getTime().toUnix() mod 100000).int

  let builder = NotificationBuilder(
    title: title,
    message: message,
    channelId: DEFAULT_CHANNEL_ID,
    autoCancel: true,
    priority: niDefault
  )

  nm.notify(notifId, builder)
  return notifId

proc cancel*(nm: SdkNotificationManager, notifId: int) =
  ## Cancel/dismiss a notification
  ##
  ## Args:
  ##   notifId: The notification ID returned from notify()

  nm.notificationManager.call("cancel", notifId.jint)

proc cancelAll*(nm: SdkNotificationManager) =
  ## Cancel all notifications from this app

  nm.notificationManager.call("cancelAll")

# Lazy accessor for AndroidRuntime
proc sdkNotificationManager*(runtime: AndroidRuntime): SdkNotificationManager =
  ## Get or create SdkNotificationManager instance
  if runtime.sdkNotificationManager.isNone:
    runtime.sdkNotificationManager = some(SdkNotificationManager.init())
  return runtime.sdkNotificationManager.get()

# Convenience global accessor
proc notifications*(): SdkNotificationManager =
  ## Global accessor for SdkNotificationManager
  ## Requires AndroidRuntime to be initialized
  ##
  ## Example:
  ##   notifications().notify("Title", "Message")
  return runtime().sdkNotificationManager()
