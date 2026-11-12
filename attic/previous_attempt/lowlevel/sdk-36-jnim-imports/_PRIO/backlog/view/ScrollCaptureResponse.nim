import jnim

jclass android.view.ScrollCaptureResponse* of JVMObject:
  proc isConnected*(): jboolean
  proc close*()
  proc getDescription*(): string
  proc getConnection*(): IScrollCaptureConnection
  proc getWindowBounds*(): Rect
  proc getBoundsInWindow*(): Rect
  proc getWindowTitle*(): string
  proc getPackageName*(): string
  proc getMessages*(): ArrayList[string]
  proc toString*(): string
  proc writeToParcel*(dest: android.os.Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[ScrollCaptureResponse] {.`static`.}

jclass android.view.ScrollCaptureResponse.Builder* of JVMObject:
  proc setDescription*(value: string): Builder
  proc setConnection*(value: IScrollCaptureConnection): Builder
  proc setWindowBounds*(value: Rect): Builder
  proc setBoundsInWindow*(value: Rect): Builder
  proc setWindowTitle*(value: string): Builder
  proc setPackageName*(value: string): Builder
  proc setMessages*(value: ArrayList[string]): Builder
  proc addMessage*(value: string): Builder
  proc build*(): ScrollCaptureResponse

jclass android.view.Builder* of JVMObject:
  proc setDescription*(value: string): Builder
  proc setConnection*(value: IScrollCaptureConnection): Builder
  proc setWindowBounds*(value: Rect): Builder
  proc setBoundsInWindow*(value: Rect): Builder
  proc setWindowTitle*(value: string): Builder
  proc setPackageName*(value: string): Builder
  proc setMessages*(value: ArrayList[string]): Builder
  proc addMessage*(value: string): Builder
  proc build*(): ScrollCaptureResponse

