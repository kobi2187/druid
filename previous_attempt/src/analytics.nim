# analytics.nim - Analytics tracking

import android, options

type
  EventType* = enum
    ## Common analytics event types
    ViewScreen, Search, Login, SignUp, Purchase,
    Share, AddToCart, CheckoutBegin, CheckoutComplete,
    ContentView, Achievement, Tutorial, LevelUp
    
  UserProperty* = object
    name*: string
    value*: string
    
  EventParam* = object
    name*: string
    case valueType*: enum
      String, Integer, Double, Boolean
    of String:
      stringValue*: string
    of Integer:
      intValue*: int
    of Double:
      doubleValue*: float
    of Boolean:
      boolValue*: bool
      
  Event* = object
    name*: string
    params*: seq[EventParam]
    timestamp*: Time
    
  SessionStatus* = enum
    Started, Resumed, Paused, Stopped
    
  AnalyticsProvider* = enum
    Firebase, GoogleAnalytics, Custom
    
  AnalyticsManager* = ref object of Manager
    providers: Table[AnalyticsProvider, pointer]  # JNI references
    userProperties: Table[string, string]
    lastEvents: seq[Event]
    sessionStart: Option[Time]
    sessionId: string

# Constructor
proc newAnalyticsManager*(context: Context): AnalyticsManager
  ## Creates a new analytics manager

# Providers management
proc configureProvider*(m: AnalyticsManager, 
                      provider: AnalyticsProvider,
                      config: Table[string, string]): bool
  ## Configures analytics provider
  ## API 26+: Uses appropriate provider implementations
  
proc isProviderAvailable*(m: AnalyticsManager, provider: AnalyticsProvider): bool
  ## Checks if analytics provider is available
  ## API 26+: Checks if appropriate libraries are available

# Event tracking
proc logEvent*(m: AnalyticsManager, 
             eventType: EventType,
             params: varargs[EventParam]): bool
  ## Logs predefined event type
  ## API 26+: Maps to provider-specific events
  
proc logCustomEvent*(m: AnalyticsManager, 
                   eventName: string,
                   params: varargs[EventParam]): bool
  ## Logs custom event
  ## API 26+: Sends to configured providers
  
proc logScreenView*(m: AnalyticsManager, 
                  screenName: string,
                  screenClass: Option[string] = none(string)): bool
  ## Logs screen view
  ## API 26+: Maps to screen tracking in providers
  
proc logError*(m: AnalyticsManager, 
             errorName: string,
             errorMessage: Option[string] = none(string),
             stackTrace: Option[string] = none(string)): bool
  ## Logs error event
  ## API 26+: Maps to exception tracking in providers

# User properties
proc setUserProperty*(m: AnalyticsManager, name: string, value: string): bool
  ## Sets user property
  ## API 26+: Maps to provider user properties
  
proc setUserId*(m: AnalyticsManager, userId: string): bool
  ## Sets user ID
  ## API 26+: Maps to provider user ID setting
  
proc clearUserProperty*(m: AnalyticsManager, name: string): bool
  ## Clears user property
  ## API 26+: Removes from providers

# Session management
proc startSession*(m: AnalyticsManager): bool
  ## Starts analytics session
  ## API 26+: Maps to provider session start
  
proc endSession*(m: AnalyticsManager): bool
  ## Ends analytics session
  ## API 26+: Maps to provider session end