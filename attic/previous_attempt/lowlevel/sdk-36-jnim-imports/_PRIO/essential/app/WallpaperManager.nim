import jnim

jclass android.app.WallpaperManager* of JVMObject:
  proc getOrientation*(screenSize: Point): jint {.`static`.}
  proc getRotatedOrientation*(orientation: jint): jint {.`static`.}
  proc getInstance*(context: Context): WallpaperManager {.`static`.}
  proc getIWallpaperManager*(): IWallpaperManager
  proc isLockscreenLiveWallpaperEnabled*(): jboolean
  proc isMultiCropEnabled*(): jboolean {.`static`.}
  proc shouldEnableWideColorGamut*(): jboolean
  proc getDrawable*(): Drawable
  proc getDrawable*(which: jint): Drawable
  proc getBuiltInDrawable*(): Drawable
  proc getBuiltInDrawable*(which: jint): Drawable
  proc getBuiltInDrawable*(outWidth: jint, outHeight: jint, scaleToFit: jboolean, horizontalAlignment: jfloat, verticalAlignment: jfloat): Drawable
  proc getBuiltInDrawable*(outWidth: jint, outHeight: jint, scaleToFit: jboolean, horizontalAlignment: jfloat, verticalAlignment: jfloat, which: jint): Drawable
  proc peekDrawable*(): Drawable
  proc peekDrawable*(which: jint): Drawable
  proc getFastDrawable*(): Drawable
  proc getFastDrawable*(which: jint): Drawable
  proc peekFastDrawable*(): Drawable
  proc peekFastDrawable*(which: jint): Drawable
  proc wallpaperSupportsWcg*(which: jint): jboolean
  proc getBitmap*(): Bitmap
  proc getBitmap*(hardware: jboolean): Bitmap
  proc getBitmap*(hardware: jboolean, which: jint): Bitmap
  proc getBitmapAsUser*(userId: jint, hardware: jboolean): Bitmap
  proc getBitmapAsUser*(userId: jint, hardware: jboolean, which: jint): Bitmap
  proc getBitmapAsUser*(userId: jint, hardware: jboolean, which: jint, returnDefault: jboolean): Bitmap
  proc peekBitmapDimensions*(): Rect
  proc peekBitmapDimensions*(which: jint): Rect
  proc peekBitmapDimensions*(which: jint, returnDefault: jboolean): Rect
  proc peekBitmapDimensionsAsUser*(which: jint, returnDefault: jboolean, userId: jint): Rect
  proc getBitmapCrops*(displaySizes: List[Point], which: jint, originalBitmap: jboolean): List[Rect]
  proc getBitmapCrops*(bitmapSize: Point, displaySizes: List[Point], cropHints: Map[Point, Rect]): List[Rect]
  proc getWallpaperColors*(bitmap: Bitmap, cropHints: Map[Point, Rect]): WallpaperColors
  proc getWallpaperFile*(which: jint): ParcelFileDescriptor
  proc addOnColorsChangedListener*(listener: OnColorsChangedListener, handler: Handler)
  proc addOnColorsChangedListener*(listener: OnColorsChangedListener, handler: Handler, userId: jint)
  proc removeOnColorsChangedListener*(callback: OnColorsChangedListener)
  proc removeOnColorsChangedListener*(callback: OnColorsChangedListener, userId: jint)
  proc getWallpaperColors*(which: jint): WallpaperColors
  proc getWallpaperColors*(which: jint, userId: jint): WallpaperColors
  proc addOnColorsChangedListener*(callback: LocalWallpaperColorConsumer, regions: List[RectF], which: jint)
  proc removeOnColorsChangedListener*(callback: LocalWallpaperColorConsumer)
  proc getWallpaperFile*(which: jint, userId: jint): ParcelFileDescriptor
  proc getWallpaperFile*(which: jint, getCropped: jboolean): ParcelFileDescriptor
  proc forgetLoadedWallpaper*()
  proc getWallpaperInfo*(): WallpaperInfo
  proc getWallpaperInfoForUser*(userId: jint): WallpaperInfo
  proc getWallpaperInfo*(which: jint): WallpaperInfo
  proc getWallpaperInfo*(which: jint, userId: jint): WallpaperInfo
  proc getWallpaperInstance*(which: jint): WallpaperInstance
  proc getWallpaperInfoFile*(): ParcelFileDescriptor
  proc getWallpaperId*(which: jint): jint
  proc getWallpaperIdForUser*(which: jint, userId: jint): jint
  proc getCropAndSetWallpaperIntent*(imageUri: Uri): Intent
  proc setResource*(resid: jint)
  proc setResource*(resid: jint, which: jint): jint
  proc setBitmap*(bitmap: Bitmap)
  proc setBitmap*(fullImage: Bitmap, visibleCropHint: Rect, allowBackup: jboolean): jint
  proc setBitmap*(fullImage: Bitmap, visibleCropHint: Rect, allowBackup: jboolean, which: jint): jint
  proc setBitmap*(fullImage: Bitmap, visibleCropHint: Rect, allowBackup: jboolean, which: jint, userId: jint): jint
  proc setBitmapWithCrops*(fullImage: Bitmap, cropHints: Map[Point, Rect], allowBackup: jboolean, which: jint): jint
  proc setBitmapWithDescription*(fullImage: Bitmap, description: WallpaperDescription, allowBackup: jboolean, which: jint): jint
  proc setStream*(bitmapData: InputStream)
  proc setStream*(bitmapData: InputStream, visibleCropHint: Rect, allowBackup: jboolean): jint
  proc setStream*(bitmapData: InputStream, visibleCropHint: Rect, allowBackup: jboolean, which: jint): jint
  proc setStreamWithCrops*(bitmapData: InputStream, cropHints: Map[Point, Rect], allowBackup: jboolean, which: jint): jint
  proc setStreamWithCrops*(bitmapData: InputStream, cropHints: SparseArray[Rect], allowBackup: jboolean, which: jint): jint
  proc setStreamWithDescription*(bitmapData: InputStream, description: WallpaperDescription, allowBackup: jboolean, which: jint): jint
  proc hasResourceWallpaper*(resid: jint): jboolean
  proc getDesiredMinimumWidth*(): jint
  proc getDesiredMinimumHeight*(): jint
  proc suggestDesiredDimensions*(minimumWidth: jint, minimumHeight: jint)
  proc setDisplayPadding*(padding: Rect)
  proc setDisplayOffset*(windowToken: IBinder, x: jint, y: jint)
  proc clearWallpaper*()
  proc clearWallpaper*(which: jint, userId: jint)
  proc setWallpaperComponent*(name: ComponentName): jboolean
  proc setWallpaperDimAmount*(dimAmount: jfloat)
  proc getWallpaperDimAmount*(): jfloat
  proc lockScreenWallpaperExists*(): jboolean
  proc setWallpaperComponent*(name: ComponentName, userId: jint): jboolean
  proc setWallpaperComponentWithFlags*(name: ComponentName, which: jint): jboolean
  proc setWallpaperComponentWithFlags*(name: ComponentName, which: jint, userId: jint): jboolean
  proc setWallpaperComponentWithDescription*(description: WallpaperDescription, which: jint): jboolean
  proc setWallpaperComponentWithDescription*(description: WallpaperDescription, which: jint, userId: jint): jboolean
  proc setWallpaperOffsets*(windowToken: IBinder, xOffset: jfloat, yOffset: jfloat)
  proc setWallpaperOffsetSteps*(xStep: jfloat, yStep: jfloat)
  proc sendWallpaperCommand*(windowToken: IBinder, action: string, x: jint, y: jint, z: jint, extras: Bundle)
  proc setWallpaperZoomOut*(windowToken: IBinder, zoom: jfloat)
  proc isWallpaperSupported*(): jboolean
  proc isSetWallpaperAllowed*(): jboolean
  proc clearWallpaperOffsets*(windowToken: IBinder)
  proc clear*()
  proc clear*(which: jint)
  proc openDefaultWallpaper*(context: Context, which: jint): InputStream {.`static`.}
  proc getDefaultWallpaperComponent*(context: Context): ComponentName {.`static`.}
  proc getCmfDefaultWallpaperComponent*(context: Context): ComponentName {.`static`.}
  proc isWallpaperBackupEligible*(which: jint): jboolean
  proc getColorManagementProxy*(): ColorManagementProxy
  ACTION_CROP_AND_SET_WALLPAPER*: string {.`static`.}
  ACTION_LIVE_WALLPAPER_CHOOSER*: string {.`static`.}
  ACTION_CHANGE_LIVE_WALLPAPER*: string {.`static`.}
  EXTRA_LIVE_WALLPAPER_COMPONENT*: string {.`static`.}
  WALLPAPER_PREVIEW_META_DATA*: string {.`static`.}
  COMMAND_TAP*: string {.`static`.}
  COMMAND_SECONDARY_TAP*: string {.`static`.}
  COMMAND_DROP*: string {.`static`.}
  COMMAND_WAKING_UP*: string {.`static`.}
  COMMAND_KEYGUARD_GOING_AWAY*: string {.`static`.}
  COMMAND_KEYGUARD_APPEARING*: string {.`static`.}
  COMMAND_GOING_TO_SLEEP*: string {.`static`.}
  COMMAND_REAPPLY*: string {.`static`.}
  COMMAND_FREEZE*: string {.`static`.}
  COMMAND_UNFREEZE*: string {.`static`.}
  COMMAND_LOCKSCREEN_LAYOUT_CHANGED*: string {.`static`.}
  COMMAND_LOCKSCREEN_TAP*: string {.`static`.}
  EXTRA_NEW_WALLPAPER_ID*: string {.`static`.}
  EXTRA_FROM_FOREGROUND_APP*: string {.`static`.}
  EXTRA_WHICH_WALLPAPER_CHANGED*: string {.`static`.}
  ORIENTATION_UNKNOWN*: jint {.`static`.}
  ORIENTATION_PORTRAIT*: jint {.`static`.}
  ORIENTATION_LANDSCAPE*: jint {.`static`.}
  ORIENTATION_SQUARE_PORTRAIT*: jint {.`static`.}
  ORIENTATION_SQUARE_LANDSCAPE*: jint {.`static`.}
  FLAG_SYSTEM*: jint {.`static`.}
  FLAG_LOCK*: jint {.`static`.}

jclass android.app.WallpaperManager.ColorManagementProxy* of JVMObject:
  proc getSupportedColorSpaces*(): Set[ColorSpace]

jclass android.app.ColorManagementProxy* of JVMObject:
  proc getSupportedColorSpaces*(): Set[ColorSpace]


