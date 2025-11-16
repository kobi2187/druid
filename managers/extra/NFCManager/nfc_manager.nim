## NFCManager - NFC Reading and Writing Support
##
## Provides support for Near Field Communication (NFC) operations on Android.
## Handles NFC tag detection, reading NDEF messages, writing to NFC tags, and
## foreground dispatch for NFC intents.
##
## Features:
## - NFC adapter availability detection
## - NDEF message reading from NFC tags
## - Writing NDEF messages to NFC tags
## - Foreground dispatch system for receiving NFC intents
## - Support for various NFC tag technologies (NfcA, NfcB, NfcF, etc.)
## - Peer-to-peer NFC communication (Android Beam)
##
## Architecture:
## - Uses Android NfcAdapter for NFC operations
## - NdefMessage and NdefRecord for NDEF data structures
## - Tag for low-level tag operations
## - Requires Activity for foreground dispatch
##
## Permissions Required:
## - NFC permission in AndroidManifest.xml
##
## Example:
## ```nim
## let nfcm = nfc()
##
## if nfcm.isNfcAvailable() and nfcm.isNfcEnabled():
##   # Enable foreground dispatch to receive NFC intents
##   nfcm.enableForegroundDispatch(proc(tag: NfcTag) =
##     echo "NFC tag detected: ", tag.id
##     let message = nfcm.readNdefMessage(tag)
##     if message.isSome:
##       echo "NDEF message: ", message.get()
##   )
## else:
##   echo "NFC not available or disabled"
## ```

import jnim
import options
import sequtils

# Forward declarations
type
  SdkNfcManager* = ref object
    nfcAdapter: jobject  ## android.nfc.NfcAdapter
    currentActivity: jobject  ## Activity for foreground dispatch
    pendingIntent: jobject  ## PendingIntent for foreground dispatch
    isForegroundDispatchEnabled: bool

  NfcTag* = object
    ## Represents an NFC tag
    tag: jobject  ## android.nfc.Tag
    id*: seq[byte]  ## Tag UID
    techList*: seq[string]  ## Available technologies
    tagType*: NfcTagType

  NfcTagType* = enum
    ## NFC tag types
    ntUnknown = 0
    ntNfcA = 1  ## ISO 14443-3A (Mifare Classic, etc.)
    ntNfcB = 2  ## ISO 14443-3B
    ntNfcF = 3  ## JIS 6319-4 (FeliCa)
    ntNfcV = 4  ## ISO 15693
    ntIsoDep = 5  ## ISO 14443-4
    ntNdef = 6  ## NDEF formattable
    ntMifareClassic = 7
    ntMifareUltralight = 8

  NdefMessage* = object
    ## NDEF (NFC Data Exchange Format) message
    message: jobject  ## android.nfc.NdefMessage
    records*: seq[NdefRecord]

  NdefRecord* = object
    ## NDEF record containing data
    record: jobject  ## android.nfc.NdefRecord
    tnf*: TypeNameFormat  ## Type Name Format
    recordType*: seq[byte]  ## Record type
    id*: seq[byte]  ## Record ID
    payload*: seq[byte]  ## Actual data

  TypeNameFormat* = enum
    ## NDEF record Type Name Format
    tnfEmpty = 0x00  ## Empty record
    tnfWellKnown = 0x01  ## Well-known type (RTD)
    tnfMimeMedia = 0x02  ## MIME media type
    tnfAbsoluteUri = 0x03  ## Absolute URI
    tnfExternalType = 0x04  ## External type
    tnfUnknown = 0x05  ## Unknown type
    tnfUnchanged = 0x06  ## Unchanged (chunked records)

# JNI class bindings
jclass android.nfc.NfcAdapter of jobject:
  proc getDefaultAdapter(context: jobject): jobject {.static.}
  proc isEnabled(): bool
  proc enableForegroundDispatch(activity: jobject, intent: jobject,
                                filters: jobject, techLists: jobject): void
  proc disableForegroundDispatch(activity: jobject): void

jclass android.nfc.Tag of jobject:
  proc getId(): jByteArray
  proc getTechList(): jobject  # String[]

jclass android.nfc.NdefMessage of jobject:
  proc `new`(records: jobject): void {.constructor.}  # NdefRecord[]
  proc getRecords(): jobject  # NdefRecord[]

jclass android.nfc.NdefRecord of jobject:
  proc `new`(tnf: jshort, recordType: jByteArray, id: jByteArray,
            payload: jByteArray): void {.constructor.}
  proc getTnf(): jshort
  proc getType(): jByteArray
  proc getId(): jByteArray
  proc getPayload(): jByteArray
  proc createTextRecord(languageCode: JString, text: JString): jobject {.static.}
  proc createUri(uriString: JString): jobject {.static.}

jclass android.nfc.tech.Ndef of jobject:
  proc get(tag: jobject): jobject {.static.}  # Returns Ndef
  proc connect(): void
  proc close(): void
  proc isConnected(): bool
  proc getCachedNdefMessage(): jobject  # NdefMessage
  proc writeNdefMessage(message: jobject): void
  proc isWritable(): bool
  proc canMakeReadOnly(): bool
  proc makeReadOnly(): bool

# Type aliases
type
  JNfcAdapter = android.nfc.NfcAdapter
  JTag = android.nfc.Tag
  JNdefMessage = android.nfc.NdefMessage
  JNdefRecord = android.nfc.NdefRecord
  JNdef = android.nfc.tech.Ndef

# Global singleton instance
var globalNfcManager: SdkNfcManager = nil

#------------------
# Initialization
#------------------

proc initNfcManager*(context: jobject): SdkNfcManager =
  ## Initialize the NFC manager with an Android Context
  ##
  ## Context is typically an Activity. Returns nil if NFC is not supported.
  if globalNfcManager != nil:
    return globalNfcManager

  let adapter = JNfcAdapter.getDefaultAdapter(context)
  if adapter == nil:
    echo "NFCManager: NFC not supported on this device"
    return nil

  result = SdkNfcManager(
    nfcAdapter: adapter,
    currentActivity: context,
    pendingIntent: nil,
    isForegroundDispatchEnabled: false
  )

  globalNfcManager = result

proc nfc*(): SdkNfcManager =
  ## Get the global NFC manager instance
  ##
  ## Note: Must call initNfcManager() first with an Activity context
  return globalNfcManager

#------------------
# NFC Availability
#------------------

proc isNfcAvailable*(nfcm: SdkNfcManager): bool =
  ## Check if NFC is available on the device
  return nfcm != nil and nfcm.nfcAdapter != nil

proc isNfcEnabled*(nfcm: SdkNfcManager): bool =
  ## Check if NFC is currently enabled in device settings
  if not nfcm.isNfcAvailable():
    return false

  try:
    return nfcm.nfcAdapter.isEnabled()
  except:
    echo "NFCManager: Failed to check NFC enabled state: ", getCurrentExceptionMsg()
    return false

proc openNfcSettings*(nfcm: SdkNfcManager) =
  ## Open device settings to enable NFC
  ##
  ## Launches the Android NFC settings screen where users can enable NFC.
  ## TODO: Requires Intent creation
  echo "NFCManager: openNfcSettings requires Intent implementation"
  echo "TODO: Launch Settings.ACTION_NFC_SETTINGS intent"

#------------------
# Foreground Dispatch
#------------------

proc enableForegroundDispatch*(nfcm: SdkNfcManager,
                              onTagDetected: proc(tag: NfcTag)) =
  ## Enable foreground dispatch to receive NFC intents while activity is in foreground
  ##
  ## When an NFC tag is detected, onTagDetected callback is invoked with tag information.
  ##
  ## Must be called in Activity.onResume()
  ##
  ## NOTE: Requires PendingIntent creation and Intent filters setup.
  ## TODO: Implement PendingIntent and IntentFilter creation
  if not nfcm.isNfcAvailable():
    echo "NFCManager: NFC not available"
    return

  if nfcm.currentActivity == nil:
    echo "NFCManager: No activity set for foreground dispatch"
    return

  echo "NFCManager: enableForegroundDispatch requires PendingIntent creation"
  echo "TODO: Create PendingIntent with FLAG_MUTABLE for Android 12+"
  echo "TODO: Setup IntentFilter for NDEF_DISCOVERED, TECH_DISCOVERED, TAG_DISCOVERED"

  # Pseudocode of what needs to happen:
  # let intent = PendingIntent.getActivity(activity, 0, new Intent(activity, activity.class), FLAG_MUTABLE)
  # let filters = [new IntentFilter(NfcAdapter.ACTION_NDEF_DISCOVERED)]
  # let techLists = [["android.nfc.tech.Ndef"], ["android.nfc.tech.NfcA"]]
  # nfcAdapter.enableForegroundDispatch(activity, intent, filters, techLists)

  nfcm.isForegroundDispatchEnabled = true

proc disableForegroundDispatch*(nfcm: SdkNfcManager) =
  ## Disable foreground dispatch
  ##
  ## Must be called in Activity.onPause()
  if not nfcm.isNfcAvailable():
    return

  if nfcm.currentActivity == nil:
    return

  try:
    nfcm.nfcAdapter.disableForegroundDispatch(nfcm.currentActivity)
    nfcm.isForegroundDispatchEnabled = false
    echo "NFCManager: Foreground dispatch disabled"
  except:
    echo "NFCManager: Failed to disable foreground dispatch: ", getCurrentExceptionMsg()

proc isForegroundDispatchEnabled*(nfcm: SdkNfcManager): bool =
  ## Check if foreground dispatch is currently enabled
  return nfcm.isForegroundDispatchEnabled

#------------------
# Tag Operations
#------------------

proc parseTag*(nfcm: SdkNfcManager, tagObject: jobject): NfcTag =
  ## Parse an android.nfc.Tag object into our NfcTag type
  ##
  ## Internal helper for converting JNI Tag objects.
  var tag = NfcTag(
    tag: tagObject,
    id: @[],
    techList: @[],
    tagType: ntUnknown
  )

  try:
    # Get tag ID
    let idBytes = tagObject.call("getId").toByteArray
    for b in idBytes:
      tag.id.add(b)

    # Get technology list
    let techArray = tagObject.call("getTechList")
    # TODO: Convert String[] to seq[string]
    # For now, tech list remains empty

    # Determine tag type from available technologies
    # This would analyze the tech list to determine the most specific type
    tag.tagType = ntUnknown

  except:
    echo "NFCManager: Failed to parse tag: ", getCurrentExceptionMsg()

  return tag

#------------------
# NDEF Operations
#------------------

proc readNdefMessage*(nfcm: SdkNfcManager, tag: NfcTag): Option[NdefMessage] =
  ## Read NDEF message from an NFC tag
  ##
  ## Returns None if the tag doesn't contain NDEF data or if reading fails.
  if not nfcm.isNfcAvailable():
    return none(NdefMessage)

  try:
    # Get Ndef tech for this tag
    let ndef = JNdef.get(tag.tag)
    if ndef == nil:
      echo "NFCManager: Tag does not support NDEF"
      return none(NdefMessage)

    # Connect to tag
    ndef.connect()
    defer: ndef.close()

    # Read cached NDEF message
    let messageObj = ndef.getCachedNdefMessage()
    if messageObj == nil:
      echo "NFCManager: No NDEF message on tag"
      return none(NdefMessage)

    # Parse NDEF message
    var message = NdefMessage(
      message: messageObj,
      records: @[]
    )

    # Get records
    let recordsArray = messageObj.call("getRecords")
    # TODO: Parse NdefRecord array
    # For now, records remain empty

    return some(message)

  except:
    echo "NFCManager: Failed to read NDEF message: ", getCurrentExceptionMsg()
    return none(NdefMessage)

proc writeNdefMessage*(nfcm: SdkNfcManager, tag: NfcTag,
                      message: NdefMessage): bool =
  ## Write an NDEF message to an NFC tag
  ##
  ## Returns true if write was successful.
  ## The tag must be NDEF-formattable and writable.
  if not nfcm.isNfcAvailable():
    return false

  try:
    # Get Ndef tech for this tag
    let ndef = JNdef.get(tag.tag)
    if ndef == nil:
      echo "NFCManager: Tag does not support NDEF"
      return false

    # Connect to tag
    ndef.connect()
    defer: ndef.close()

    # Check if writable
    if not ndef.isWritable():
      echo "NFCManager: Tag is not writable"
      return false

    # Write message
    ndef.writeNdefMessage(message.message)
    echo "NFCManager: NDEF message written successfully"
    return true

  except:
    echo "NFCManager: Failed to write NDEF message: ", getCurrentExceptionMsg()
    return false

proc makeReadOnly*(nfcm: SdkNfcManager, tag: NfcTag): bool =
  ## Make an NFC tag read-only (permanent operation!)
  ##
  ## WARNING: This operation is PERMANENT and cannot be undone!
  ## The tag will become read-only forever.
  if not nfcm.isNfcAvailable():
    return false

  try:
    let ndef = JNdef.get(tag.tag)
    if ndef == nil:
      echo "NFCManager: Tag does not support NDEF"
      return false

    ndef.connect()
    defer: ndef.close()

    if not ndef.canMakeReadOnly():
      echo "NFCManager: Tag cannot be made read-only"
      return false

    if ndef.makeReadOnly():
      echo "NFCManager: Tag made read-only (permanent!)"
      return true
    else:
      return false

  except:
    echo "NFCManager: Failed to make tag read-only: ", getCurrentExceptionMsg()
    return false

#------------------
# NDEF Record Creation Helpers
#------------------

proc createTextRecord*(nfcm: SdkNfcManager, text: string,
                      languageCode: string = "en"): NdefRecord =
  ## Create an NDEF text record
  ##
  ## Language code defaults to "en" (English).
  try:
    let recordObj = JNdefRecord.createTextRecord(languageCode.toJString, text.toJString)

    return NdefRecord(
      record: recordObj,
      tnf: tnfWellKnown,
      recordType: @[0x54'u8],  # 'T' for Text
      id: @[],
      payload: @[]  # Would contain encoded text
    )
  except:
    echo "NFCManager: Failed to create text record: ", getCurrentExceptionMsg()
    # Return empty record
    return NdefRecord(tnf: tnfEmpty)

proc createUriRecord*(nfcm: SdkNfcManager, uri: string): NdefRecord =
  ## Create an NDEF URI record
  ##
  ## URI can be a URL (http://...), phone number (tel:...), etc.
  try:
    let recordObj = JNdefRecord.createUri(uri.toJString)

    return NdefRecord(
      record: recordObj,
      tnf: tnfWellKnown,
      recordType: @[0x55'u8],  # 'U' for URI
      id: @[],
      payload: @[]  # Would contain encoded URI
    )
  except:
    echo "NFCManager: Failed to create URI record: ", getCurrentExceptionMsg()
    return NdefRecord(tnf: tnfEmpty)

proc createNdefMessage*(nfcm: SdkNfcManager,
                       records: seq[NdefRecord]): NdefMessage =
  ## Create an NDEF message from a sequence of records
  ##
  ## Used for writing custom NDEF data to tags.
  try:
    # TODO: Convert seq[NdefRecord] to jobject array
    # For now, create empty message
    echo "NFCManager: createNdefMessage requires NdefRecord[] construction"

    return NdefMessage(
      message: nil,  # Would contain constructed message
      records: records
    )
  except:
    echo "NFCManager: Failed to create NDEF message: ", getCurrentExceptionMsg()
    return NdefMessage()

#------------------
# P2P / Android Beam (Deprecated but still functional)
#------------------

proc enableBeam*(nfcm: SdkNfcManager, message: NdefMessage) =
  ## Enable Android Beam to send NDEF message to another device
  ##
  ## Note: Android Beam was deprecated in Android 10 but still works on older devices.
  ## For modern P2P, consider using Nearby Connections API instead.
  echo "NFCManager: Android Beam support (deprecated in Android 10)"
  echo "TODO: Use NfcAdapter.setNdefPushMessage() for Beam"

#------------------
# Utility Functions
#------------------

proc tagIdToHex*(tag: NfcTag): string =
  ## Convert tag ID to hexadecimal string representation
  result = ""
  for b in tag.id:
    result.add(b.toHex(2))
    result.add(":")
  if result.len > 0:
    result = result[0..^2]  # Remove trailing ":"

proc cleanup*(nfcm: SdkNfcManager) =
  ## Clean up NFC resources
  if nfcm.isForegroundDispatchEnabled:
    nfcm.disableForegroundDispatch()

# Export key types and functions
export SdkNfcManager, NfcTag, NfcTagType
export NdefMessage, NdefRecord, TypeNameFormat
export initNfcManager, nfc
export isNfcAvailable, isNfcEnabled, openNfcSettings
export enableForegroundDispatch, disableForegroundDispatch, isForegroundDispatchEnabled
export parseTag
export readNdefMessage, writeNdefMessage, makeReadOnly
export createTextRecord, createUriRecord, createNdefMessage
export enableBeam
export tagIdToHex, cleanup
