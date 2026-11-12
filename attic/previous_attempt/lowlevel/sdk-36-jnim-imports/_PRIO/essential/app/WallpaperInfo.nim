import jnim

jclass android.app.WallpaperInfo* of JVMObject:
  proc getPackageName*(): string
  proc getServiceName*(): string
  proc getServiceInfo*(): ServiceInfo
  proc getComponent*(): ComponentName
  proc loadLabel*(pm: PackageManager): CharSequence
  proc loadIcon*(pm: PackageManager): Drawable
  proc loadThumbnail*(pm: PackageManager): Drawable
  proc loadAuthor*(pm: PackageManager): CharSequence
  proc loadDescription*(pm: PackageManager): CharSequence
  proc loadContextUri*(pm: PackageManager): Uri
  proc loadContextDescription*(pm: PackageManager): CharSequence
  proc getShowMetadataInPreview*(): jboolean
  proc supportsAmbientMode*(): jboolean
  proc getSettingsActivity*(): string
  proc getSettingsSliceUri*(): Uri
  proc supportsMultipleDisplays*(): jboolean
  proc shouldUseDefaultUnfoldTransition*(): jboolean
  proc dump*(pw: Printer, prefix: string)
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[WallpaperInfo] {.`static`.}

