import jnim

jclass android.os.HwBlob* of JVMObject:
  proc getBool*(offset: jlong): jboolean
  proc getInt8*(offset: jlong): jbyte
  proc getInt16*(offset: jlong): jshort
  proc getInt32*(offset: jlong): jint
  proc getInt64*(offset: jlong): jlong
  proc getFloat*(offset: jlong): jfloat
  proc getDouble*(offset: jlong): jdouble
  proc getString*(offset: jlong): string
  proc getFieldHandle*(offset: jlong): jlong
  proc copyToBoolArray*(offset: jlong, array: seq[jboolean], size: jint)
  proc copyToInt8Array*(offset: jlong, array: seq[jbyte], size: jint)
  proc copyToInt16Array*(offset: jlong, array: seq[jshort], size: jint)
  proc copyToInt32Array*(offset: jlong, array: seq[jint], size: jint)
  proc copyToInt64Array*(offset: jlong, array: seq[jlong], size: jint)
  proc copyToFloatArray*(offset: jlong, array: seq[jfloat], size: jint)
  proc copyToDoubleArray*(offset: jlong, array: seq[jdouble], size: jint)
  proc putBool*(offset: jlong, x: jboolean)
  proc putInt8*(offset: jlong, x: jbyte)
  proc putInt16*(offset: jlong, x: jshort)
  proc putInt32*(offset: jlong, x: jint)
  proc putInt64*(offset: jlong, x: jlong)
  proc putFloat*(offset: jlong, x: jfloat)
  proc putDouble*(offset: jlong, x: jdouble)
  proc putString*(offset: jlong, x: string)
  proc putNativeHandle*(offset: jlong, x: NativeHandle)
  proc putBoolArray*(offset: jlong, x: seq[jboolean])
  proc putInt8Array*(offset: jlong, x: seq[jbyte])
  proc putInt16Array*(offset: jlong, x: seq[jshort])
  proc putInt32Array*(offset: jlong, x: seq[jint])
  proc putInt64Array*(offset: jlong, x: seq[jlong])
  proc putFloatArray*(offset: jlong, x: seq[jfloat])
  proc putDoubleArray*(offset: jlong, x: seq[jdouble])
  proc putBlob*(offset: jlong, blob: HwBlob)
  proc putHidlMemory*(offset: jlong, mem: HidlMemory)
  proc handle*(): jlong
  proc wrapArray*(array: seq[jboolean]): seq[Boolean] {.`static`.}
  proc wrapArray*(array: seq[jlong]): seq[Long] {.`static`.}
  proc wrapArray*(array: seq[jbyte]): seq[Byte] {.`static`.}
  proc wrapArray*(array: seq[jshort]): seq[Short] {.`static`.}
  proc wrapArray*(array: seq[jint]): seq[Integer] {.`static`.}
  proc wrapArray*(array: seq[jfloat]): seq[Float] {.`static`.}
  proc wrapArray*(array: seq[jdouble]): seq[Double] {.`static`.}

