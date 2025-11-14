# firebase.nim - Firebase integration

import android, options

type
  FirebaseAuthProvider* = enum
    Email, Google, Facebook, Twitter, GitHub, Phone, Anonymous
    
  FirebaseUser* = object
    uid*: string
    email*: Option[string]
    displayName*: Option[string]
    photoUrl*: Option[string]
    phoneNumber*: Option[string]
    isEmailVerified*: bool
    isAnonymous*: bool
    metadata*: tuple[creationTime: Time, lastSignInTime: Time]
    
  FirebaseAuthResult* = object
    success*: bool
    user*: Option[FirebaseUser]
    error*: Option[string]
    
  FirebaseAuthCallback* = proc(result: FirebaseAuthResult)
  
  FirebaseAnalyticsEvent* = object
    name*: string
    params*: Table[string, string]
    
  FirebaseRemoteConfigValue* = object
    case valueType*: enum
      String, Long, Double, Boolean
    of String:
      stringValue*: string
    of Long:
      longValue*: int64
    of Double:
      doubleValue*: float
    of Boolean:
      boolValue*: bool
      
  FirebaseMessageData* = object
    messageId*: string
    senderId*: Option[string]
    title*: Option[string]
    body*: Option[string]
    data*: Table[string, string]
    
  FirebaseMessageCallback* = proc(message: FirebaseMessageData)
    
  FirebaseCrashlytics* = object
    enabled*: bool
    userId*: Option[string]
    customKeys*: Table[string, string]
    
  FirebaseManager* = ref object of Manager
    authCallbacks: Table[string, FirebaseAuthCallback]
    messageCallbacks: seq[FirebaseMessageCallback]
    auth: pointer  # JNI reference to FirebaseAuth
    analytics: pointer  # JNI reference to FirebaseAnalytics
    config: pointer  # JNI reference to FirebaseRemoteConfig
    messaging: pointer  # JNI reference to FirebaseMessaging
    crashlytics: pointer  # JNI reference to FirebaseCrashlytics

# Constructor
proc newFirebaseManager*(context: Context): FirebaseManager
  ## Creates a new Firebase manager

# Authentication
proc getCurrentUser*(m: FirebaseManager): Option[FirebaseUser]
  ## Gets current authenticated user
  ## API 26+: Uses FirebaseAuth.getCurrentUser
  
proc signInWithEmail*(m: FirebaseManager, 
                    email: string, 
                    password: string,
                    callback: FirebaseAuthCallback): string
  ## Signs in with email and password
  ## Returns request ID
  ## API 26+: Uses FirebaseAuth.signInWithEmailAndPassword
  
proc signInWithProvider*(m: FirebaseManager,
                       provider: FirebaseAuthProvider,
                       activity: Activity,
                       callback: FirebaseAuthCallback): string
  ## Signs in with auth provider
  ## Returns request ID
  ## API 26+: Uses AuthUI or appropriate provider auth flow
  
proc createUser*(m: FirebaseManager, 
               email: string, 
               password: string,
               callback: FirebaseAuthCallback): string
  ## Creates user with email and password
  ## Returns request ID
  ## API 26+: Uses FirebaseAuth.createUserWithEmailAndPassword
  
proc signOut*(m: FirebaseManager): bool
  ## Signs out current user
  ## API 26+: Uses FirebaseAuth.signOut

# Analytics
proc logEvent*(m: FirebaseManager, event: FirebaseAnalyticsEvent): bool
  ## Logs analytics event
  ## API 26+: Uses FirebaseAnalytics.logEvent
  
proc setUserProperty*(m: FirebaseManager, name: string, value: string): bool
  ## Sets user property
  ## API 26+: Uses FirebaseAnalytics.setUserProperty
  
proc setUserId*(m: FirebaseManager, userId: string): bool
  ## Sets analytics user ID
  ## API 26+: Uses FirebaseAnalytics.setUserId

# Remote Config
proc fetchConfig*(m: FirebaseManager, expirationSeconds: int64 = 3600): bool
  ## Fetches remote config
  ## API 26+: Uses FirebaseRemoteConfig.fetch
  
proc activateConfig*(m: FirebaseManager): bool
  ## Activates fetched config
  ## API 26+: Uses FirebaseRemoteConfig.activate
  
proc getString*(m: FirebaseManager, key: string, defaultValue: string = ""): string
  ## Gets string config value
  ## API 26+: Uses FirebaseRemoteConfig.getString
  
proc getLong*(m: FirebaseManager, key: string, defaultValue: int64 = 0): int64
  ## Gets long config value
  ## API 26+: Uses FirebaseRemoteConfig.getLong
  
proc getDouble*(m: FirebaseManager, key: string, defaultValue: float = 0.0): float
  ## Gets double config value
  ## API 26+: Uses FirebaseRemoteConfig.getDouble
  
proc getBoolean*(m: FirebaseManager, key: string, defaultValue: bool = false): bool
  ## Gets boolean config value
  ## API 26+: Uses FirebaseRemoteConfig.getBoolean

# Cloud Messaging
proc getToken*(m: FirebaseManager): Option[string]
  ## Gets FCM token
  ## API 26+: Uses FirebaseMessaging.getToken
  
proc registerMessageHandler*(m: FirebaseManager, callback: FirebaseMessageCallback): bool
  ## Registers for FCM messages
  ## API 26+: Uses FirebaseMessagingService
  
proc unregisterMessageHandler*(m: FirebaseManager, callback: FirebaseMessageCallback): bool
  ## Unregisters FCM message handler
  ## API 26+: Removes from internal callback list
  
proc subscribeToTopic*(m: FirebaseManager, topic: string): bool
  ## Subscribes to FCM topic
  ## API 26+: Uses FirebaseMessaging.subscribeToTopic
  
proc unsubscribeFromTopic*(m: FirebaseManager, topic: string): bool
  ## Unsubscribes from FCM topic
  ## API 26+: Uses FirebaseMessaging.unsubscribeFromTopic

# Crashlytics
proc setCrashlyticsEnabled*(m: FirebaseManager, enabled: bool): bool
  ## Enables/disables Crashlytics
  ## API 26+: Uses FirebaseCrashlytics.setCrashlyticsCollectionEnabled
  
proc setUserId*(m: FirebaseManager, userId: string): bool
  ## Sets Crashlytics user ID
  ## API 26+: Uses FirebaseCrashlytics.setUserId
  
proc setCustomKey*(m: FirebaseManager, key: string, value: string): bool
  ## Sets Crashlytics custom key
  ## API 26+: Uses FirebaseCrashlytics.setCustomKey
  
proc logException*(m: FirebaseManager, exception: ref Exception): bool
  ## Logs non-fatal exception
  ## API 26+: Uses FirebaseCrashlytics.recordException