import jnim

jclass android.graphics.BitmapFactory* of JVMObject:
  proc decodeFile*(pathName: string, opts: Options): Bitmap {.`static`.}
  proc decodeFile*(pathName: string): Bitmap {.`static`.}
  proc decodeResourceStream*(res: Resources, value: TypedValue, is: InputStream, pad: Rect, opts: Options): Bitmap {.`static`.}
  proc decodeResource*(res: Resources, id: jint, opts: Options): Bitmap {.`static`.}
  proc decodeResource*(res: Resources, id: jint): Bitmap {.`static`.}
  proc decodeByteArray*(data: seq[jbyte], offset: jint, length: jint, opts: Options): Bitmap {.`static`.}
  proc decodeByteArray*(data: seq[jbyte], offset: jint, length: jint): Bitmap {.`static`.}
  proc decodeStream*(is: InputStream, outPadding: Rect, opts: Options): Bitmap {.`static`.}
  proc decodeStream*(is: InputStream): Bitmap {.`static`.}
  proc decodeFileDescriptor*(fd: FileDescriptor, outPadding: Rect, opts: Options): Bitmap {.`static`.}
  proc decodeFileDescriptor*(fd: FileDescriptor): Bitmap {.`static`.}

jclass android.graphics.BitmapFactory.Options* of JVMObject:
  proc requestCancelDecode*()

jclass android.graphics.Options* of JVMObject:
  proc requestCancelDecode*()
  inBitmap*: Bitmap
  inMutable*: jboolean
  inJustDecodeBounds*: jboolean
  inSampleSize*: jint
  inPreferredConfig*: Bitmap.Config
  inPreferredColorSpace*: ColorSpace
  inPremultiplied*: jboolean
  inDither*: jboolean
  inDensity*: jint
  inTargetDensity*: jint
  inScreenDensity*: jint
  inScaled*: jboolean
  inPurgeable*: jboolean
  inInputShareable*: jboolean
  inPreferQualityOverSpeed*: jboolean
  outWidth*: jint
  outHeight*: jint
  outMimeType*: string
  outConfig*: Bitmap.Config
  outColorSpace*: ColorSpace
  inTempStorage*: jbyte
  mCancel*: jboolean

