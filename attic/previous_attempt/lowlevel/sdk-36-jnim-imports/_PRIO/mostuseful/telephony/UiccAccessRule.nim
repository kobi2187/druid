import jnim

jclass android.telephony.UiccAccessRule* of JVMObject:
  proc encodeRules*(accessRules: seq[UiccAccessRule]): seq[jbyte] {.`static`.}
  proc decodeRulesFromCarrierConfig*(certs: seq[string]): seq[UiccAccessRule] {.`static`.}
  proc decodeRules*(encodedRules: seq[jbyte]): seq[UiccAccessRule] {.`static`.}
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getPackageName*(): string
  proc getCertificateHexString*(): string
  proc getCarrierPrivilegeStatus*(packageInfo: PackageInfo): jint
  proc getCarrierPrivilegeStatus*(signature: Signature, packageName: string): jint
  proc hasMatchingCertificateHashAndPackageName*(certHash: string, packageName: string): jboolean
  proc hasMatchingCertificateHashAndPackageName*(certHash: seq[jbyte], packageName: string): jboolean
  proc hasMatchingCertificateHashHashAndPackageName*(certHashHashCode: jint, packageName: string): jboolean
  proc getCertificateHashHashCode*(certHash: seq[jbyte]): jint {.`static`.}
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc getSignatures*(packageInfo: PackageInfo): List[Signature] {.`static`.}
  proc getCertHash*(signature: Signature, algo: string): seq[jbyte] {.`static`.}
  CREATOR*: Creator[UiccAccessRule] {.`static`.}

