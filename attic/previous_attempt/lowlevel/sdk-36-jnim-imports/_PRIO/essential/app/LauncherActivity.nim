import jnim

jclass android.app.LauncherActivity* of ListActivity:
  proc setTitle*(title: CharSequence)
  proc setTitle*(titleId: jint)
  proc makeListItems*(): List[ListItem]

jclass android.app.LauncherActivity.IconResizer* of JVMObject:
  proc createIconThumbnail*(icon: Drawable): Drawable

jclass android.app.ListItem* of JVMObject:
  resolveInfo*: ResolveInfo
  label*: CharSequence
  icon*: Drawable
  packageName*: string
  className*: string
  extras*: Bundle

jclass android.app.IconResizer* of JVMObject:
  proc createIconThumbnail*(icon: Drawable): Drawable

