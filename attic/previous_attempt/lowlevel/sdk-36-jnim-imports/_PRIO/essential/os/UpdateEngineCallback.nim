import jnim

jclass android.os.UpdateEngineCallback* of JVMObject:
  proc onStatusUpdate*(status: jint, percent: jfloat)
  proc onPayloadApplicationComplete*(errorCode: jint)

