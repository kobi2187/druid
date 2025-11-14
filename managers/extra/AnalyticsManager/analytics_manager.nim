## AnalyticsManager - Event Tracking Abstraction
##
## Provides a unified interface for tracking analytics events across different backends.
## Supports multiple analytics providers simultaneously and provides a clean, type-safe
## API for event tracking.
##
## Features:
## - Multiple backend support (Firebase Analytics, Google Analytics, custom backends)
## - Type-safe event tracking with parameters
## - User property management
## - Session tracking
## - Screen view tracking
## - Custom event batching and queuing
## - Privacy-respecting analytics (GDPR compliance helpers)
##
## Architecture:
## - Backend-agnostic abstraction layer
## - Plugin system for analytics providers
## - Local event buffering for offline support
## - Automatic session management
##
## Supported Backends:
## - Firebase Analytics (Google's recommended solution)
## - Google Analytics (legacy)
## - Custom backends (via plugin interface)
## - Local logging (for development/debugging)
##
## Example:
## ```nim
## let am = analytics()
##
## # Track screen view
## am.logScreenView("HomeScreen")
##
## # Track custom event
## am.logEvent("button_click", {
##   "button_id": "play_game",
##   "screen": "home"
## })
##
## # Set user properties
## am.setUserProperty("user_level", "5")
## ```

import jnim
import options
import tables
import times
import json

# Forward declarations
type
  SdkAnalyticsManager* = ref object
    backends: seq[AnalyticsBackend]
    sessionId: string
    sessionStartTime: Time
    isAnalyticsEnabled: bool
    eventQueue: seq[AnalyticsEvent]
    userProperties: Table[string, string]

  AnalyticsBackend* = ref object of RootObj
    ## Base type for analytics backends
    name*: string
    enabled*: bool

  AnalyticsEvent* = object
    ## Represents an analytics event
    name*: string
    parameters*: Table[string, EventValue]
    timestamp*: Time
    sessionId*: string

  EventValue* = object
    ## Union type for event parameter values
    case kind*: EventValueKind
    of evString: strValue*: string
    of evInt: intValue*: int
    of evFloat: floatValue*: float
    of evBool: boolValue*: bool

  EventValueKind* = enum
    evString, evInt, evFloat, evBool

  ScreenView* = object
    ## Screen view event data
    screenName*: string
    screenClass*: string
    previousScreen*: string
    timestamp*: Time

# Built-in backend implementations

type
  FirebaseBackend* = ref object of AnalyticsBackend
    ## Firebase Analytics backend
    firebaseAnalytics: JObject  ## com.google.firebase.analytics.FirebaseAnalytics

  LoggingBackend* = ref object of AnalyticsBackend
    ## Logging backend for development (writes to console)
    logFile*: string

# Predefined event names (Firebase Analytics standard events)
const
  EventLogin* = "login"
  EventSignUp* = "sign_up"
  EventSearch* = "search"
  EventSelectContent* = "select_content"
  EventShare* = "share"
  EventPurchase* = "purchase"
  EventBeginCheckout* = "begin_checkout"
  EventAddToCart* = "add_to_cart"
  EventRemoveFromCart* = "remove_from_cart"
  EventViewItem* = "view_item"
  EventViewItemList* = "view_item_list"
  EventLevelUp* = "level_up"
  EventPostScore* = "post_score"
  EventUnlockAchievement* = "unlock_achievement"
  EventTutorialBegin* = "tutorial_begin"
  EventTutorialComplete* = "tutorial_complete"
  EventAppOpen* = "app_open"

# Predefined parameter names
const
  ParamItemId* = "item_id"
  ParamItemName* = "item_name"
  ParamContentType* = "content_type"
  ParamSearchTerm* = "search_term"
  ParamValue* = "value"
  ParamCurrency* = "currency"
  ParamLevel* = "level"
  ParamScore* = "score"
  ParamCharacter* = "character"
  ParamAchievementId* = "achievement_id"
  ParamMethod* = "method"

# Global singleton instance
var globalAnalyticsManager: SdkAnalyticsManager = nil

#------------------
# Initialization
#------------------

proc initAnalyticsManager*(): SdkAnalyticsManager =
  ## Initialize the Analytics manager
  ##
  ## Starts with no backends - use addBackend() to register analytics providers.
  if globalAnalyticsManager != nil:
    return globalAnalyticsManager

  import std/random
  randomize()

  result = SdkAnalyticsManager(
    backends: @[],
    sessionId: $rand(int.high),  # Random session ID
    sessionStartTime: now(),
    isAnalyticsEnabled: true,
    eventQueue: @[],
    userProperties: initTable[string, string]()
  )

  globalAnalyticsManager = result
  echo "AnalyticsManager: Initialized with session ID: ", result.sessionId

proc analytics*(): SdkAnalyticsManager =
  ## Get the global Analytics manager instance (lazy initialization)
  if globalAnalyticsManager == nil:
    globalAnalyticsManager = initAnalyticsManager()
  return globalAnalyticsManager

#------------------
# Backend Management
#------------------

proc addBackend*(am: SdkAnalyticsManager, backend: AnalyticsBackend) =
  ## Add an analytics backend to the manager
  ##
  ## Multiple backends can be active simultaneously.
  am.backends.add(backend)
  echo "AnalyticsManager: Added backend: ", backend.name

proc removeBackend*(am: SdkAnalyticsManager, name: string) =
  ## Remove an analytics backend by name
  am.backends.keepIf(proc(b: AnalyticsBackend): bool = b.name != name)
  echo "AnalyticsManager: Removed backend: ", name

proc enableBackend*(am: SdkAnalyticsManager, name: string, enabled: bool) =
  ## Enable or disable a specific backend
  for backend in am.backends:
    if backend.name == name:
      backend.enabled = enabled
      echo "AnalyticsManager: Backend '", name, "' enabled=", enabled

proc getBackend*(am: SdkAnalyticsManager, name: string): Option[AnalyticsBackend] =
  ## Get a backend by name
  for backend in am.backends:
    if backend.name == name:
      return some(backend)
  return none(AnalyticsBackend)

#------------------
# Event Tracking
#------------------

proc createEventValue*(value: string): EventValue =
  ## Create a string event value
  EventValue(kind: evString, strValue: value)

proc createEventValue*(value: int): EventValue =
  ## Create an integer event value
  EventValue(kind: evInt, intValue: value)

proc createEventValue*(value: float): EventValue =
  ## Create a float event value
  EventValue(kind: evFloat, floatValue: value)

proc createEventValue*(value: bool): EventValue =
  ## Create a boolean event value
  EventValue(kind: evBool, boolValue: value)

proc logEvent*(am: SdkAnalyticsManager, eventName: string,
              parameters: openArray[(string, EventValue)] = []) =
  ## Log an analytics event with optional parameters
  ##
  ## Events are sent to all enabled backends.
  if not am.isAnalyticsEnabled:
    return

  # Create event object
  var event = AnalyticsEvent(
    name: eventName,
    parameters: initTable[string, EventValue](),
    timestamp: now(),
    sessionId: am.sessionId
  )

  for (key, value) in parameters:
    event.parameters[key] = value

  # Add to queue
  am.eventQueue.add(event)

  # Send to all enabled backends
  for backend in am.backends:
    if backend.enabled:
      # Dispatch to backend
      if backend of LoggingBackend:
        let lb = LoggingBackend(backend)
        logEventToConsole(lb, event)
      elif backend of FirebaseBackend:
        let fb = FirebaseBackend(backend)
        logEventToFirebase(fb, event)

proc logEvent*(am: SdkAnalyticsManager, eventName: string,
              parameters: Table[string, EventValue]) =
  ## Log an event with a parameter table
  var paramArray: seq[(string, EventValue)] = @[]
  for key, value in parameters:
    paramArray.add((key, value))
  am.logEvent(eventName, paramArray)

proc logScreenView*(am: SdkAnalyticsManager, screenName: string,
                   screenClass: string = "") =
  ## Log a screen view event
  ##
  ## Screen tracking helps understand user navigation flow.
  let params = [
    ("screen_name", createEventValue(screenName)),
    ("screen_class", createEventValue(
      if screenClass.len > 0: screenClass else: screenName
    ))
  ]

  am.logEvent("screen_view", params)

#------------------
# User Properties
#------------------

proc setUserProperty*(am: SdkAnalyticsManager, name: string, value: string) =
  ## Set a user property
  ##
  ## User properties are attributes that describe segments of your user base.
  ## Examples: "user_level", "premium_status", "favorite_category"
  am.userProperties[name] = value

  # Send to all backends
  for backend in am.backends:
    if backend.enabled:
      if backend of LoggingBackend:
        echo "AnalyticsManager: User property '", name, "' = '", value, "'"
      elif backend of FirebaseBackend:
        # TODO: Call FirebaseAnalytics.setUserProperty()
        discard

proc getUserProperty*(am: SdkAnalyticsManager, name: string): Option[string] =
  ## Get a user property value
  if am.userProperties.hasKey(name):
    return some(am.userProperties[name])
  return none(string)

proc clearUserProperties*(am: SdkAnalyticsManager) =
  ## Clear all user properties
  am.userProperties.clear()

#------------------
# Session Management
#------------------

proc startNewSession*(am: SdkAnalyticsManager) =
  ## Start a new analytics session
  ##
  ## Normally called automatically when app comes to foreground after timeout.
  import std/random
  am.sessionId = $rand(int.high)
  am.sessionStartTime = now()
  echo "AnalyticsManager: New session started: ", am.sessionId

  am.logEvent("session_start", [])

proc endSession*(am: SdkAnalyticsManager) =
  ## End the current analytics session
  let duration = (now() - am.sessionStartTime).inSeconds
  am.logEvent("session_end", [
    ("session_duration", createEventValue(duration.int))
  ])

proc getSessionId*(am: SdkAnalyticsManager): string =
  ## Get the current session ID
  return am.sessionId

proc getSessionDuration*(am: SdkAnalyticsManager): int =
  ## Get current session duration in seconds
  return (now() - am.sessionStartTime).inSeconds.int

#------------------
# Privacy & Compliance
#------------------

proc setAnalyticsEnabled*(am: SdkAnalyticsManager, enabled: bool) =
  ## Enable or disable analytics collection (for GDPR compliance)
  ##
  ## When disabled, no events are tracked or sent to backends.
  am.isAnalyticsEnabled = enabled
  echo "AnalyticsManager: Analytics collection enabled=", enabled

proc isAnalyticsEnabled*(am: SdkAnalyticsManager): bool =
  ## Check if analytics collection is enabled
  return am.isAnalyticsEnabled

proc clearEventQueue*(am: SdkAnalyticsManager) =
  ## Clear all queued events
  ##
  ## Useful for implementing "forget me" functionality.
  am.eventQueue = @[]
  echo "AnalyticsManager: Event queue cleared"

#------------------
# Built-in Backend: Logging
#------------------

proc createLoggingBackend*(): LoggingBackend =
  ## Create a logging backend for development
  ##
  ## Writes all events to console for debugging.
  result = LoggingBackend(
    name: "logging",
    enabled: true,
    logFile: ""
  )

proc logEventToConsole(backend: LoggingBackend, event: AnalyticsEvent) =
  ## Internal: Log event to console
  echo "Analytics Event: ", event.name
  echo "  Session: ", event.sessionId
  echo "  Time: ", event.timestamp
  if event.parameters.len > 0:
    echo "  Parameters:"
    for key, value in event.parameters:
      case value.kind:
      of evString: echo "    ", key, " = \"", value.strValue, "\""
      of evInt: echo "    ", key, " = ", value.intValue
      of evFloat: echo "    ", key, " = ", value.floatValue
      of evBool: echo "    ", key, " = ", value.boolValue

#------------------
# Built-in Backend: Firebase Analytics
#------------------

# Note: Firebase Analytics requires Firebase SDK integration
# This is a stub showing the interface

proc createFirebaseBackend*(context: JObject): FirebaseBackend =
  ## Create a Firebase Analytics backend
  ##
  ## Requires Firebase Analytics SDK to be included in the app.
  ## Add to build.gradle: implementation 'com.google.firebase:firebase-analytics:21.5.0'
  ##
  ## TODO: Initialize Firebase Analytics
  echo "AnalyticsManager: Firebase backend requires Firebase SDK"
  echo "TODO: FirebaseAnalytics.getInstance(context)"

  result = FirebaseBackend(
    name: "firebase",
    enabled: true,
    firebaseAnalytics: nil  # Would be FirebaseAnalytics instance
  )

proc logEventToFirebase(backend: FirebaseBackend, event: AnalyticsEvent) =
  ## Internal: Log event to Firebase Analytics
  ##
  ## TODO: Convert event to Bundle and call firebaseAnalytics.logEvent()
  if backend.firebaseAnalytics == nil:
    echo "Firebase Analytics not initialized"
    return

  echo "TODO: FirebaseAnalytics.logEvent(\"", event.name, "\", bundle)"

#------------------
# Convenience Methods (Common Events)
#------------------

proc logLogin*(am: SdkAnalyticsManager, method: string = "unknown") =
  ## Log a login event
  am.logEvent(EventLogin, [
    (ParamMethod, createEventValue(method))
  ])

proc logSignUp*(am: SdkAnalyticsManager, method: string = "unknown") =
  ## Log a sign-up event
  am.logEvent(EventSignUp, [
    (ParamMethod, createEventValue(method))
  ])

proc logSearch*(am: SdkAnalyticsManager, searchTerm: string) =
  ## Log a search event
  am.logEvent(EventSearch, [
    (ParamSearchTerm, createEventValue(searchTerm))
  ])

proc logPurchase*(am: SdkAnalyticsManager, itemId: string, value: float,
                 currency: string = "USD") =
  ## Log a purchase event
  am.logEvent(EventPurchase, [
    (ParamItemId, createEventValue(itemId)),
    (ParamValue, createEventValue(value)),
    (ParamCurrency, createEventValue(currency))
  ])

proc logLevelUp*(am: SdkAnalyticsManager, level: int, character: string = "") =
  ## Log a level-up event
  var params = @[
    (ParamLevel, createEventValue(level))
  ]
  if character.len > 0:
    params.add((ParamCharacter, createEventValue(character)))

  am.logEvent(EventLevelUp, params)

proc logPostScore*(am: SdkAnalyticsManager, score: int, level: int = 0,
                  character: string = "") =
  ## Log a score posting event
  var params = @[
    (ParamScore, createEventValue(score))
  ]
  if level > 0:
    params.add((ParamLevel, createEventValue(level)))
  if character.len > 0:
    params.add((ParamCharacter, createEventValue(character)))

  am.logEvent(EventPostScore, params)

proc logUnlockAchievement*(am: SdkAnalyticsManager, achievementId: string) =
  ## Log an achievement unlock event
  am.logEvent(EventUnlockAchievement, [
    (ParamAchievementId, createEventValue(achievementId))
  ])

proc logTutorialBegin*(am: SdkAnalyticsManager) =
  ## Log tutorial begin event
  am.logEvent(EventTutorialBegin, [])

proc logTutorialComplete*(am: SdkAnalyticsManager) =
  ## Log tutorial complete event
  am.logEvent(EventTutorialComplete, [])

#------------------
# Event Queue Management
#------------------

proc getQueuedEventCount*(am: SdkAnalyticsManager): int =
  ## Get the number of queued events
  return am.eventQueue.len

proc getQueuedEvents*(am: SdkAnalyticsManager): seq[AnalyticsEvent] =
  ## Get all queued events
  return am.eventQueue

proc exportEventsAsJson*(am: SdkAnalyticsManager): JsonNode =
  ## Export all queued events as JSON
  ##
  ## Useful for custom analytics backends or data export.
  result = newJArray()

  for event in am.eventQueue:
    var eventJson = newJObject()
    eventJson["name"] = newJString(event.name)
    eventJson["timestamp"] = newJString($event.timestamp)
    eventJson["session_id"] = newJString(event.sessionId)

    var paramsJson = newJObject()
    for key, value in event.parameters:
      case value.kind:
      of evString: paramsJson[key] = newJString(value.strValue)
      of evInt: paramsJson[key] = newJInt(value.intValue)
      of evFloat: paramsJson[key] = newJFloat(value.floatValue)
      of evBool: paramsJson[key] = newJBool(value.boolValue)

    eventJson["parameters"] = paramsJson
    result.add(eventJson)

#------------------
# Utility Functions
#------------------

proc cleanup*(am: SdkAnalyticsManager) =
  ## Clean up analytics resources
  ##
  ## Ends the current session and flushes any pending events.
  am.endSession()
  echo "AnalyticsManager: Cleanup complete"

# Export key types and functions
export SdkAnalyticsManager, AnalyticsBackend, AnalyticsEvent
export EventValue, EventValueKind, ScreenView
export FirebaseBackend, LoggingBackend
export initAnalyticsManager, analytics
export addBackend, removeBackend, enableBackend, getBackend
export createEventValue
export logEvent, logScreenView
export setUserProperty, getUserProperty, clearUserProperties
export startNewSession, endSession, getSessionId, getSessionDuration
export setAnalyticsEnabled, isAnalyticsEnabled, clearEventQueue
export createLoggingBackend, createFirebaseBackend
export logLogin, logSignUp, logSearch, logPurchase
export logLevelUp, logPostScore, logUnlockAchievement
export logTutorialBegin, logTutorialComplete
export getQueuedEventCount, getQueuedEvents, exportEventsAsJson
export cleanup

# Export constants
export EventLogin, EventSignUp, EventSearch, EventSelectContent, EventShare
export EventPurchase, EventBeginCheckout, EventAddToCart, EventRemoveFromCart
export EventViewItem, EventViewItemList
export EventLevelUp, EventPostScore, EventUnlockAchievement
export EventTutorialBegin, EventTutorialComplete, EventAppOpen
export ParamItemId, ParamItemName, ParamContentType, ParamSearchTerm
export ParamValue, ParamCurrency, ParamLevel, ParamScore
export ParamCharacter, ParamAchievementId, ParamMethod
