## Hashes, MACs and randomness.
##
## ```nim
## echo crypto().sha256Hex("hello")
## let token = crypto().randomBytes(32)
## ```
##
## On Android, digests and MACs come from its providers; on the desktop from
## hashing.nim, which gives the same bytes (tests/conformance.nim checks it).
## An unknown algorithm raises DruidError on both.

import std/[sysrand, base64, strutils]
import bridge, hashing

type Crypto* = object
proc crypto*(): Crypto = discard

proc toBytes*(s: string): seq[byte] =
  result = newSeq[byte](s.len)
  for i, c in s: result[i] = byte(c)

proc toHex*(b: openArray[byte]): string =
  result = newStringOfCap(b.len * 2)
  for x in b: result.add toHex(int(x), 2).toLowerAscii

proc digest*(_: Crypto, algorithm: string, data: openArray[byte]): seq[byte] =
  ## `algorithm`: "SHA-256", "SHA-512", "SHA-1", "MD5".
  if druidStarted(): return callStatic(seq[byte], "Crypto", "digest", algorithm, @data)
  try: digestOf(algorithm, data)
  except ValueError as e: raise newException(DruidError, "Crypto.digest (simulated): " & e.msg)
proc sha256*(c: Crypto, data: string): seq[byte] = c.digest("SHA-256", data.toBytes)
proc sha256Hex*(c: Crypto, data: string): string = c.sha256(data).toHex
proc sha512*(c: Crypto, data: string): seq[byte] = c.digest("SHA-512", data.toBytes)

proc hmac*(_: Crypto, algorithm: string, key, data: openArray[byte]): seq[byte] =
  ## `algorithm`: "HmacSHA256", "HmacSHA512", "HmacSHA1".
  if druidStarted(): return callStatic(seq[byte], "Crypto", "hmac", algorithm, @key, @data)
  try: hmacOf(algorithm, key, data)
  except ValueError as e: raise newException(DruidError, "Crypto.hmac (simulated): " & e.msg)
proc hmacSha256*(c: Crypto, key, data: string): seq[byte] = c.hmac("HmacSHA256", key.toBytes, data.toBytes)

proc randomBytes*(_: Crypto, n: int): seq[byte] =
  ## Cryptographically secure (SecureRandom on Android, the OS's source elsewhere).
  if n < 0: raise newException(ValueError, "randomBytes: negative count")
  if druidStarted(): callStatic(seq[byte], "Crypto", "randomBytes", n)
  else: urandom(n)

proc uuid*(c: Crypto): string =
  ## A random (version 4) UUID.
  if druidStarted(): return callStatic(string, "Crypto", "uuid")
  var b = urandom(16)
  b[6] = (b[6] and 0x0f) or 0x40
  b[8] = (b[8] and 0x3f) or 0x80
  let h = b.toHex
  h[0..7] & "-" & h[8..11] & "-" & h[12..15] & "-" & h[16..19] & "-" & h[20..31]

proc base64Encode*(_: Crypto, data: openArray[byte], urlSafe = false): string =
  result = base64.encode(data, safe = urlSafe)
  if urlSafe: result = result.strip(leading = false, chars = {'='})

proc base64Decode*(_: Crypto, s: string): seq[byte] =
  ## Standard or URL-safe, padded or not.
  var t = s.multiReplace(("-", "+"), ("_", "/"))
  while t.len mod 4 != 0: t.add '='
  base64.decode(t).toBytes
