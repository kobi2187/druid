import jnim

jclass android.view.PixelCopy* of JVMObject:
  proc request*(source: SurfaceView, dest: Bitmap, listener: OnPixelCopyFinishedListener, listenerThread: Handler) {.`static`.}
  proc request*(source: SurfaceView, srcRect: Rect, dest: Bitmap, listener: OnPixelCopyFinishedListener, listenerThread: Handler) {.`static`.}
  proc request*(source: Surface, dest: Bitmap, listener: OnPixelCopyFinishedListener, listenerThread: Handler) {.`static`.}
  proc request*(source: Surface, srcRect: Rect, dest: Bitmap, listener: OnPixelCopyFinishedListener, listenerThread: Handler) {.`static`.}
  proc request*(source: Window, dest: Bitmap, listener: OnPixelCopyFinishedListener, listenerThread: Handler) {.`static`.}
  proc request*(source: Window, srcRect: Rect, dest: Bitmap, listener: OnPixelCopyFinishedListener, listenerThread: Handler) {.`static`.}
  proc request*(request: Request, callbackExecutor: Executor, listener: Consumer[Result]) {.`static`.}
  SUCCESS*: jint {.`static`.}
  ERROR_UNKNOWN*: jint {.`static`.}
  ERROR_TIMEOUT*: jint {.`static`.}
  ERROR_SOURCE_NO_DATA*: jint {.`static`.}
  ERROR_SOURCE_INVALID*: jint {.`static`.}
  ERROR_DESTINATION_INVALID*: jint {.`static`.}

jclass android.view.PixelCopy.Result* of JVMObject:
  proc getStatus*(): jint
  proc getBitmap*(): Bitmap

jclass android.view.PixelCopy.Request* of JVMObject:
  proc getDestinationBitmap*(): Bitmap
  proc getSourceRect*(): Rect
  proc request*(callbackExecutor: Executor, listener: Consumer[Result])


jclass android.view.Result* of JVMObject:
  proc getStatus*(): jint
  proc getBitmap*(): Bitmap

jclass android.view.Request* of JVMObject:
  proc getDestinationBitmap*(): Bitmap
  proc getSourceRect*(): Rect
  proc request*(callbackExecutor: Executor, listener: Consumer[Result])

jclass android.view.Request.Builder* of JVMObject:
  proc ofWindow*(source: Window): Builder {.`static`.}
  proc ofWindow*(source: View): Builder {.`static`.}
  proc ofSurface*(source: Surface): Builder {.`static`.}
  proc ofSurface*(source: SurfaceView): Builder {.`static`.}
  proc setSourceRect*(srcRect: Rect): Builder
  proc setDestinationBitmap*(destination: Bitmap): Builder
  proc build*(): Request

jclass android.view.Builder* of JVMObject:
  proc ofWindow*(source: Window): Builder {.`static`.}
  proc ofWindow*(source: View): Builder {.`static`.}
  proc ofSurface*(source: Surface): Builder {.`static`.}
  proc ofSurface*(source: SurfaceView): Builder {.`static`.}
  proc setSourceRect*(srcRect: Rect): Builder
  proc setDestinationBitmap*(destination: Bitmap): Builder
  proc build*(): Request

