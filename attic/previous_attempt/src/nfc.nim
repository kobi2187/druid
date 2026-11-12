# nfc.nim - NFC utilities

import android, options

type
  NFCTagType* = enum
    Unknown, NDEF, MifareClassic, MifareUltralight,
    IsoDep, NfcA, NfcB, NfcF, NfcV
    
  NFCTagTechnology* = enum
    Ndef, NdefFormatable, MifareClassic, MifareUltralight,
    IsoDep, NfcA, NfcB, NfcF, NfcV
    
  NdefRecordType* = enum
    Text, Uri, Mime, External, Unknown
    
  NdefRecord* = object
    case recordType*: NdefRecordType
    of Text:
      text*: string
      language*: string
    of Uri:
      uri*: string
    of Mime:
      mimeType*: string
      mimeData*: seq[byte]
    of External:
      domain*: string
      externalType*: string
      externalData*: seq[byte]
    of Unknown:
      payload*: seq[byte]
    id*: seq[byte]
    
  NdefMessage* = object
    records*: seq[NdefRecord]
    
  NFCTag* = object
    id*: seq[byte]
    techList*: seq[NFCTagTechnology]
    tagType*: NFCTagType
    ndefMessage*: Option[NdefMessage]
    
  NFCDiscoveryOptions* = object
    readOnly*: bool  # Only read tags, don't enable write mode
    singleTopOnly*: bool  # Only dispatch to foreground activity
    
  NFCTagDiscoveredCallback* = proc(tag: NFCTag)
  NFCTagErrorCallback* = proc(error: string)
    
  NFCManager* = ref object of Manager
    tagCallbacks: seq[NFCTagDiscoveredCallback]
    errorCallbacks: seq[NFCTagErrorCallback]
    adapter: pointer  # JNI reference to NfcAdapter
    pendingIntent: pointer  # JNI reference to PendingIntent

# Constructor
proc newNFCManager*(context: Context): NFCManager
  ## Creates a new NFC manager

# NFC availability
proc isAvailable*(m: NFCManager): bool
  ## Checks if NFC is available
  ## API 26+: Uses NfcAdapter.getDefaultAdapter != null
  
proc isEnabled*(m: NFCManager): bool
  ## Checks if NFC is enabled
  ## API 26+: Uses NfcAdapter.isEnabled
  
proc openNfcSettings*(m: NFCManager): bool
  ## Opens NFC settings
  ## API 26+: Uses Intent with Settings.ACTION_NFC_SETTINGS

# Tag reading
proc enableReaderMode*(m: NFCManager,
                     activity: Activity,
                     options: NFCDiscoveryOptions,
                     callback: NFCTagDiscoveredCallback,
                     errorCallback: Option[NFCTagErrorCallback] = none(NFCTagErrorCallback)): bool
  ## Enables NFC reader mode
  ## API 26+: Uses NfcAdapter.enableReaderMode
  ## Requires NFC permission
  
proc disableReaderMode*(m: NFCManager, activity: Activity): bool
  ## Disables NFC reader mode
  ## API 26+: Uses NfcAdapter.disableReaderMode

# Tag writing
proc writeNdefMessage*(m: NFCManager, tag: NFCTag, message: NdefMessage): bool
  ## Writes NDEF message to tag
  ## API 26+: Uses Ndef.writeNdefMessage
  ## Requires NFC permission
  
proc makeReadOnly*(m: NFCManager, tag: NFCTag): bool
  ## Makes NDEF tag read-only
  ## API 26+: Uses Ndef.makeReadOnly
  ## Requires NFC permission
  
proc format*(m: NFCManager, tag: NFCTag): bool
  ## Formats tag to NDEF
  ## API 26+: Uses NdefFormatable.format
  ## Requires NFC permission

# NDEF operations
proc createTextRecord*(m: NFCManager, text: string, language: string = "en"): NdefRecord
  ## Creates NDEF text record
  ## API 26+: Uses NdefRecord.createTextRecord
  
proc createUriRecord*(m: NFCManager, uri: string): NdefRecord
  ## Creates NDEF URI record
  ## API 26+: Uses NdefRecord.createUri
  
proc createMimeRecord*(m: NFCManager, mimeType: string, data: seq[byte]): NdefRecord
  ## Creates NDEF MIME record
  ## API 26+: Uses NdefRecord.createMime
  
proc createExternalRecord*(m: NFCManager, domain: string, type: string, data: seq[byte]): NdefRecord
  ## Creates NDEF external record
  ## API 26+: Uses NdefRecord.createExternal
  
proc createNdefMessage*(m: NFCManager, records: varargs[NdefRecord]): NdefMessage
  ## Creates NDEF message
  ## API 26+: Uses NdefMessage constructor