import jnim

jclass android.view.WindowlessWindowManager* of JVMObject:
  proc setConfiguration*(configuration: Configuration)
  proc addToDisplay*(window: IWindow, attrs: WindowManager.LayoutParams, viewVisibility: jint, displayId: jint, requestedVisibleTypes: jint, outInputChannel: InputChannel, outInsetsState: InsetsState, outActiveControls: InsetsSourceControl.Array, outAttachedFrame: Rect, outSizeCompatScale: seq[jfloat]): jint
  proc addToDisplayAsUser*(window: IWindow, attrs: WindowManager.LayoutParams, viewVisibility: jint, displayId: jint, userId: jint, requestedVisibleTypes: jint, outInputChannel: InputChannel, outInsetsState: InsetsState, outActiveControls: InsetsSourceControl.Array, outAttachedFrame: Rect, outSizeCompatScale: seq[jfloat]): jint
  proc addToDisplayWithoutInputChannel*(window: android.view.IWindow, attrs: android.view.WindowManager.LayoutParams, viewVisibility: jint, layerStackId: jint, insetsState: android.view.InsetsState, outAttachedFrame: Rect, outSizeCompatScale: seq[jfloat]): jint
  proc remove*(clientToken: IBinder)
  proc relayout*(window: IWindow, inAttrs: WindowManager.LayoutParams, requestedWidth: jint, requestedHeight: jint, viewFlags: jint, flags: jint, seq: jint, lastSyncSeqId: jint, outRelayoutResult: WindowRelayoutResult): jint
  proc relayoutAsync*(window: IWindow, inAttrs: WindowManager.LayoutParams, requestedWidth: jint, requestedHeight: jint, viewFlags: jint, flags: jint, seq: jint, lastSyncSeqId: jint)
  proc outOfMemory*(window: android.view.IWindow): jboolean
  proc setInsets*(window: android.view.IWindow, touchableInsets: jint, contentInsets: android.graphics.Rect, visibleInsets: android.graphics.Rect, touchableRegion: android.graphics.Region)
  proc clearTouchableRegion*(window: android.view.IWindow)
  proc finishDrawing*(window: android.view.IWindow, postDrawTransaction: android.view.SurfaceControl.Transaction, seqId: jint)
  proc performDrag*(window: android.view.IWindow, flags: jint, surface: android.view.SurfaceControl, touchSource: jint, touchDeviceId: jint, touchPointerId: jint, touchX: jfloat, touchY: jfloat, thumbCenterX: jfloat, thumbCenterY: jfloat, data: android.content.ClipData): android.os.IBinder
  proc reportDropResult*(window: android.view.IWindow, consumed: jboolean)
  proc cancelDragAndDrop*(dragToken: android.os.IBinder, skipAnimation: jboolean)
  proc dragRecipientEntered*(window: android.view.IWindow)
  proc dragRecipientExited*(window: android.view.IWindow)
  proc setWallpaperPosition*(windowToken: android.os.IBinder, x: jfloat, y: jfloat, xstep: jfloat, ystep: jfloat)
  proc setWallpaperZoomOut*(windowToken: android.os.IBinder, zoom: jfloat)
  proc setShouldZoomOutWallpaper*(windowToken: android.os.IBinder, shouldZoom: jboolean)
  proc wallpaperOffsetsComplete*(window: android.os.IBinder)
  proc setWallpaperDisplayOffset*(windowToken: android.os.IBinder, x: jint, y: jint)
  proc sendWallpaperCommand*(window: android.os.IBinder, action: string, x: jint, y: jint, z: jint, extras: android.os.Bundle, sync: jboolean)
  proc wallpaperCommandComplete*(window: android.os.IBinder, result: android.os.Bundle)
  proc onRectangleOnScreenRequested*(token: android.os.IBinder, rectangle: android.graphics.Rect)
  proc getWindowId*(window: android.os.IBinder): android.view.IWindowId
  proc pokeDrawLock*(window: android.os.IBinder)
  proc startMovingTask*(window: android.view.IWindow, startX: jfloat, startY: jfloat): jboolean
  proc finishMovingTask*(window: android.view.IWindow)
  proc updateTapExcludeRegion*(window: android.view.IWindow, region: android.graphics.Region)
  proc updateRequestedVisibleTypes*(window: IWindow, requestedVisibleTypes: jint, imeStatsToken: ImeTracker.Token)
  proc updateAnimatingTypes*(window: IWindow, animatingTypes: jint, statsToken: ImeTracker.Token)
  proc reportSystemGestureExclusionChanged*(window: android.view.IWindow, exclusionRects: List[Rect])
  proc reportDecorViewGestureInterceptionChanged*(window: IWindow, intercepted: jboolean)
  proc reportKeepClearAreasChanged*(window: android.view.IWindow, restrictedRects: List[Rect], unrestrictedRects: List[Rect])
  proc grantInputChannel*(displayId: jint, surface: SurfaceControl, clientToken: IBinder, hostInputToken: InputTransferToken, flags: jint, privateFlags: jint, inputFeatures: jint, type: jint, windowToken: IBinder, embeddedInputTransferToken: InputTransferToken, inputHandleName: string, outInputChannel: InputChannel)
  proc updateInputChannel*(channelToken: IBinder, hostInputToken: InputTransferToken, displayId: jint, surface: SurfaceControl, flags: jint, privateFlags: jint, inputFeatures: jint, region: Region)
  proc asBinder*(): android.os.IBinder
  proc grantEmbeddedWindowFocus*(callingWindow: IWindow, targetInputToken: InputTransferToken, grantFocus: jboolean)
  proc generateDisplayHash*(window: IWindow, boundsInWindow: Rect, hashAlgorithm: string, callback: RemoteCallback)
  proc setOnBackInvokedCallbackInfo*(iWindow: IWindow, callbackInfo: OnBackInvokedCallbackInfo)
  proc dropForAccessibility*(window: IWindow, x: jint, y: jint): jboolean
  proc setInsetsState*(state: InsetsState)
  proc cancelDraw*(window: IWindow): jboolean
  proc moveFocusToAdjacentWindow*(fromWindow: IWindow, direction: jint): jboolean
  proc notifyImeWindowVisibilityChangedFromClient*(window: IWindow, visible: jboolean, statsToken: ImeTracker.Token)

jclass android.view.WindowlessWindowManager.ResizeCompleteCallback* of JVMObject:
  proc finished*(completion: SurfaceControl.Transaction)

jclass android.view.ResizeCompleteCallback* of JVMObject:
  proc finished*(completion: SurfaceControl.Transaction)

