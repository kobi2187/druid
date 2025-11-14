## EventBusManager - Internal Event Distribution
##
## Provides simple pub/sub event bus for inter-manager communication.
## This is for internal Druid use, not user-facing events.
##
## Purpose:
##   - Decouple managers (avoid circular dependencies)
##   - Coordinate actions across managers
##   - React to system events (low memory, lifecycle changes)
##
## Example Use Cases:
##   - MemoryManager broadcasts "low memory" → caches clear themselves
##   - LifecycleManager broadcasts "paused" → managers cleanup
##   - NetworkManager broadcasts "connected" → pending syncs trigger
##
## Usage:
##   # Define event type
##   type LowMemoryEvent = object
##     availableBytes: int64
##
##   # Subscribe to events
##   eventBus().subscribe(proc(event: LowMemoryEvent) =
##     echo "Low memory: ", event.availableBytes, " bytes available"
##     clearCaches()
##   )
##
##   # Publish events
##   eventBus().publish(LowMemoryEvent(availableBytes: 1024*1024))
##
## Design:
##   - Type-safe: Each event type is a distinct type
##   - Simple: Just subscribe() and publish()
##   - Synchronous: Subscribers called immediately (no threading complexity)
##   - No magic: Explicit event types and handlers

import tables
import typetraits
import hashes
import options
import ../../../core

type
  EventHandler* = ref object of RootObj
    ## Base type for event handlers
    ## Each handler knows its event type
    handlerId: int
    eventTypeName: string

  TypedEventHandler*[T] = ref object of EventHandler
    ## Typed event handler wrapper
    callback: proc(event: T)

  SdkEventBusManager* = ref object
    ## Simple pub/sub event bus for inter-manager communication
    handlers: Table[string, seq[EventHandler]]
    nextHandlerId: int

#
# Initialization
#

proc newSdkEventBusManager*(): SdkEventBusManager =
  result = SdkEventBusManager(
    handlers: initTable[string, seq[EventHandler]](),
    nextHandlerId: 1
  )

#
# Core API
#

proc subscribe*[T](eb: SdkEventBusManager, callback: proc(event: T)): int =
  ## Subscribe to events of type T
  ##
  ## Returns handler ID for unsubscribing
  ##
  ## Usage:
  ##   type NetworkConnected = object
  ##     networkType: string
  ##
  ##   let handlerId = eventBus().subscribe(proc(event: NetworkConnected) =
  ##     echo "Connected to: ", event.networkType
  ##   )
  ##
  ## Type Safety:
  ##   Each event type gets its own subscription list.
  ##   You can't accidentally handle the wrong event type.

  let eventTypeName = name(T)
  let handlerId = eb.nextHandlerId
  eb.nextHandlerId += 1

  let handler = TypedEventHandler[T](
    handlerId: handlerId,
    eventTypeName: eventTypeName,
    callback: callback
  )

  if not eb.handlers.hasKey(eventTypeName):
    eb.handlers[eventTypeName] = @[]

  eb.handlers[eventTypeName].add(handler)
  return handlerId

proc publish*[T](eb: SdkEventBusManager, event: T) =
  ## Publish an event to all subscribers
  ##
  ## Subscribers are called synchronously in registration order.
  ##
  ## Usage:
  ##   type LowMemoryEvent = object
  ##     freeBytes: int64
  ##
  ##   eventBus().publish(LowMemoryEvent(freeBytes: 1024*1024))
  ##
  ## Error Handling:
  ##   If a subscriber throws, we catch it, log it, and continue to next subscriber.

  let eventTypeName = name(T)

  if not eb.handlers.hasKey(eventTypeName):
    # No subscribers for this event type
    return

  for handler in eb.handlers[eventTypeName]:
    # Cast back to typed handler
    let typedHandler = TypedEventHandler[T](handler)
    try:
      typedHandler.callback(event)
    except:
      echo "Error in event handler for ", eventTypeName, ": ", getCurrentExceptionMsg()

proc unsubscribe*(eb: SdkEventBusManager, handlerId: int): bool =
  ## Unsubscribe a handler by ID
  ##
  ## Returns true if handler was found and removed
  ##
  ## Usage:
  ##   let handlerId = eventBus().subscribe(proc(event: MyEvent) = ...)
  ##   # Later:
  ##   eventBus().unsubscribe(handlerId)

  for eventType, handlers in eb.handlers.mpairs:
    for i in countdown(handlers.len - 1, 0):
      if handlers[i].handlerId == handlerId:
        handlers.delete(i)
        return true
  return false

proc unsubscribeAll*[T](eb: SdkEventBusManager) =
  ## Unsubscribe all handlers for event type T
  ##
  ## Usage:
  ##   eventBus().unsubscribeAll[NetworkConnected]()

  let eventTypeName = name(T)
  if eb.handlers.hasKey(eventTypeName):
    eb.handlers[eventTypeName] = @[]

proc clear*(eb: SdkEventBusManager) =
  ## Remove all event subscriptions
  ## Useful for cleanup or testing
  eb.handlers.clear()

#
# Query API
#

proc hasSubscribers*[T](eb: SdkEventBusManager): bool =
  ## Check if any subscribers exist for event type T
  let eventTypeName = name(T)
  return eb.handlers.hasKey(eventTypeName) and eb.handlers[eventTypeName].len > 0

proc getSubscriberCount*[T](eb: SdkEventBusManager): int =
  ## Get number of subscribers for event type T
  let eventTypeName = name(T)
  if eb.handlers.hasKey(eventTypeName):
    return eb.handlers[eventTypeName].len
  return 0

proc getTotalSubscribers*(eb: SdkEventBusManager): int =
  ## Get total number of subscribers across all event types
  result = 0
  for handlers in eb.handlers.values:
    result += handlers.len

proc getEventTypes*(eb: SdkEventBusManager): seq[string] =
  ## Get list of all event types that have subscribers
  result = @[]
  for eventType in eb.handlers.keys:
    result.add(eventType)

#
# Common Event Types for Druid Internal Use
#

type
  # Lifecycle events
  LifecycleCreateEvent* = object
  LifecycleResumeEvent* = object
  LifecyclePauseEvent* = object
  LifecycleDestroyEvent* = object

  # Memory events
  LowMemoryEvent* = object
    availableBytes*: int64
    totalBytes*: int64

  # Network events
  NetworkConnectedEvent* = object
    networkType*: string  # "wifi", "cellular", "ethernet"
  NetworkDisconnectedEvent* = object

  # Power events
  BatteryLowEvent* = object
    batteryPercent*: int
  ChargingStateChangedEvent* = object
    isCharging*: bool

  # Configuration events
  ConfigurationChangedEvent* = object
    # Screen rotation, language change, etc.

#
# Helper: Subscribe Once
#

proc subscribeOnce*[T](eb: SdkEventBusManager, callback: proc(event: T)): int =
  ## Subscribe to event, but automatically unsubscribe after first call
  ##
  ## Usage:
  ##   eventBus().subscribeOnce(proc(event: NetworkConnected) =
  ##     echo "First connection!"
  ##   )

  var handlerId: int
  handlerId = eb.subscribe(proc(event: T) =
    callback(event)
    discard eb.unsubscribe(handlerId)
  )
  return handlerId

#
# Helper: Filtered Subscription
#

proc subscribeFiltered*[T](eb: SdkEventBusManager,
                          filter: proc(event: T): bool,
                          callback: proc(event: T)): int =
  ## Subscribe with a filter predicate
  ##
  ## Only events that pass the filter will trigger the callback.
  ##
  ## Usage:
  ##   eventBus().subscribeFiltered(
  ##     filter = proc(event: NetworkConnected): bool =
  ##       return event.networkType == "wifi"
  ##     ,
  ##     callback = proc(event: NetworkConnected) =
  ##       echo "WiFi connected!"
  ##   )

  return eb.subscribe(proc(event: T) =
    if filter(event):
      callback(event)
  )

#
# Debugging
#

proc debugPrintEventBus*(eb: SdkEventBusManager): string =
  ## Get debug representation of event bus state
  result = "EventBusManager - Status:\n"
  result &= "  Total Event Types: " & $eb.handlers.len & "\n"
  result &= "  Total Subscribers: " & $eb.getTotalSubscribers() & "\n"

  for eventType, handlers in eb.handlers:
    result &= "    - " & eventType & ": " & $handlers.len & " subscribers\n"

#
# Design Notes
#
# Why EventBus?
#   - Decouples managers (avoids circular imports)
#   - Flexible: New managers can listen without changing existing code
#   - Testable: Easy to mock events
#
# Why NOT EventBus for User Code?
#   - Adds complexity
#   - Type-safe callbacks are simpler for user code
#   - EventBus is for internal plumbing, not public API
#
# Performance:
#   - Synchronous: No threading overhead
#   - Type-safe: No runtime type checks
#   - Minimal: Just table lookup and proc call
#
# Thread Safety:
#   - Not thread-safe (all managers run on same thread)
#   - If we add threading, would need locks
#
# Future Enhancements:
#   - Async event handlers (via async/await)
#   - Priority-based handler ordering
#   - Event history/replay for debugging
#   - Conditional compilation (remove in release builds)
#

#
# Runtime Integration
#

proc sdkEventBusManager*(runtime: AndroidRuntime): SdkEventBusManager =
  ## Get or create the SdkEventBusManager instance
  ## Lazy initialization pattern
  if runtime.sdkEventBusManager.isNone:
    runtime.sdkEventBusManager = some(newSdkEventBusManager())
  return runtime.sdkEventBusManager.get()

# Convenience global accessor
proc eventBus*(): SdkEventBusManager =
  ## Global accessor for SdkEventBusManager
  ## Requires AndroidRuntime to be initialized
  ##
  ## Usage:
  ##   eventBus().subscribe(proc(event: LowMemoryEvent) =
  ##     clearCaches()
  ##   )
  return runtime().sdkEventBusManager()
