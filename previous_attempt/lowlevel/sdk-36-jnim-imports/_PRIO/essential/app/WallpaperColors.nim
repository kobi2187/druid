import jnim

jclass android.app.WallpaperColors* of JVMObject:
  proc fromDrawable*(drawable: Drawable): WallpaperColors {.`static`.}
  proc fromBitmap*(bitmap: Bitmap): WallpaperColors {.`static`.}
  proc fromBitmap*(bitmap: Bitmap, dimAmount: jfloat): WallpaperColors {.`static`.}
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getPrimaryColor*(): Color
  proc getSecondaryColor*(): Color
  proc getTertiaryColor*(): Color
  proc getMainColors*(): List[Color]
  proc getAllColors*(): Map[Integer, Integer]
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc getColorHints*(): jint
  proc toString*(): string
  HINT_SUPPORTS_DARK_TEXT*: jint {.`static`.}
  HINT_SUPPORTS_DARK_THEME*: jint {.`static`.}
  HINT_FROM_BITMAP*: jint {.`static`.}
  CREATOR*: Creator[WallpaperColors] {.`static`.}

