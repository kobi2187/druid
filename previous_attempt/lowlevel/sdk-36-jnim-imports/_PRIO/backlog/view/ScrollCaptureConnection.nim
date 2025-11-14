import jnim

jclass android.view.ScrollCaptureConnection* of Stub:
  proc startCapture*(surface: Surface, remote: IScrollCaptureCallbacks): ICancellationSignal
  proc requestImage*(requestRect: Rect): ICancellationSignal
  proc endCapture*(): ICancellationSignal
  proc binderDied*()
  proc close*()
  proc isConnected*(): jboolean
  proc isActive*(): jboolean
  proc toString*(): string

