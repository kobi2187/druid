# social.nim - Social network integration

import android, options

type
  SocialNetwork* = enum
    Facebook, Twitter, LinkedIn, Instagram, Snapchat, TikTok
    
  SocialProfile* = object
    id*: string
    name*: Option[string]
    email*: Option[string]
    pictureUrl*: Option[string]
    accessToken*: Option[string]
    
  SocialShareContent* = object
    text*: Option[string]
    url*: Option[string]
    imageUrl*: Option[string]
    hashtags*: seq[string]
    
  LoginCallback* = proc(profile: Option[SocialProfile], error: Option[string])
  ShareCallback* = proc(success: bool, error: Option[string])
    
  SocialManager* = ref object of Manager
    networks: Table[SocialNetwork, pointer]  # JNI references to various SDKs
    loginCallbacks: Table[SocialNetwork, LoginCallback]
    shareCallbacks: Table[SocialNetwork, ShareCallback]
    activity: Option[Activity]

# Constructor
proc newSocialManager*(context: Context, activity: Option[Activity] = none(Activity)): SocialManager
  ## Creates a new social manager
  ## Activity required for login and share flows

# Network management
proc initialize*(m: SocialManager, 
               network: SocialNetwork, 
               apiKey: string,
               apiSecret: Option[string] = none(string)): bool
  ## Initializes social network
  ## API 26+: Uses appropriate SDK initialization
  
proc isNetworkAvailable*(m: SocialManager, network: SocialNetwork): bool
  ## Checks if social network SDK is available
  ## API 26+: Checks if appropriate app or SDK is installed

# Login
proc login*(m: SocialManager,
          network: SocialNetwork,
          permissions: seq[string],
          callback: LoginCallback): bool
  ## Logs in to social network
  ## API 26+: Uses appropriate SDK login
  ## Requires activity
  
proc logout*(m: SocialManager, network: SocialNetwork): bool
  ## Logs out from social network
  ## API 26+: Uses appropriate SDK logout
  
proc isLoggedIn*(m: SocialManager, network: SocialNetwork): bool
  ## Checks if logged in to social network
  ## API 26+: Uses appropriate SDK session check

# Profile
proc getProfile*(m: SocialManager, 
               network: SocialNetwork,
               callback: proc(profile: Option[SocialProfile], error: Option[string])): bool
  ## Gets social profile
  ## API 26+: Uses appropriate SDK profile request
  
proc getFriends*(m: SocialManager,
               network: SocialNetwork,
               callback: proc(profiles: seq[SocialProfile], error: Option[string])): bool
  ## Gets friends list
  ## API 26+: Uses appropriate SDK friends request
  ## Note: Many networks restrict this API

# Sharing
proc share*(m: SocialManager,
          network: SocialNetwork,
          content: SocialShareContent,
          callback: ShareCallback): bool
  ## Shares content to social network
  ## API 26+: Uses appropriate SDK share method
  ## Requires activity
  
proc shareToAny*(m: SocialManager,
               content: SocialShareContent,
               callback: ShareCallback): bool
  ## Shares to any available network
  ## API 26+: Uses Intent.ACTION_SEND
  ## Requires activity