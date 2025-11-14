import jnim

jclass android.safetycenter.SafetyCenterData* of JVMObject:
  proc getStatus*(): SafetyCenterStatus
  proc getIssues*(): List[SafetyCenterIssue]
  proc getEntriesOrGroups*(): List[SafetyCenterEntryOrGroup]
  proc getStaticEntryGroups*(): List[SafetyCenterStaticEntryGroup]
  proc getDismissedIssues*(): List[SafetyCenterIssue]
  proc getExtras*(): Bundle
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[SafetyCenterData] {.`static`.}

jclass android.safetycenter.SafetyCenterData.Builder* of JVMObject:
  proc addIssue*(safetyCenterIssue: SafetyCenterIssue): SafetyCenterData.Builder
  proc addEntryOrGroup*(safetyCenterEntryOrGroup: SafetyCenterEntryOrGroup): SafetyCenterData.Builder
  proc addStaticEntryGroup*(safetyCenterStaticEntryGroup: SafetyCenterStaticEntryGroup): SafetyCenterData.Builder
  proc addDismissedIssue*(dismissedSafetyCenterIssue: SafetyCenterIssue): SafetyCenterData.Builder
  proc setExtras*(extras: Bundle): SafetyCenterData.Builder
  proc clearExtras*(): SafetyCenterData.Builder
  proc clearIssues*(): SafetyCenterData.Builder
  proc clearEntriesOrGroups*(): SafetyCenterData.Builder
  proc clearStaticEntryGroups*(): SafetyCenterData.Builder
  proc clearDismissedIssues*(): SafetyCenterData.Builder
  proc build*(): SafetyCenterData

jclass android.safetycenter.Builder* of JVMObject:
  proc addIssue*(safetyCenterIssue: SafetyCenterIssue): SafetyCenterData.Builder
  proc addEntryOrGroup*(safetyCenterEntryOrGroup: SafetyCenterEntryOrGroup): SafetyCenterData.Builder
  proc addStaticEntryGroup*(safetyCenterStaticEntryGroup: SafetyCenterStaticEntryGroup): SafetyCenterData.Builder
  proc addDismissedIssue*(dismissedSafetyCenterIssue: SafetyCenterIssue): SafetyCenterData.Builder
  proc setExtras*(extras: Bundle): SafetyCenterData.Builder
  proc clearExtras*(): SafetyCenterData.Builder
  proc clearIssues*(): SafetyCenterData.Builder
  proc clearEntriesOrGroups*(): SafetyCenterData.Builder
  proc clearStaticEntryGroups*(): SafetyCenterData.Builder
  proc clearDismissedIssues*(): SafetyCenterData.Builder
  proc build*(): SafetyCenterData

