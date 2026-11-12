# preferences.nim - Shared preferences

import android, options, json

type
  PreferenceAccessMode* = enum
    Private,     # Only this app
    WorldReadable, # Other apps can read
    WorldWritable, # Other apps can write
    MultiProcess   # For IPC sharing
    
  PreferenceType* = enum
    ## Types supported in preferences
    PrefString, PrefInt, PrefBool, PrefFloat, PrefLong, PrefStringSet
    
  PreferenceValue* = object
    case kind*: PreferenceType
    of PrefString:
      strVal*: string
    of PrefInt:
      intVal*: int
    of PrefBool:
      boolVal*: bool
    of PrefFloat:
      floatVal*: float
    of PrefLong:
      longVal*: int64
    of PrefStringSet:
      setVal*: seq[string]
      
  PreferenceChangeListener* = proc(key: string, newValue: PreferenceValue)
    
  PreferenceManager* = ref object of Manager
    prefListeners: Table[string, seq[PreferenceChangeListener]]
    currentPreferences: string
    systemService: pointer  # JNI reference

# Constructor
proc newPreferenceManager*(context: Context): PreferenceManager
  ## Creates a new preference manager

# Preference file management
proc openPreferences*(m: PreferenceManager, name: string, mode: PreferenceAccessMode = Private): bool
  ## Opens named preferences file
  ## API 26+: Only Private mode is fully supported
  ## API 29+: Other modes are deprecated
  
proc migratePreferences*(m: PreferenceManager, sourceName, targetName: string): bool
  ## Migrates preferences between files
  
proc clearPreferences*(m: PreferenceManager): bool
  ## Clears all values in current preferences file

# Preference operations
proc contains*(m: PreferenceManager, key: string): bool
  ## Checks if preference exists
  
proc getKeys*(m: PreferenceManager): seq[string]
  ## Gets all preference keys
  
proc get*[T](m: PreferenceManager, key: string, defaultValue: T): T
  ## Gets typed preference value with default
  ## Type is inferred from defaultValue
  
proc getString*(m: PreferenceManager, key: string, defaultValue: string = ""): string
  ## Gets string preference
  
proc getInt*(m: PreferenceManager, key: string, defaultValue: int = 0): int
  ## Gets int preference
  
proc getBool*(m: PreferenceManager, key: string, defaultValue: bool = false): bool
  ## Gets bool preference
  
proc getFloat*(m: PreferenceManager, key: string, defaultValue: float = 0.0): float
  ## Gets float preference
  
proc getLong*(m: PreferenceManager, key: string, defaultValue: int64 = 0): int64
  ## Gets long preference
  
proc getStringSet*(m: PreferenceManager, key: string, defaultValue: seq[string] = @[]): seq[string]
  ## Gets string set preference
  
proc put*[T](m: PreferenceManager, key: string, value: T): bool
  ## Puts typed preference value
  ## Type is inferred from value
  
proc putString*(m: PreferenceManager, key: string, value: string): bool
  ## Puts string preference
  
proc putInt*(m: PreferenceManager, key: string, value: int): bool
  ## Puts int preference
  
proc putBool*(m: PreferenceManager, key: string, value: bool): bool
  ## Puts bool preference
  
proc putFloat*(m: PreferenceManager, key: string, value: float): bool
  ## Puts float preference
  
proc putLong*(m: PreferenceManager, key: string, value: int64): bool
  ## Puts long preference
  
proc putStringSet*(m: PreferenceManager, key: string, value: seq[string]): bool
  ## Puts string set preference
  
proc remove*(m: PreferenceManager, key: string): bool
  ## Removes preference

# Change notification
proc registerChangeListener*(m: PreferenceManager, key: string, listener: PreferenceChangeListener)
  ## Registers for preference changes
  
proc unregisterChangeListener*(m: PreferenceManager, key: string, listener: PreferenceChangeListener)
  ## Unregisters preference change listener