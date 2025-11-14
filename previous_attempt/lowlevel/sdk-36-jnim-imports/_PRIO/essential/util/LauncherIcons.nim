import jnim

jclass android.util.LauncherIcons* of JVMObject:
  proc wrapIconDrawableWithShadow*(drawable: Drawable): Drawable
  proc getBadgeDrawable*(badgeForeground: Drawable, backgroundColor: jint): Drawable
  proc getBadgedDrawable*(base: Drawable, badgeForeground: Drawable, backgroundColor: jint): Drawable

