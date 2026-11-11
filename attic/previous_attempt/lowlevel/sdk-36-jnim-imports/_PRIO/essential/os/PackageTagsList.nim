import jnim

jclass android.os.PackageTagsList* of JVMObject:
  proc isEmpty*(): jboolean
  proc includes*(packageName: string): jboolean
  proc includesTag*(attributionTag: string): jboolean
  proc containsAll*(packageName: string): jboolean
  proc contains*(packageName: string, attributionTag: string): jboolean
  proc contains*(packageTagsList: PackageTagsList): jboolean
  proc getPackages*(): Collection[string]
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc describeContents*(): jint
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc dump*(pw: PrintWriter)
  CREATOR*: Parcelable.Creator[PackageTagsList] {.`static`.}

jclass android.os.PackageTagsList.Builder* of JVMObject:
  proc add*(packageName: string): Builder
  proc add*(packageName: string, attributionTag: string): Builder
  proc add*(packageName: string, attributionTags: Collection[string]): Builder
  proc add*(packageTagsList: PackageTagsList): Builder
  proc add*(packageTagsMap: Map[string, ? extends Set[string]]): Builder
  proc remove*(packageName: string): Builder
  proc remove*(packageName: string, attributionTag: string): Builder
  proc remove*(packageName: string, attributionTags: Collection[string]): Builder
  proc remove*(packageTagsList: PackageTagsList): Builder
  proc remove*(packageTagsMap: Map[string, ? extends Set[string]]): Builder
  proc clear*(): Builder
  proc build*(): PackageTagsList

jclass android.os.Builder* of JVMObject:
  proc add*(packageName: string): Builder
  proc add*(packageName: string, attributionTag: string): Builder
  proc add*(packageName: string, attributionTags: Collection[string]): Builder
  proc add*(packageTagsList: PackageTagsList): Builder
  proc add*(packageTagsMap: Map[string, ? extends Set[string]]): Builder
  proc remove*(packageName: string): Builder
  proc remove*(packageName: string, attributionTag: string): Builder
  proc remove*(packageName: string, attributionTags: Collection[string]): Builder
  proc remove*(packageTagsList: PackageTagsList): Builder
  proc remove*(packageTagsMap: Map[string, ? extends Set[string]]): Builder
  proc clear*(): Builder
  proc build*(): PackageTagsList

