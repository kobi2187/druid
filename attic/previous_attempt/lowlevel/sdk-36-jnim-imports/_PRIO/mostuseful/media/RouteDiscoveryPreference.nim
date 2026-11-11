import jnim

jclass android.media.RouteDiscoveryPreference* of JVMObject:
  proc getPreferredFeatures*(): List[string]
  proc getDeduplicationPackageOrder*(): List[string]
  proc getAllowedPackages*(): List[string]
  proc shouldPerformActiveScan*(): jboolean
  proc shouldRemoveDuplicates*(): jboolean
  proc getExtras*(): Bundle
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc dump*(pw: PrintWriter, prefix: string)
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  CREATOR*: Creator[RouteDiscoveryPreference] {.`static`.}
  EMPTY*: RouteDiscoveryPreference {.`static`.}

jclass android.media.RouteDiscoveryPreference.Builder* of JVMObject:
  proc setPreferredFeatures*(preferredFeatures: List[string]): Builder
  proc setAllowedPackages*(allowedPackages: List[string]): Builder
  proc setShouldPerformActiveScan*(activeScan: jboolean): Builder
  proc setDeduplicationPackageOrder*(packageOrder: List[string]): Builder
  proc setExtras*(extras: Bundle): Builder
  proc build*(): RouteDiscoveryPreference

jclass android.media.Builder* of JVMObject:
  proc setPreferredFeatures*(preferredFeatures: List[string]): Builder
  proc setAllowedPackages*(allowedPackages: List[string]): Builder
  proc setShouldPerformActiveScan*(activeScan: jboolean): Builder
  proc setDeduplicationPackageOrder*(packageOrder: List[string]): Builder
  proc setExtras*(extras: Bundle): Builder
  proc build*(): RouteDiscoveryPreference

