import jnim

jclass android.media.AsyncPlayer* of JVMObject:
  proc play*(context: Context, uri: Uri, looping: jboolean, stream: jint)
  proc play*(context: Context, uri: Uri, looping: jboolean, attributes: AudioAttributes)
  proc stop*()
  proc setUsesWakeLock*(context: Context)

