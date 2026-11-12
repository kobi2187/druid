## SHA-1, SHA-256, SHA-512, MD5 and HMAC in plain Nim: what crypto.nim uses
## on the desktop, so a digest there is the digest Android's providers give
## (tests/conformance.nim checks they agree).

import std/math

proc toUpperAsciiSimple(s: string): string =
  result = s
  for c in result.mitems:
    if c in {'a'..'z'}: c = chr(ord(c) - 32)

proc rotr32(x: uint32, n: int): uint32 {.inline.} = (x shr n) or (x shl (32 - n))
proc rotl32(x: uint32, n: int): uint32 {.inline.} = (x shl n) or (x shr (32 - n))
proc rotr64(x: uint64, n: int): uint64 {.inline.} = (x shr n) or (x shl (64 - n))

proc padded(data: openArray[byte], blockLen: int, lenBytes: int, bigEndian: bool): seq[byte] =
  result = @data
  result.add 0x80'u8
  while (result.len mod blockLen) != blockLen - lenBytes: result.add 0
  let bits = uint64(data.len) * 8
  var tail = newSeq[byte](lenBytes)
  for i in 0 ..< 8:
    let b = byte((bits shr (8 * i)) and 0xff)
    if bigEndian: tail[lenBytes - 1 - i] = b else: tail[i] = b
  result.add tail

proc be32(m: seq[byte], i: int): uint32 =
  (uint32(m[i]) shl 24) or (uint32(m[i+1]) shl 16) or (uint32(m[i+2]) shl 8) or uint32(m[i+3])
proc be64(m: seq[byte], i: int): uint64 =
  for k in 0 ..< 8: result = (result shl 8) or uint64(m[i+k])

const k256 = [
  0x428a2f98'u32, 0x71374491'u32, 0xb5c0fbcf'u32, 0xe9b5dba5'u32, 0x3956c25b'u32, 0x59f111f1'u32, 0x923f82a4'u32, 0xab1c5ed5'u32,
  0xd807aa98'u32, 0x12835b01'u32, 0x243185be'u32, 0x550c7dc3'u32, 0x72be5d74'u32, 0x80deb1fe'u32, 0x9bdc06a7'u32, 0xc19bf174'u32,
  0xe49b69c1'u32, 0xefbe4786'u32, 0x0fc19dc6'u32, 0x240ca1cc'u32, 0x2de92c6f'u32, 0x4a7484aa'u32, 0x5cb0a9dc'u32, 0x76f988da'u32,
  0x983e5152'u32, 0xa831c66d'u32, 0xb00327c8'u32, 0xbf597fc7'u32, 0xc6e00bf3'u32, 0xd5a79147'u32, 0x06ca6351'u32, 0x14292967'u32,
  0x27b70a85'u32, 0x2e1b2138'u32, 0x4d2c6dfc'u32, 0x53380d13'u32, 0x650a7354'u32, 0x766a0abb'u32, 0x81c2c92e'u32, 0x92722c85'u32,
  0xa2bfe8a1'u32, 0xa81a664b'u32, 0xc24b8b70'u32, 0xc76c51a3'u32, 0xd192e819'u32, 0xd6990624'u32, 0xf40e3585'u32, 0x106aa070'u32,
  0x19a4c116'u32, 0x1e376c08'u32, 0x2748774c'u32, 0x34b0bcb5'u32, 0x391c0cb3'u32, 0x4ed8aa4a'u32, 0x5b9cca4f'u32, 0x682e6ff3'u32,
  0x748f82ee'u32, 0x78a5636f'u32, 0x84c87814'u32, 0x8cc70208'u32, 0x90befffa'u32, 0xa4506ceb'u32, 0xbef9a3f7'u32, 0xc67178f2'u32]

proc sha256Digest*(data: openArray[byte]): seq[byte] =
  var h = [0x6a09e667'u32, 0xbb67ae85'u32, 0x3c6ef372'u32, 0xa54ff53a'u32,
           0x510e527f'u32, 0x9b05688c'u32, 0x1f83d9ab'u32, 0x5be0cd19'u32]
  let m = padded(data, 64, 8, true)
  var w: array[64, uint32]
  for off in countup(0, m.len - 1, 64):
    for t in 0 ..< 16: w[t] = be32(m, off + 4 * t)
    for t in 16 ..< 64:
      let s0 = rotr32(w[t-15], 7) xor rotr32(w[t-15], 18) xor (w[t-15] shr 3)
      let s1 = rotr32(w[t-2], 17) xor rotr32(w[t-2], 19) xor (w[t-2] shr 10)
      w[t] = w[t-16] + s0 + w[t-7] + s1
    var (a, b, c, d, e, f, g, hh) = (h[0], h[1], h[2], h[3], h[4], h[5], h[6], h[7])
    for t in 0 ..< 64:
      let t1 = hh + (rotr32(e, 6) xor rotr32(e, 11) xor rotr32(e, 25)) + ((e and f) xor ((not e) and g)) + k256[t] + w[t]
      let t2 = (rotr32(a, 2) xor rotr32(a, 13) xor rotr32(a, 22)) + ((a and b) xor (a and c) xor (b and c))
      hh = g; g = f; f = e; e = d + t1; d = c; c = b; b = a; a = t1 + t2
    h[0] += a; h[1] += b; h[2] += c; h[3] += d; h[4] += e; h[5] += f; h[6] += g; h[7] += hh
  for x in h:
    for s in [24, 16, 8, 0]: result.add byte((x shr s) and 0xff)

const k512 = [
  0x428a2f98d728ae22'u64, 0x7137449123ef65cd'u64, 0xb5c0fbcfec4d3b2f'u64, 0xe9b5dba58189dbbc'u64,
  0x3956c25bf348b538'u64, 0x59f111f1b605d019'u64, 0x923f82a4af194f9b'u64, 0xab1c5ed5da6d8118'u64,
  0xd807aa98a3030242'u64, 0x12835b0145706fbe'u64, 0x243185be4ee4b28c'u64, 0x550c7dc3d5ffb4e2'u64,
  0x72be5d74f27b896f'u64, 0x80deb1fe3b1696b1'u64, 0x9bdc06a725c71235'u64, 0xc19bf174cf692694'u64,
  0xe49b69c19ef14ad2'u64, 0xefbe4786384f25e3'u64, 0x0fc19dc68b8cd5b5'u64, 0x240ca1cc77ac9c65'u64,
  0x2de92c6f592b0275'u64, 0x4a7484aa6ea6e483'u64, 0x5cb0a9dcbd41fbd4'u64, 0x76f988da831153b5'u64,
  0x983e5152ee66dfab'u64, 0xa831c66d2db43210'u64, 0xb00327c898fb213f'u64, 0xbf597fc7beef0ee4'u64,
  0xc6e00bf33da88fc2'u64, 0xd5a79147930aa725'u64, 0x06ca6351e003826f'u64, 0x142929670a0e6e70'u64,
  0x27b70a8546d22ffc'u64, 0x2e1b21385c26c926'u64, 0x4d2c6dfc5ac42aed'u64, 0x53380d139d95b3df'u64,
  0x650a73548baf63de'u64, 0x766a0abb3c77b2a8'u64, 0x81c2c92e47edaee6'u64, 0x92722c851482353b'u64,
  0xa2bfe8a14cf10364'u64, 0xa81a664bbc423001'u64, 0xc24b8b70d0f89791'u64, 0xc76c51a30654be30'u64,
  0xd192e819d6ef5218'u64, 0xd69906245565a910'u64, 0xf40e35855771202a'u64, 0x106aa07032bbd1b8'u64,
  0x19a4c116b8d2d0c8'u64, 0x1e376c085141ab53'u64, 0x2748774cdf8eeb99'u64, 0x34b0bcb5e19b48a8'u64,
  0x391c0cb3c5c95a63'u64, 0x4ed8aa4ae3418acb'u64, 0x5b9cca4f7763e373'u64, 0x682e6ff3d6b2b8a3'u64,
  0x748f82ee5defb2fc'u64, 0x78a5636f43172f60'u64, 0x84c87814a1f0ab72'u64, 0x8cc702081a6439ec'u64,
  0x90befffa23631e28'u64, 0xa4506cebde82bde9'u64, 0xbef9a3f7b2c67915'u64, 0xc67178f2e372532b'u64,
  0xca273eceea26619c'u64, 0xd186b8c721c0c207'u64, 0xeada7dd6cde0eb1e'u64, 0xf57d4f7fee6ed178'u64,
  0x06f067aa72176fba'u64, 0x0a637dc5a2c898a6'u64, 0x113f9804bef90dae'u64, 0x1b710b35131c471b'u64,
  0x28db77f523047d84'u64, 0x32caab7b40c72493'u64, 0x3c9ebe0a15c9bebc'u64, 0x431d67c49c100d4c'u64,
  0x4cc5d4becb3e42b6'u64, 0x597f299cfc657e2a'u64, 0x5fcb6fab3ad6faec'u64, 0x6c44198c4a475817'u64]

proc sha512Digest*(data: openArray[byte]): seq[byte] =
  var h = [0x6a09e667f3bcc908'u64, 0xbb67ae8584caa73b'u64, 0x3c6ef372fe94f82b'u64, 0xa54ff53a5f1d36f1'u64,
           0x510e527fade682d1'u64, 0x9b05688c2b3e6c1f'u64, 0x1f83d9abfb41bd6b'u64, 0x5be0cd19137e2179'u64]
  let m = padded(data, 128, 16, true)
  var w: array[80, uint64]
  for off in countup(0, m.len - 1, 128):
    for t in 0 ..< 16: w[t] = be64(m, off + 8 * t)
    for t in 16 ..< 80:
      let s0 = rotr64(w[t-15], 1) xor rotr64(w[t-15], 8) xor (w[t-15] shr 7)
      let s1 = rotr64(w[t-2], 19) xor rotr64(w[t-2], 61) xor (w[t-2] shr 6)
      w[t] = w[t-16] + s0 + w[t-7] + s1
    var (a, b, c, d, e, f, g, hh) = (h[0], h[1], h[2], h[3], h[4], h[5], h[6], h[7])
    for t in 0 ..< 80:
      let t1 = hh + (rotr64(e, 14) xor rotr64(e, 18) xor rotr64(e, 41)) + ((e and f) xor ((not e) and g)) + k512[t] + w[t]
      let t2 = (rotr64(a, 28) xor rotr64(a, 34) xor rotr64(a, 39)) + ((a and b) xor (a and c) xor (b and c))
      hh = g; g = f; f = e; e = d + t1; d = c; c = b; b = a; a = t1 + t2
    h[0] += a; h[1] += b; h[2] += c; h[3] += d; h[4] += e; h[5] += f; h[6] += g; h[7] += hh
  for x in h:
    for s in countdown(56, 0, 8): result.add byte((x shr s) and 0xff)

proc sha1Digest*(data: openArray[byte]): seq[byte] =
  var h = [0x67452301'u32, 0xEFCDAB89'u32, 0x98BADCFE'u32, 0x10325476'u32, 0xC3D2E1F0'u32]
  let m = padded(data, 64, 8, true)
  var w: array[80, uint32]
  for off in countup(0, m.len - 1, 64):
    for t in 0 ..< 16: w[t] = be32(m, off + 4 * t)
    for t in 16 ..< 80: w[t] = rotl32(w[t-3] xor w[t-8] xor w[t-14] xor w[t-16], 1)
    var (a, b, c, d, e) = (h[0], h[1], h[2], h[3], h[4])
    for t in 0 ..< 80:
      let (f, k) = if t < 20: ((b and c) or ((not b) and d), 0x5A827999'u32)
                   elif t < 40: (b xor c xor d, 0x6ED9EBA1'u32)
                   elif t < 60: ((b and c) or (b and d) or (c and d), 0x8F1BBCDC'u32)
                   else: (b xor c xor d, 0xCA62C1D6'u32)
      let tmp = rotl32(a, 5) + f + e + k + w[t]
      e = d; d = c; c = rotl32(b, 30); b = a; a = tmp
    h[0] += a; h[1] += b; h[2] += c; h[3] += d; h[4] += e
  for x in h:
    for s in [24, 16, 8, 0]: result.add byte((x shr s) and 0xff)

proc md5Digest*(data: openArray[byte]): seq[byte] =
  const s = [7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22,
             5, 9, 14, 20, 5, 9, 14, 20, 5, 9, 14, 20, 5, 9, 14, 20,
             4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23,
             6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21]
  var k: array[64, uint32]
  for i in 0 ..< 64:
    k[i] = uint32(uint64(abs(sin(float(i + 1))) * 4294967296.0) and 0xffffffff'u64)
  var a0 = 0x67452301'u32
  var b0 = 0xefcdab89'u32
  var c0 = 0x98badcfe'u32
  var d0 = 0x10325476'u32
  let m = padded(data, 64, 8, false)
  for off in countup(0, m.len - 1, 64):
    var w: array[16, uint32]
    for t in 0 ..< 16:
      let i = off + 4 * t
      w[t] = uint32(m[i]) or (uint32(m[i+1]) shl 8) or (uint32(m[i+2]) shl 16) or (uint32(m[i+3]) shl 24)
    var (a, b, c, d) = (a0, b0, c0, d0)
    for i in 0 ..< 64:
      var f: uint32
      var g: int
      if i < 16: f = (b and c) or ((not b) and d); g = i
      elif i < 32: f = (d and b) or ((not d) and c); g = (5 * i + 1) mod 16
      elif i < 48: f = b xor c xor d; g = (3 * i + 5) mod 16
      else: f = c xor (b or (not d)); g = (7 * i) mod 16
      f = f + a + k[i] + w[g]
      a = d; d = c; c = b
      b = b + rotl32(f, s[i])
    a0 += a; b0 += b; c0 += c; d0 += d
  for x in [a0, b0, c0, d0]:
    for sh in [0, 8, 16, 24]: result.add byte((x shr sh) and 0xff)

proc digestOf*(algorithm: string, data: openArray[byte]): seq[byte] =
  ## By Java's names: "SHA-256", "SHA-512", "SHA-1", "MD5". Raises ValueError otherwise.
  case algorithm.toUpperAsciiSimple
  of "SHA-256", "SHA256": sha256Digest(data)
  of "SHA-512", "SHA512": sha512Digest(data)
  of "SHA-1", "SHA1", "SHA": sha1Digest(data)
  of "MD5": md5Digest(data)
  else: raise newException(ValueError, "java.security.NoSuchAlgorithmException: " & algorithm & " MessageDigest not available")

proc hmacOf*(algorithm: string, key, data: openArray[byte]): seq[byte] =
  ## By Java's names: "HmacSHA256", "HmacSHA512", "HmacSHA1", "HmacMD5".
  let digest = case algorithm.toUpperAsciiSimple
    of "HMACSHA256": "SHA-256"
    of "HMACSHA512": "SHA-512"
    of "HMACSHA1": "SHA-1"
    of "HMACMD5": "MD5"
    else: raise newException(ValueError, "java.security.NoSuchAlgorithmException: Algorithm " & algorithm & " not available")
  let blockLen = if digest == "SHA-512": 128 else: 64
  var k = @key
  if k.len > blockLen: k = digestOf(digest, k)
  k.setLen(blockLen)
  var inner, outer: seq[byte]
  for b in k:
    inner.add(b xor 0x36)
    outer.add(b xor 0x5c)
  inner.add data
  outer.add digestOf(digest, inner)
  digestOf(digest, outer)

