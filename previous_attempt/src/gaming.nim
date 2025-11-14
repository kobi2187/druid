# gaming.nim - Game services

import android, options

type
  LeaderboardSort* = enum
    TimeSpan_Daily, TimeSpan_Weekly, TimeSpan_AllTime,
    Collection_Public, Collection_Social, Collection_Friends
    
  AchievementState* = enum
    Unlocked, Revealed, Hidden
    
  AchievementType* = enum
    Standard, Incremental
    
  LeaderboardScore* = object
    rank*: int
    displayScore*: string
    rawScore*: int64
    scoreHolder*: string
    scoreHolderIconUri*: Option[string]
    timestamp*: Time
    
  Achievement* = object
    id*: string
    name*: string
    description*: string
    iconUri*: Option[string]
    state*: AchievementState
    case achievementType*: AchievementType
    of Standard:
      discard
    of Incremental:
      currentSteps*: int
      totalSteps*: int
      
  SignInListener* = proc(success: bool, error: Option[string])
  LeaderboardListener* = proc(scores: seq[LeaderboardScore], error: Option[string])
  AchievementListener* = proc(achievements: seq[Achievement], error: Option[string])
    
  GamingManager* = ref object of Manager
    gamesClient: pointer  # JNI reference
    achievementsClient: pointer  # JNI reference
    leaderboardsClient: pointer  # JNI reference
    signInListener: Option[SignInListener]
    activity: Option[Activity]
    isSignedIn: bool

# Constructor
proc newGamingManager*(context: Context, activity: Option[Activity] = none(Activity)): GamingManager
  ## Creates a new gaming manager
  ## Activity required for sign-in and UI flows

# Authentication
proc signIn*(m: GamingManager, listener: SignInListener): bool
  ## Signs in to Google Play Games
  ## API 26+: Uses GoogleSignIn.getClient and Games.getGamesClient
  ## Requires activity
  
proc signOut*(m: GamingManager): bool
  ## Signs out from Google Play Games
  ## API 26+: Uses GoogleSignIn.getClient.signOut
  
proc isSignedIn*(m: GamingManager): bool
  ## Checks if signed in to Google Play Games
  ## API 26+: Uses GoogleSignIn.getLastSignedInAccount

# Leaderboards
proc submitScore*(m: GamingManager, 
                leaderboardId: string, 
                score: int64): bool
  ## Submits score to leaderboard
  ## API 26+: Uses LeaderboardsClient.submitScore
  
proc getLeaderboardScores*(m: GamingManager,
                         leaderboardId: string,
                         sortType: LeaderboardSort,
                         maxResults: int,
                         listener: LeaderboardListener): bool
  ## Gets leaderboard scores
  ## API 26+: Uses LeaderboardsClient.loadLeaderboardScores
  
proc showLeaderboard*(m: GamingManager, 
                    leaderboardId: Option[string] = none(string)): bool
  ## Shows leaderboard UI
  ## API 26+: Uses LeaderboardsClient.getLeaderboardIntent
  ## Requires activity

# Achievements
proc unlockAchievement*(m: GamingManager, achievementId: string): bool
  ## Unlocks achievement
  ## API 26+: Uses AchievementsClient.unlock
  
proc incrementAchievement*(m: GamingManager, 
                         achievementId: string, 
                         steps: int): bool
  ## Increments achievement progress
  ## API 26+: Uses AchievementsClient.increment
  
proc revealAchievement*(m: GamingManager, achievementId: string): bool
  ## Reveals hidden achievement
  ## API 26+: Uses AchievementsClient.reveal
  
proc getAchievements*(m: GamingManager, listener: AchievementListener): bool
  ## Gets all achievements
  ## API 26+: Uses AchievementsClient.load
  
proc showAchievements*(m: GamingManager): bool
  ## Shows achievements UI
  ## API 26+: Uses AchievementsClient.getAchievementsIntent
  ## Requires activity