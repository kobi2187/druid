import jnim

jclass android.graphics.FontFamily* of JVMObject:
  proc freeze*(): jboolean
  proc abortCreation*()
  proc addFont*(path: string, ttcIndex: jint, axes: seq[FontVariationAxis], weight: jint, italic: jint): jboolean
  proc addFontFromBuffer*(font: ByteBuffer, ttcIndex: jint, axes: seq[FontVariationAxis], weight: jint, italic: jint): jboolean
  proc addFontFromAssetManager*(mgr: AssetManager, path: string, cookie: jint, isAsset: jboolean, ttcIndex: jint, weight: jint, isItalic: jint, axes: seq[FontVariationAxis]): jboolean
  mNativePtr*: jlong

