import jnim

jclass android.app.SharedElementCallback* of JVMObject:
  proc onSharedElementStart*(sharedElementNames: List[string], sharedElements: List[View], sharedElementSnapshots: List[View])
  proc onSharedElementEnd*(sharedElementNames: List[string], sharedElements: List[View], sharedElementSnapshots: List[View])
  proc onRejectSharedElements*(rejectedSharedElements: List[View])
  proc onMapSharedElements*(names: List[string], sharedElements: Map[string, View])
  proc onCaptureSharedElementSnapshot*(sharedElement: View, viewToGlobalMatrix: Matrix, screenBounds: RectF): Parcelable
  proc onCreateSnapshotView*(context: Context, snapshot: Parcelable): View
  proc onSharedElementsArrived*(sharedElementNames: List[string], sharedElements: List[View], listener: OnSharedElementsReadyListener)

