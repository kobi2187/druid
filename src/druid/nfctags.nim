## Reading NFC tags while the app is in front: stickers, cards, NDEF tags with
## a link or text.
##
## ```nim
## if nfc().isSupported and nfc().startReading():
##   for ev in pollEvents():
##     if ev.kind == ekNfc:
##       echo ev.nfc.id, " ", ev.nfc.techs
##       for r in ev.nfc.records:
##         if r.kind == "uri": echo "link ", r.value
## nfc().stopReading()
## ```
##
## While reading, the system's own handling of tags (opening their links) is
## off. Reading needs the app's Activity in front: start it when the screen
## that reads shows, stop it when it goes. No permission is asked of the user
## (android.permission.NFC is granted at install; the app declares it).
##
## On the desktop: tags from `simulator().tapNfcTag`.

import bridge, simulator, hardware

proc startReading*(n: Nfc): bool {.discardable.} =
  ## Starts reading; false when NFC is switched off (`nfc().openSettings`).
  ## Raises DruidError when the device has no NFC.
  if druidStarted(): return callStatic(bool, "NfcReader", "start")
  if not n.isSupported:
    raise newException(DruidError, "NfcReader (simulated): java.lang.IllegalStateException: this device has no NFC")
  if not n.isEnabled: return false
  simNfcReading() = true
  true

proc stopReading*(_: Nfc) =
  if druidStarted(): callStatic(void, "NfcReader", "stop") else: simNfcReading() = false

proc isReading*(_: Nfc): bool = bridged(simNfcReading()): callStatic(bool, "NfcReader", "isReading")
