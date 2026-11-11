import jnim

jclass android.federatedcompute.ExampleStoreService* of Service:
  proc onCreate*()
  proc onBind*(intent: Intent): IBinder
  proc startQuery*(params: Bundle, callback: QueryCallback)

