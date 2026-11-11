import jnim

jclass android.graphics.Movie* of JVMObject:
  proc width*(): jint
  proc height*(): jint
  proc isOpaque*(): jboolean
  proc duration*(): jint
  proc setTime*(relativeMilliseconds: jint): jboolean
  proc draw*(canvas: Canvas, x: jfloat, y: jfloat, paint: Paint)
  proc draw*(canvas: Canvas, x: jfloat, y: jfloat)
  proc decodeStream*(is: InputStream): Movie {.`static`.}
  proc decodeByteArray*(data: seq[jbyte], offset: jint, length: jint): Movie {.`static`.}
  proc decodeFile*(pathName: string): Movie {.`static`.}

