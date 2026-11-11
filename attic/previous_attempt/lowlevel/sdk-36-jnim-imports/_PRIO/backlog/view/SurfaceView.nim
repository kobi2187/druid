import jnim

jclass android.view.SurfaceView* of View:
  proc getHolder*(): SurfaceHolder
  proc setVisibility*(visibility: jint)
  proc setUseAlpha*()
  proc setAlpha*(alpha: jfloat)
  proc gatherTransparentRegion*(region: Region): jboolean
  proc draw*(canvas: Canvas)
  proc setEnableSurfaceClipping*(enabled: jboolean)
  proc setClipBounds*(clipBounds: Rect)
  proc hasOverlappingRendering*(): jboolean
  proc setCornerRadius*(cornerRadius: jfloat)
  proc getCornerRadius*(): jfloat
  proc setCompositionOrder*(compositionOrder: jint)
  proc getCompositionOrder*(): jint
  proc setZOrderMediaOverlay*(isMediaOverlay: jboolean)
  proc setZOrderOnTop*(onTop: jboolean)
  proc isZOrderedOnTop*(): jboolean
  proc setZOrderedOnTop*(onTop: jboolean, allowDynamicChange: jboolean): jboolean
  proc setSecure*(isSecure: jboolean)
  proc setSurfaceLifecycle*(lifecycleStrategy: jint)
  proc setDesiredHdrHeadroom*(desiredHeadroom: jfloat)
  proc getName*(): string
  proc vriDrawStarted*(isWmSync: jboolean)
  proc requestUpdateSurfacePositionAndScale*()
  proc getSurfaceRenderPosition*(): Rect
  proc isFixedSize*(): jboolean
  proc setResizeBackgroundColor*(bgColor: jint)
  proc setResizeBackgroundColor*(t: SurfaceControl.Transaction, bgColor: jint)
  proc getSurfaceControl*(): SurfaceControl
  proc getHostToken*(): IBinder
  proc surfaceCreated*(t: SurfaceControl.Transaction)
  proc surfaceDestroyed*()
  proc surfaceReplaced*(t: Transaction)
  proc setChildSurfacePackage*(p: SurfaceControlViewHost.SurfacePackage)
  proc getChildSurfacePackage*(): SurfaceControlViewHost.SurfacePackage
  proc clearChildSurfacePackage*()
  proc onInitializeAccessibilityNodeInfoInternal*(info: AccessibilityNodeInfo)
  proc getImportantForAccessibility*(): jint
  proc syncNextFrame*(t: Consumer[Transaction])
  proc applyTransactionToFrame*(transaction: SurfaceControl.Transaction)
  proc getAccessibilityClassName*(): CharSequence
  SURFACE_LIFECYCLE_DEFAULT*: jint {.`static`.}
  SURFACE_LIFECYCLE_FOLLOWS_VISIBILITY*: jint {.`static`.}
  SURFACE_LIFECYCLE_FOLLOWS_ATTACHMENT*: jint {.`static`.}

