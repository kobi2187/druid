import jnim

jclass android.telephony.PhoneNumberUtils* of JVMObject:
  proc isISODigit*(c: jchar): jboolean {.`static`.}
  proc is12Key*(c: jchar): jboolean {.`static`.}
  proc isDialable*(c: jchar): jboolean {.`static`.}
  proc isReallyDialable*(c: jchar): jboolean {.`static`.}
  proc isNonSeparator*(c: jchar): jboolean {.`static`.}
  proc isStartsPostDial*(c: jchar): jboolean {.`static`.}
  proc getMinMatchForTest*(): jint {.`static`.}
  proc setMinMatchForTest*(minMatch: jint) {.`static`.}
  proc getNumberFromIntent*(intent: Intent, context: Context): string {.`static`.}
  proc extractNetworkPortion*(phoneNumber: string): string {.`static`.}
  proc extractNetworkPortionAlt*(phoneNumber: string): string {.`static`.}
  proc stripSeparators*(phoneNumber: string): string {.`static`.}
  proc convertAndStrip*(phoneNumber: string): string {.`static`.}
  proc convertPreDial*(phoneNumber: string): string {.`static`.}
  proc extractPostDialPortion*(phoneNumber: string): string {.`static`.}
  proc compare*(a: string, b: string): jboolean {.`static`.}
  proc compare*(context: Context, a: string, b: string): jboolean {.`static`.}
  proc compare*(a: string, b: string, useStrictComparation: jboolean): jboolean {.`static`.}
  proc compareLoosely*(a: string, b: string): jboolean {.`static`.}
  proc compareStrictly*(a: string, b: string): jboolean {.`static`.}
  proc compareStrictly*(a: string, b: string, acceptInvalidCCCPrefix: jboolean): jboolean {.`static`.}
  proc toCallerIDMinMatch*(phoneNumber: string): string {.`static`.}
  proc getStrippedReversed*(phoneNumber: string): string {.`static`.}
  proc stringFromStringAndTOA*(s: string, TOA: jint): string {.`static`.}
  proc toaFromString*(s: string): jint {.`static`.}
  proc calledPartyBCDToString*(bytes: seq[jbyte], offset: jint, length: jint): string {.`static`.}
  proc calledPartyBCDToString*(bytes: seq[jbyte], offset: jint, length: jint, bcdExtType: jint): string {.`static`.}
  proc calledPartyBCDFragmentToString*(bytes: seq[jbyte], offset: jint, length: jint): string {.`static`.}
  proc calledPartyBCDFragmentToString*(bytes: seq[jbyte], offset: jint, length: jint, bcdExtType: jint): string {.`static`.}
  proc isWellFormedSmsAddress*(address: string): jboolean {.`static`.}
  proc isGlobalPhoneNumber*(phoneNumber: string): jboolean {.`static`.}
  proc networkPortionToCalledPartyBCD*(s: string): seq[jbyte] {.`static`.}
  proc networkPortionToCalledPartyBCDWithLength*(s: string): seq[jbyte] {.`static`.}
  proc numberToCalledPartyBCD*(number: string): seq[jbyte] {.`static`.}
  proc numberToCalledPartyBCD*(number: string, bcdExtType: jint): seq[jbyte] {.`static`.}
  proc formatNumber*(source: string): string {.`static`.}
  proc formatNumber*(source: string, defaultFormattingType: jint): string {.`static`.}
  proc getFormatTypeForLocale*(locale: Locale): jint {.`static`.}
  proc formatNumber*(text: Editable, defaultFormattingType: jint) {.`static`.}
  proc formatNanpNumber*(text: Editable) {.`static`.}
  proc formatJapaneseNumber*(text: Editable) {.`static`.}
  proc formatNumberToE164*(phoneNumber: string, defaultCountryIso: string): string {.`static`.}
  proc formatNumberToRFC3966*(phoneNumber: string, defaultCountryIso: string): string {.`static`.}
  proc isInternationalNumber*(phoneNumber: string, defaultCountryIso: string): jboolean {.`static`.}
  proc formatNumber*(phoneNumber: string, defaultCountryIso: string): string {.`static`.}
  proc formatNumber*(phoneNumber: string, phoneNumberE164: string, defaultCountryIso: string): string {.`static`.}
  proc normalizeNumber*(phoneNumber: string): string {.`static`.}
  proc replaceUnicodeDigits*(number: string): string {.`static`.}
  proc isEmergencyNumber*(number: string): jboolean {.`static`.}
  proc isEmergencyNumber*(subId: jint, number: string): jboolean {.`static`.}
  proc isLocalEmergencyNumber*(context: Context, number: string): jboolean {.`static`.}
  proc isVoiceMailNumber*(number: string): jboolean {.`static`.}
  proc isVoiceMailNumber*(subId: jint, number: string): jboolean {.`static`.}
  proc isVoiceMailNumber*(context: Context, subId: jint, number: string): jboolean {.`static`.}
  proc convertKeypadLettersToDigits*(input: string): string {.`static`.}
  proc cdmaCheckAndProcessPlusCode*(dialStr: string): string {.`static`.}
  proc cdmaCheckAndProcessPlusCodeForSms*(dialStr: string): string {.`static`.}
  proc cdmaCheckAndProcessPlusCodeByNumberFormat*(dialStr: string, currFormat: jint, defaultFormat: jint): string {.`static`.}
  proc createTtsSpannable*(phoneNumber: CharSequence): CharSequence {.`static`.}
  proc addTtsSpan*(s: Spannable, start: jint, endExclusive: jint) {.`static`.}
  proc ttsSpanAsPhoneNumber*(phoneNumber: CharSequence): CharSequence {.`static`.}
  proc ttsSpanAsPhoneNumber*(s: Spannable, start: jint, end: jint) {.`static`.}
  proc createTtsSpan*(phoneNumberString: string): TtsSpan {.`static`.}
  proc isNanp*(dialStr: string): jboolean {.`static`.}
  proc isUriNumber*(number: string): jboolean {.`static`.}
  proc getUsernameFromUriNumber*(number: string): string {.`static`.}
  proc convertSipUriToTelUri*(source: Uri): Uri {.`static`.}
  proc convertToEmergencyNumber*(context: Context, number: string): string {.`static`.}
  proc areSamePhoneNumber*(number1: string, number2: string, defaultCountryIso: string): jboolean {.`static`.}
  proc isWpsCallNumber*(number: string): jboolean {.`static`.}
  BCD_EXTENDED_TYPE_EF_ADN*: jint {.`static`.}
  BCD_EXTENDED_TYPE_CALLED_PARTY*: jint {.`static`.}
  PAUSE*: jchar {.`static`.}
  WAIT*: jchar {.`static`.}
  WILD*: jchar {.`static`.}
  TOA_International*: jint {.`static`.}
  TOA_Unknown*: jint {.`static`.}
  FORMAT_UNKNOWN*: jint {.`static`.}
  FORMAT_NANP*: jint {.`static`.}
  FORMAT_JAPAN*: jint {.`static`.}

