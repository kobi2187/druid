import jnim

jclass android.appwidget.AppWidgetProviderInfo* of JVMObject:
  proc loadLabel*(packageManager: PackageManager): string
  proc loadIcon*(context: Context, density: jint): Drawable
  proc loadPreviewImage*(context: Context, density: jint): Drawable
  proc loadDescription*(context: Context): CharSequence
  proc getProfile*(): UserHandle
  proc getActivityInfo*(): ActivityInfo
  proc writeToParcel*(output:Parcel, flags: jint)
  proc clone*(): AppWidgetProviderInfo
  proc describeContents*(): jint
  proc updateDimensions*(displayMetrics: DisplayMetrics)
  proc toString*(): string
  RESIZE_NONE*: jint {.`static`.}
  RESIZE_HORIZONTAL*: jint {.`static`.}
  RESIZE_VERTICAL*: jint {.`static`.}
  RESIZE_BOTH*: jint {.`static`.}
  WIDGET_CATEGORY_UNKNOWN*: jint {.`static`.}
  WIDGET_CATEGORY_HOME_SCREEN*: jint {.`static`.}
  WIDGET_CATEGORY_KEYGUARD*: jint {.`static`.}
  WIDGET_CATEGORY_SEARCHBOX*: jint {.`static`.}
  WIDGET_CATEGORY_NOT_KEYGUARD*: jint {.`static`.}
  WIDGET_FEATURE_RECONFIGURABLE*: jint {.`static`.}
  WIDGET_FEATURE_HIDE_FROM_PICKER*: jint {.`static`.}
  WIDGET_FEATURE_CONFIGURATION_OPTIONAL*: jint {.`static`.}
  provider*: ComponentName
  minWidth*: jint
  minHeight*: jint
  minResizeWidth*: jint
  minResizeHeight*: jint
  maxResizeWidth*: jint
  maxResizeHeight*: jint
  targetCellWidth*: jint
  targetCellHeight*: jint
  updatePeriodMillis*: jint
  initialLayout*: jint
  initialKeyguardLayout*: jint
  configure*: ComponentName
  label*: string
  icon*: jint
  autoAdvanceViewId*: jint
  previewImage*: jint
  previewLayout*: jint
  resizeMode*: jint
  widgetCategory*: jint
  descriptionRes*: jint
  widgetFeatures*: jint
  providerInfo*: ActivityInfo
  isExtendedFromAppWidgetProvider*: jboolean
  generatedPreviewCategories*: jint
  CREATOR*: Parcelable.Creator[AppWidgetProviderInfo] {.`static`.}

