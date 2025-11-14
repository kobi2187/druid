import jnim

jclass android.telephony.MmsManager* of JVMObject:
  proc sendMultimediaMessage*(subId: jint, contentUri: Uri, locationUrl: string, configOverrides: Bundle, sentIntent: PendingIntent, messageId: jlong)
  proc downloadMultimediaMessage*(subId: jint, locationUrl: string, contentUri: Uri, configOverrides: Bundle, downloadedIntent: PendingIntent, messageId: jlong)

