import jnim

jclass android.safetycenter.SafetyCenterIssue* of JVMObject:
  proc getId*(): string
  proc getTitle*(): CharSequence
  proc getSubtitle*(): CharSequence
  proc getSummary*(): CharSequence
  proc getAttributionTitle*(): CharSequence
  proc getSeverityLevel*(): jint
  proc isDismissible*(): jboolean
  proc shouldConfirmDismissal*(): jboolean
  proc getActions*(): List[Action]
  proc getGroupId*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  ISSUE_SEVERITY_LEVEL_OK*: jint {.`static`.}
  ISSUE_SEVERITY_LEVEL_RECOMMENDATION*: jint {.`static`.}
  ISSUE_SEVERITY_LEVEL_CRITICAL_WARNING*: jint {.`static`.}
  CREATOR*: Creator[SafetyCenterIssue] {.`static`.}

jclass android.safetycenter.SafetyCenterIssue.Builder* of JVMObject:
  proc setId*(id: string): Builder
  proc setTitle*(title: CharSequence): Builder
  proc setSubtitle*(subtitle: CharSequence): Builder
  proc setSummary*(summary: CharSequence): Builder
  proc setAttributionTitle*(attributionTitle: CharSequence): Builder
  proc setSeverityLevel*(severityLevel: jint): Builder
  proc setDismissible*(dismissible: jboolean): Builder
  proc setShouldConfirmDismissal*(confirmDismissal: jboolean): Builder
  proc setActions*(actions: List[Action]): Builder
  proc setGroupId*(groupId: string): Builder
  proc build*(): SafetyCenterIssue

jclass android.safetycenter.SafetyCenterIssue.Action* of JVMObject:
  proc getId*(): string
  proc getLabel*(): CharSequence
  proc getPendingIntent*(): PendingIntent
  proc willResolve*(): jboolean
  proc isInFlight*(): jboolean
  proc getSuccessMessage*(): CharSequence
  proc getConfirmationDialogDetails*(): ConfirmationDialogDetails
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)

jclass android.safetycenter.Builder* of JVMObject:
  proc setId*(id: string): Builder
  proc setTitle*(title: CharSequence): Builder
  proc setSubtitle*(subtitle: CharSequence): Builder
  proc setSummary*(summary: CharSequence): Builder
  proc setAttributionTitle*(attributionTitle: CharSequence): Builder
  proc setSeverityLevel*(severityLevel: jint): Builder
  proc setDismissible*(dismissible: jboolean): Builder
  proc setShouldConfirmDismissal*(confirmDismissal: jboolean): Builder
  proc setActions*(actions: List[Action]): Builder
  proc setGroupId*(groupId: string): Builder
  proc build*(): SafetyCenterIssue

jclass android.safetycenter.Action* of JVMObject:
  proc getId*(): string
  proc getLabel*(): CharSequence
  proc getPendingIntent*(): PendingIntent
  proc willResolve*(): jboolean
  proc isInFlight*(): jboolean
  proc getSuccessMessage*(): CharSequence
  proc getConfirmationDialogDetails*(): ConfirmationDialogDetails
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[Action] {.`static`.}

jclass android.safetycenter.Action.ConfirmationDialogDetails* of JVMObject:
  proc getTitle*(): CharSequence
  proc getText*(): CharSequence
  proc getAcceptButtonText*(): CharSequence
  proc getDenyButtonText*(): CharSequence
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string

jclass android.safetycenter.Action.Builder* of JVMObject:
  proc setId*(id: string): Builder
  proc setLabel*(label: CharSequence): Builder
  proc setPendingIntent*(pendingIntent: PendingIntent): Builder
  proc setWillResolve*(willResolve: jboolean): Builder
  proc setIsInFlight*(inFlight: jboolean): Builder
  proc setSuccessMessage*(successMessage: CharSequence): Builder
  proc setConfirmationDialogDetails*(confirmationDialogDetails: ConfirmationDialogDetails): Builder
  proc build*(): Action

jclass android.safetycenter.ConfirmationDialogDetails* of JVMObject:
  proc getTitle*(): CharSequence
  proc getText*(): CharSequence
  proc getAcceptButtonText*(): CharSequence
  proc getDenyButtonText*(): CharSequence
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CREATOR*: Creator[ConfirmationDialogDetails] {.`static`.}

jclass android.safetycenter.Builder* of JVMObject:
  proc setId*(id: string): Builder
  proc setLabel*(label: CharSequence): Builder
  proc setPendingIntent*(pendingIntent: PendingIntent): Builder
  proc setWillResolve*(willResolve: jboolean): Builder
  proc setIsInFlight*(inFlight: jboolean): Builder
  proc setSuccessMessage*(successMessage: CharSequence): Builder
  proc setConfirmationDialogDetails*(confirmationDialogDetails: ConfirmationDialogDetails): Builder
  proc build*(): Action

