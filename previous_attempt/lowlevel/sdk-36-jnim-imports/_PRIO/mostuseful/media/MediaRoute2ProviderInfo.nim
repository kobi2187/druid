import jnim

jclass android.media.MediaRoute2ProviderInfo* of JVMObject:
  proc isValid*(): jboolean
  proc getUniqueId*(): string
  proc getRoute*(routeId: string): MediaRoute2Info
  proc getRoutes*(): Collection[MediaRoute2Info]
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[MediaRoute2ProviderInfo] {.`static`.}

jclass android.media.MediaRoute2ProviderInfo.Builder* of JVMObject:
  proc setUniqueId*(packageName: string, uniqueId: string): Builder
  proc setSystemRouteProvider*(isSystem: jboolean): Builder
  proc addRoute*(route: MediaRoute2Info): Builder
  proc addRoutes*(routes: Collection[MediaRoute2Info]): Builder
  proc build*(): MediaRoute2ProviderInfo

jclass android.media.Builder* of JVMObject:
  proc setUniqueId*(packageName: string, uniqueId: string): Builder
  proc setSystemRouteProvider*(isSystem: jboolean): Builder
  proc addRoute*(route: MediaRoute2Info): Builder
  proc addRoutes*(routes: Collection[MediaRoute2Info]): Builder
  proc build*(): MediaRoute2ProviderInfo

