import jnim

jclass android.app.AppCompatCallbacks* of JVMObject:
  proc install*(disabledChanges: seq[jlong], loggableChanges: seq[jlong]) {.`static`.}
  proc onChangeReported*(changeId: jlong)
  proc isChangeEnabled*(changeId: jlong): jboolean

