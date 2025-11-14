import jnim

jclass android.util.PackageUtils* of JVMObject:
  proc computeSignaturesSha256Digests*(signatures: seq[Signature]): seq[string] {.`static`.}
  proc computeSignaturesSha256Digests*(signatures: seq[Signature], separator: string): seq[string] {.`static`.}
  proc computeSignaturesSha256Digest*(signatures: seq[Signature]): string {.`static`.}
  proc computeSignaturesSha256Digest*(sha256Digests: seq[string]): string {.`static`.}
  proc computeSha256DigestBytes*(data: seq[jbyte]): seq[jbyte] {.`static`.}
  proc computeSha256Digest*(data: seq[jbyte]): string {.`static`.}
  proc computeSha256Digest*(data: seq[jbyte], separator: string): string {.`static`.}
  proc createLargeFileBuffer*(): seq[jbyte] {.`static`.}
  proc computeSha256DigestForLargeFileAsBytes*(filePath: string, fileBuffer: seq[jbyte]): seq[jbyte] {.`static`.}
  proc computeSha256DigestForLargeFile*(filePath: string, fileBuffer: seq[jbyte]): string {.`static`.}
  proc computeSha256DigestForLargeFile*(filePath: string, fileBuffer: seq[jbyte], separator: string): string {.`static`.}

