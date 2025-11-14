import jnim

jclass android.federatedcompute.ResultHandlingService* of Service:
  proc onCreate*()
  proc onBind*(intent: Intent): IBinder
  proc handleResult*(params: Bundle, callback: Consumer[Integer])

