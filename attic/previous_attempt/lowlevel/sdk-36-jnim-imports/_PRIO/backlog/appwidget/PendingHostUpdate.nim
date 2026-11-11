import jnim

jclass android.appwidget.PendingHostUpdate* of JVMObject:
  proc updateAppWidget*(appWidgetId: jint, views: RemoteViews): PendingHostUpdate {.`static`.}
  proc providerChanged*(appWidgetId: jint, info: AppWidgetProviderInfo): PendingHostUpdate {.`static`.}
  proc viewDataChanged*(appWidgetId: jint, viewId: jint): PendingHostUpdate {.`static`.}
  proc appWidgetRemoved*(appWidgetId: jint): PendingHostUpdate {.`static`.}
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[PendingHostUpdate] {.`static`.}

