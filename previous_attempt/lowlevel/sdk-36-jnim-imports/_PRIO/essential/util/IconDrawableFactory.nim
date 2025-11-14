import jnim

jclass android.util.IconDrawableFactory* of JVMObject:
  proc getBadgedIcon*(appInfo: ApplicationInfo): Drawable
  proc getBadgedIcon*(appInfo: ApplicationInfo, userId: jint): Drawable
  proc getBadgedIcon*(itemInfo: PackageItemInfo, appInfo: ApplicationInfo, userId: jint): Drawable
  proc getShadowedIcon*(icon: Drawable): Drawable
  proc newInstance*(context: Context): IconDrawableFactory {.`static`.}
  proc newInstance*(context: Context, embedShadow: jboolean): IconDrawableFactory {.`static`.}

