## StateManager - Android Bundle State Persistence
##
## This manager provides type-safe state persistence using Android's Bundle API.
## It works closely with LifecycleManager and is the foundation for ResurrectionManager.
##
## Philosophy: Explicit state management with type safety.
## Users explicitly save/restore state - no magic, but very convenient.
##
## Android Background:
## - Android can kill your app process at any time (low memory, backgrounding, etc.)
## - onSaveInstanceState(Bundle) is called before process death
## - onCreate(Bundle) receives the saved state on revival
## - Bundle is Android's serialization mechanism (key-value pairs)
##
## Druid's Approach:
## - Type-safe wrappers around Bundle operations
## - Support for common types (int, float, string, bool, sequences)
## - Easy serialization for custom types (future: via macros)
##
## Usage:
##   var state = stateManager()
##
##   # On pause - save state
##   lifecycle().onSaveInstanceState(proc(bundle: JObject) =
##     state.saveInt(bundle, "score", gameScore)
##     state.saveString(bundle, "player", playerName)
##   )
##
##   # On create - restore state
##   lifecycle().onRestoreInstanceState(proc(bundle: JObject) =
##     gameScore = state.getInt(bundle, "score", defaultValue = 0)
##     playerName = state.getString(bundle, "player", defaultValue = "")
##   )

import jnim
import options
import ../../../core

# JNI bindings for Android Bundle
jnimport:
  import android.os.Bundle as JBundle

type
  SdkStateManager* = ref object
    ## Manager for Android Bundle state operations
    ## Provides type-safe Bundle serialization

#
# Initialization
#

proc newSdkStateManager*(): SdkStateManager =
  result = SdkStateManager()

#
# Primitive Types - Save
#

proc putInt*(sm: SdkStateManager, bundle: JObject, key: string, value: int) =
  ## Save an integer to Bundle
  bundle.call("putInt", key.toJString, value.jint)

proc putLong*(sm: SdkStateManager, bundle: JObject, key: string, value: int64) =
  ## Save a long integer to Bundle
  bundle.call("putLong", key.toJString, value.jlong)

proc putFloat*(sm: SdkStateManager, bundle: JObject, key: string, value: float32) =
  ## Save a float to Bundle
  bundle.call("putFloat", key.toJString, value.jfloat)

proc putDouble*(sm: SdkStateManager, bundle: JObject, key: string, value: float64) =
  ## Save a double to Bundle
  bundle.call("putDouble", key.toJString, value.jdouble)

proc putString*(sm: SdkStateManager, bundle: JObject, key: string, value: string) =
  ## Save a string to Bundle
  bundle.call("putString", key.toJString, value.toJString)

proc putBool*(sm: SdkStateManager, bundle: JObject, key: string, value: bool) =
  ## Save a boolean to Bundle
  bundle.call("putBoolean", key.toJString, value.jboolean)

#
# Primitive Types - Restore
#

proc getInt*(sm: SdkStateManager, bundle: JObject, key: string, defaultValue: int = 0): int =
  ## Restore an integer from Bundle
  ## Returns defaultValue if key not found
  if not bundle.call("containsKey", key.toJString).boolValue:
    return defaultValue
  return bundle.call("getInt", key.toJString).intValue

proc getLong*(sm: SdkStateManager, bundle: JObject, key: string, defaultValue: int64 = 0): int64 =
  ## Restore a long integer from Bundle
  if not bundle.call("containsKey", key.toJString).boolValue:
    return defaultValue
  return bundle.call("getLong", key.toJString).longValue

proc getFloat*(sm: SdkStateManager, bundle: JObject, key: string, defaultValue: float32 = 0.0): float32 =
  ## Restore a float from Bundle
  if not bundle.call("containsKey", key.toJString).boolValue:
    return defaultValue
  return bundle.call("getFloat", key.toJString).floatValue

proc getDouble*(sm: SdkStateManager, bundle: JObject, key: string, defaultValue: float64 = 0.0): float64 =
  ## Restore a double from Bundle
  if not bundle.call("containsKey", key.toJString).boolValue:
    return defaultValue
  return bundle.call("getDouble", key.toJString).doubleValue

proc getString*(sm: SdkStateManager, bundle: JObject, key: string, defaultValue: string = ""): string =
  ## Restore a string from Bundle
  if not bundle.call("containsKey", key.toJString).boolValue:
    return defaultValue
  let jstr = bundle.call("getString", key.toJString)
  if jstr.isNull:
    return defaultValue
  return $jstr

proc getBool*(sm: SdkStateManager, bundle: JObject, key: string, defaultValue: bool = false): bool =
  ## Restore a boolean from Bundle
  if not bundle.call("containsKey", key.toJString).boolValue:
    return defaultValue
  return bundle.call("getBoolean", key.toJString).boolValue

#
# Array Types - Save
#

proc putIntArray*(sm: SdkStateManager, bundle: JObject, key: string, values: seq[int]) =
  ## Save sequence of integers to Bundle
  var jarray = newJIntArray(values.len)
  for i, val in values:
    jarray[i] = val.jint
  bundle.call("putIntArray", key.toJString, jarray)

proc putLongArray*(sm: SdkStateManager, bundle: JObject, key: string, values: seq[int64]) =
  ## Save sequence of long integers to Bundle
  var jarray = newJLongArray(values.len)
  for i, val in values:
    jarray[i] = val.jlong
  bundle.call("putLongArray", key.toJString, jarray)

proc putFloatArray*(sm: SdkStateManager, bundle: JObject, key: string, values: seq[float32]) =
  ## Save sequence of floats to Bundle
  var jarray = newJFloatArray(values.len)
  for i, val in values:
    jarray[i] = val.jfloat
  bundle.call("putFloatArray", key.toJString, jarray)

proc putDoubleArray*(sm: SdkStateManager, bundle: JObject, key: string, values: seq[float64]) =
  ## Save sequence of doubles to Bundle
  var jarray = newJDoubleArray(values.len)
  for i, val in values:
    jarray[i] = val.jdouble
  bundle.call("putDoubleArray", key.toJString, jarray)

proc putStringArray*(sm: SdkStateManager, bundle: JObject, key: string, values: seq[string]) =
  ## Save sequence of strings to Bundle
  var jarray = newJObjectArray(values.len, "java/lang/String")
  for i, val in values:
    jarray[i] = val.toJString
  bundle.call("putStringArray", key.toJString, jarray)

proc putBoolArray*(sm: SdkStateManager, bundle: JObject, key: string, values: seq[bool]) =
  ## Save sequence of booleans to Bundle
  var jarray = newJBooleanArray(values.len)
  for i, val in values:
    jarray[i] = val.jboolean
  bundle.call("putBooleanArray", key.toJString, jarray)

#
# Array Types - Restore
#

proc getIntArray*(sm: SdkStateManager, bundle: JObject, key: string): seq[int] =
  ## Restore sequence of integers from Bundle
  if not bundle.call("containsKey", key.toJString).boolValue:
    return @[]
  let jarray = bundle.call("getIntArray", key.toJString)
  if jarray.isNull:
    return @[]
  let len = jarray.len
  result = newSeq[int](len)
  for i in 0..<len:
    result[i] = jarray[i].intValue

proc getLongArray*(sm: SdkStateManager, bundle: JObject, key: string): seq[int64] =
  ## Restore sequence of long integers from Bundle
  if not bundle.call("containsKey", key.toJString).boolValue:
    return @[]
  let jarray = bundle.call("getLongArray", key.toJString)
  if jarray.isNull:
    return @[]
  let len = jarray.len
  result = newSeq[int64](len)
  for i in 0..<len:
    result[i] = jarray[i].longValue

proc getFloatArray*(sm: SdkStateManager, bundle: JObject, key: string): seq[float32] =
  ## Restore sequence of floats from Bundle
  if not bundle.call("containsKey", key.toJString).boolValue:
    return @[]
  let jarray = bundle.call("getFloatArray", key.toJString)
  if jarray.isNull:
    return @[]
  let len = jarray.len
  result = newSeq[float32](len)
  for i in 0..<len:
    result[i] = jarray[i].floatValue

proc getDoubleArray*(sm: SdkStateManager, bundle: JObject, key: string): seq[float64] =
  ## Restore sequence of doubles from Bundle
  if not bundle.call("containsKey", key.toJString).boolValue:
    return @[]
  let jarray = bundle.call("getDoubleArray", key.toJString)
  if jarray.isNull:
    return @[]
  let len = jarray.len
  result = newSeq[float64](len)
  for i in 0..<len:
    result[i] = jarray[i].doubleValue

proc getStringArray*(sm: SdkStateManager, bundle: JObject, key: string): seq[string] =
  ## Restore sequence of strings from Bundle
  if not bundle.call("containsKey", key.toJString).boolValue:
    return @[]
  let jarray = bundle.call("getStringArray", key.toJString)
  if jarray.isNull:
    return @[]
  let len = jarray.len
  result = newSeq[string](len)
  for i in 0..<len:
    let jstr = jarray[i]
    result[i] = if jstr.isNull: "" else: $jstr

proc getBoolArray*(sm: SdkStateManager, bundle: JObject, key: string): seq[bool] =
  ## Restore sequence of booleans from Bundle
  if not bundle.call("containsKey", key.toJString).boolValue:
    return @[]
  let jarray = bundle.call("getBooleanArray", key.toJString)
  if jarray.isNull:
    return @[]
  let len = jarray.len
  result = newSeq[bool](len)
  for i in 0..<len:
    result[i] = jarray[i].boolValue

#
# Bundle Operations
#

proc containsKey*(sm: SdkStateManager, bundle: JObject, key: string): bool =
  ## Check if Bundle contains a key
  return bundle.call("containsKey", key.toJString).boolValue

proc remove*(sm: SdkStateManager, bundle: JObject, key: string) =
  ## Remove a key from Bundle
  bundle.call("remove", key.toJString)

proc clear*(sm: SdkStateManager, bundle: JObject) =
  ## Clear all keys from Bundle
  bundle.call("clear")

proc isEmpty*(sm: SdkStateManager, bundle: JObject): bool =
  ## Check if Bundle is empty
  return bundle.call("isEmpty").boolValue

proc size*(sm: SdkStateManager, bundle: JObject): int =
  ## Get number of keys in Bundle
  return bundle.call("size").intValue

proc getKeys*(sm: SdkStateManager, bundle: JObject): seq[string] =
  ## Get all keys in Bundle
  let keySet = bundle.call("keySet")
  let iterator = keySet.call("iterator")
  result = @[]
  while iterator.call("hasNext").boolValue:
    let key = iterator.call("next")
    result.add($key)

#
# Nested Bundle Support
#

proc putBundle*(sm: SdkStateManager, bundle: JObject, key: string, nestedBundle: JObject) =
  ## Save a nested Bundle
  bundle.call("putBundle", key.toJString, nestedBundle)

proc getBundle*(sm: SdkStateManager, bundle: JObject, key: string): Option[JObject] =
  ## Restore a nested Bundle
  if not bundle.call("containsKey", key.toJString).boolValue:
    return none(JObject)
  let nested = bundle.call("getBundle", key.toJString)
  if nested.isNull:
    return none(JObject)
  return some(nested)

proc createBundle*(sm: SdkStateManager): JObject =
  ## Create a new empty Bundle
  return JBundle.new()

#
# Debugging
#

proc debugPrint*(sm: SdkStateManager, bundle: JObject): string =
  ## Get debug representation of Bundle contents
  ## Useful for debugging state persistence issues
  return $bundle.call("toString")

#
# Runtime Integration
#

proc sdkStateManager*(runtime: AndroidRuntime): SdkStateManager =
  ## Get or create the SdkStateManager instance
  ## Lazy initialization pattern
  if runtime.sdkStateManager.isNone:
    runtime.sdkStateManager = some(newSdkStateManager())
  return runtime.sdkStateManager.get()

# Convenience global accessor
proc stateManager*(): SdkStateManager =
  ## Global accessor for SdkStateManager
  ## Requires AndroidRuntime to be initialized
  return runtime().sdkStateManager()
