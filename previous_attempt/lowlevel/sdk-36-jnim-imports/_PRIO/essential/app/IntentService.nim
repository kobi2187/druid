import jnim

jclass android.app.IntentService* of Service:
  proc setIntentRedelivery*(enabled: jboolean)
  proc onCreate*()
  proc onStart*(intent: Intent, startId: jint)
  proc onStartCommand*(intent: Intent, flags: jint, startId: jint): jint
  proc onDestroy*()
  proc onBind*(intent: Intent): IBinder

