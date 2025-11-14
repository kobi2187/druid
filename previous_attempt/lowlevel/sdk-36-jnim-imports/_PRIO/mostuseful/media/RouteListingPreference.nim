import jnim

jclass android.media.RouteListingPreference* of JVMObject:
  proc getItems*(): List[Item]
  proc getUseSystemOrdering*(): jboolean
  proc getLinkedItemComponentName*(): ComponentName
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  ACTION_TRANSFER_MEDIA*: string {.`static`.}
  EXTRA_ROUTE_ID*: string {.`static`.}
  CREATOR*: Creator[RouteListingPreference] {.`static`.}

jclass android.media.RouteListingPreference.Builder* of JVMObject:
  proc setItems*(items: List[Item]): Builder
  proc setUseSystemOrdering*(useSystemOrdering: jboolean): Builder
  proc setLinkedItemComponentName*(linkedItemComponentName: ComponentName): Builder
  proc build*(): RouteListingPreference

jclass android.media.RouteListingPreference.Item* of JVMObject:
  proc getRouteId*(): string
  proc getSelectionBehavior*(): jint
  proc getFlags*(): jint
  proc getSubText*(): jint
  proc getCustomSubtextMessage*(): CharSequence
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint

jclass android.media.Builder* of JVMObject:
  proc setItems*(items: List[Item]): Builder
  proc setUseSystemOrdering*(useSystemOrdering: jboolean): Builder
  proc setLinkedItemComponentName*(linkedItemComponentName: ComponentName): Builder
  proc build*(): RouteListingPreference

jclass android.media.Item* of JVMObject:
  proc getRouteId*(): string
  proc getSelectionBehavior*(): jint
  proc getFlags*(): jint
  proc getSubText*(): jint
  proc getCustomSubtextMessage*(): CharSequence
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  SELECTION_BEHAVIOR_NONE*: jint {.`static`.}
  SELECTION_BEHAVIOR_TRANSFER*: jint {.`static`.}
  SELECTION_BEHAVIOR_GO_TO_APP*: jint {.`static`.}
  FLAG_ONGOING_SESSION*: jint {.`static`.}
  FLAG_ONGOING_SESSION_MANAGED*: jint {.`static`.}
  FLAG_SUGGESTED*: jint {.`static`.}
  SUBTEXT_NONE*: jint {.`static`.}
  SUBTEXT_ERROR_UNKNOWN*: jint {.`static`.}
  SUBTEXT_SUBSCRIPTION_REQUIRED*: jint {.`static`.}
  SUBTEXT_DOWNLOADED_CONTENT_ROUTING_DISALLOWED*: jint {.`static`.}
  SUBTEXT_AD_ROUTING_DISALLOWED*: jint {.`static`.}
  SUBTEXT_DEVICE_LOW_POWER*: jint {.`static`.}
  SUBTEXT_UNAUTHORIZED*: jint {.`static`.}
  SUBTEXT_TRACK_UNSUPPORTED*: jint {.`static`.}
  SUBTEXT_CUSTOM*: jint {.`static`.}
  CREATOR*: Creator[Item] {.`static`.}

jclass android.media.Item.Builder* of JVMObject:
  proc setSelectionBehavior*(selectionBehavior: jint): Builder
  proc setFlags*(flags: jint): Builder
  proc setSubText*(subText: jint): Builder
  proc setCustomSubtextMessage*(customSubtextMessage: CharSequence): Builder
  proc build*(): Item

jclass android.media.Builder* of JVMObject:
  proc setSelectionBehavior*(selectionBehavior: jint): Builder
  proc setFlags*(flags: jint): Builder
  proc setSubText*(subText: jint): Builder
  proc setCustomSubtextMessage*(customSubtextMessage: CharSequence): Builder
  proc build*(): Item

