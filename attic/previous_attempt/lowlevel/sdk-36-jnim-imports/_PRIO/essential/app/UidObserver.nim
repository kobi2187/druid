import jnim

jclass android.app.UidObserver* of Stub:
  proc onUidActive*(uid: jint)
  proc onUidCachedChanged*(uid: jint, cached: jboolean)
  proc onUidGone*(uid: jint, disabled: jboolean)
  proc onUidIdle*(uid: jint, disabled: jboolean)
  proc onUidProcAdjChanged*(uid: jint, adj: jint)
  proc onUidStateChanged*(uid: jint, procState: jint, procStateSeq: jlong, capability: jint)

