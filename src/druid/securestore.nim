## Secrets -- tokens, passwords, keys -- encrypted with a key that lives in
## the Android Keystore (AES-256-GCM). Not even the app can read the key out.
##
## ```nim
## secureStore().setString("token", token)
## let t = secureStore().getString("token")      # Option[string]
## ```
##
## A value that can no longer be decrypted (restored from a backup onto
## another phone, where the key is not) reads as absent: be ready to sign in
## again. On the desktop the values are kept in a prefs file, NOT encrypted.

import std/[options, base64, algorithm]
import bridge, prefs

type SecureStore* = object
proc secureStore*(): SecureStore = discard

proc desk(): Prefs = prefs("secure-NOT-ENCRYPTED")

proc setBytes*(_: SecureStore, name: string, value: openArray[byte]) =
  if druidStarted():
    callStatic(void, "SecureStore", "put", name, @value)
  else:
    var s = newString(value.len)
    for i, b in value: s[i] = char(b)
    desk().setString(name, encode(s))

proc getBytes*(_: SecureStore, name: string): Option[seq[byte]] =
  if druidStarted():
    if not callStatic(bool, "SecureStore", "contains", name): return none(seq[byte])
    let v = callStatic(seq[byte], "SecureStore", "get", name)
    # null (undecryptable, now removed) arrives as empty: tell it from an empty value.
    if v.len == 0 and not callStatic(bool, "SecureStore", "contains", name): return none(seq[byte])
    return some(v)
  if not desk().contains(name): return none(seq[byte])
  let s = decode(desk().getString(name))
  var b = newSeq[byte](s.len)
  for i, c in s: b[i] = byte(c)
  some(b)

proc setString*(s: SecureStore, name, value: string) =
  var b = newSeq[byte](value.len)
  for i, c in value: b[i] = byte(c)
  s.setBytes(name, b)

proc getString*(s: SecureStore, name: string): Option[string] =
  let b = s.getBytes(name)
  if b.isNone: return none(string)
  var r = newString(b.get.len)
  for i, x in b.get: r[i] = char(x)
  some(r)

proc contains*(_: SecureStore, name: string): bool =
  bridged(desk().contains(name)): callStatic(bool, "SecureStore", "contains", name)
proc remove*(_: SecureStore, name: string) =
  if druidStarted(): callStatic(void, "SecureStore", "remove", name) else: desk().remove(name)
proc clear*(_: SecureStore) =
  if druidStarted(): callStatic(void, "SecureStore", "clear") else: desk().clear()
proc names*(_: SecureStore): seq[string] =
  ## The stored names, sorted.
  bridged(desk().keys.sorted): callStatic(seq[string], "SecureStore", "names")
