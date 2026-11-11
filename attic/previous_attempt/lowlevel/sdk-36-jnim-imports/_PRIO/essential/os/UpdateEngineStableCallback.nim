import jnim

jclass android.os.UpdateEngineStableCallback* of JVMObject:
  proc onStatusUpdate*(status: jint, percent: jfloat)
  proc onPayloadApplicationComplete*(errorCode: jint)

