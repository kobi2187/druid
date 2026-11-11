# app_links.nim - App links and deep links

import android, options

type
  DeepLinkScheme* = enum
    Http, Https, Custom
    
  DeepLinkPattern* = object
    scheme*: DeepLinkScheme
    host*: string
    path*: string
    pathPatterns*: seq[string]
    pathPrefixes*: seq[string]
    
  AppLinkIntent* = object
    action*: string
    uri*: string
    categories*: seq[string]
    dataType*: Option[string]
    extras*: Table[string, string]
    flags*: int
    
  DeepLinkReceiver* = proc(intent: AppLinkIntent)
    
  AppLinksManager* = ref object of Manager
    deepLinkReceivers: Table[string, DeepLinkReceiver]
    activity: Option[Activity]

# Constructor
proc newAppLinksManager*(context: Context, activity: Option[Activity] = none(Activity)): AppLinksManager
  ## Creates a new app links manager
  ## Activity required for handling incoming intents

# Deep link registration
proc registerDeepLinkReceiver*(m: AppLinksManager, 
                             pattern: DeepLinkPattern,
                             receiver: DeepLinkReceiver): string
  ## Registers deep link receiver
  ## Returns receiver ID
  ## API 26+: Uses IntentFilter for activity or BroadcastReceiver
  
proc unregisterDeepLinkReceiver*(m: AppLinksManager, receiverId: string): bool
  ## Unregisters deep link receiver
  ## API 26+: Removes from internal list
  
proc parseIntent*(m: AppLinksManager, intent: pointer): AppLinkIntent
  ## Parses intent to app link intent
  ## API 26+: Uses Intent getters
  
proc handleDeepLink*(m: AppLinksManager, intent: pointer): bool
  ## Handles deep link intent
  ## API 26+: Parses intent and calls appropriate receiver
  ## Returns true if handled

# Link generation
proc buildDeepLink*(m: AppLinksManager, 
                  scheme: string,
                  host: string,
                  path: string,
                  queryParams: Table[string, string] = initTable[string, string]()): string
  ## Builds deep link URL
  ## API 26+: Uses Uri.Builder
  
proc buildAppLink*(m: AppLinksManager,
                 host: string,
                 path: string,
                 queryParams: Table[string, string] = initTable[string, string]()): string
  ## Builds App Link URL (HTTPS)
  ## API 26+: Uses Uri.Builder with https scheme
  
proc openDeepLink*(m: AppLinksManager, url: string): bool
  ## Opens deep link
  ## API 26+: Uses Intent.ACTION_VIEW
  ## Requires activity

# Intent utilities
proc getIncomingIntent*(m: AppLinksManager): Option[AppLinkIntent]
  ## Gets incoming intent
  ## API 26+: Uses Activity.getIntent
  ## Requires activity
  
proc isAppLinkIntent*(m: AppLinksManager, intent: pointer): bool
  ## Checks if intent is app link
  ## API 26+: Uses Intent.getAction and Intent.getData
  
proc isFromBrowser*(m: AppLinksManager, intent: pointer): bool
  ## Checks if intent is from browser
  ## API 26+: Uses Intent.getStringExtra(Browser.EXTRA_APPLICATION_ID)