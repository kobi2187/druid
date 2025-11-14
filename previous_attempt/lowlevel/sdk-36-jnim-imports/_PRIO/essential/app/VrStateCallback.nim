import jnim

jclass android.app.VrStateCallback* of JVMObject:
  proc onPersistentVrStateChanged*(enabled: jboolean)
  proc onVrStateChanged*(enabled: jboolean)

