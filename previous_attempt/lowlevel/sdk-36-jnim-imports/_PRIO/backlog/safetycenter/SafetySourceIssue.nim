import jnim

jclass android.safetycenter.SafetySourceIssue* of JVMObject:
  proc getId*(): string
  proc getTitle*(): CharSequence
  proc getSubtitle*(): CharSequence
  proc getSummary*(): CharSequence
  proc getAttributionTitle*(): CharSequence
  proc getSeverityLevel*(): jint
  proc getIssueCategory*(): jint
  proc getActions*(): List[Action]
  proc getOnDismissPendingIntent*(): PendingIntent
  proc getIssueTypeId*(): string
  proc getCustomNotification*(): Notification
  proc getNotificationBehavior*(): jint
  proc getDeduplicationId*(): string
  proc getIssueActionability*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  ISSUE_CATEGORY_DEVICE*: jint {.`static`.}
  ISSUE_CATEGORY_ACCOUNT*: jint {.`static`.}
  ISSUE_CATEGORY_GENERAL*: jint {.`static`.}
  ISSUE_CATEGORY_DATA*: jint {.`static`.}
  ISSUE_CATEGORY_PASSWORDS*: jint {.`static`.}
  ISSUE_CATEGORY_PERSONAL_SAFETY*: jint {.`static`.}
  NOTIFICATION_BEHAVIOR_UNSPECIFIED*: jint {.`static`.}
  NOTIFICATION_BEHAVIOR_NEVER*: jint {.`static`.}
  NOTIFICATION_BEHAVIOR_DELAYED*: jint {.`static`.}
  NOTIFICATION_BEHAVIOR_IMMEDIATELY*: jint {.`static`.}
  ISSUE_ACTIONABILITY_MANUAL*: jint {.`static`.}
  ISSUE_ACTIONABILITY_TIP*: jint {.`static`.}
  ISSUE_ACTIONABILITY_AUTOMATIC*: jint {.`static`.}
  CREATOR*: Creator[SafetySourceIssue] {.`static`.}

jclass android.safetycenter.SafetySourceIssue.Action* of JVMObject:
  proc getId*(): string
  proc getLabel*(): CharSequence
  proc getPendingIntent*(): PendingIntent
  proc willResolve*(): jboolean
  proc getSuccessMessage*(): CharSequence
  proc getConfirmationDialogDetails*(): ConfirmationDialogDetails
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string

jclass android.safetycenter.SafetySourceIssue.Notification* of JVMObject:
  proc getTitle*(): CharSequence
  proc getText*(): CharSequence
  proc getActions*(): List[Action]
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string

jclass android.safetycenter.SafetySourceIssue.Builder* of JVMObject:
  proc setSubtitle*(subtitle: CharSequence): Builder
  proc setAttributionTitle*(attributionTitle: CharSequence): Builder
  proc setIssueCategory*(issueCategory: jint): Builder
  proc addAction*(actionData: Action): Builder
  proc clearActions*(): Builder
  proc setOnDismissPendingIntent*(onDismissPendingIntent: PendingIntent): Builder
  proc setCustomNotification*(customNotification: Notification): Builder
  proc setNotificationBehavior*(notificationBehavior: jint): Builder
  proc setDeduplicationId*(deduplicationId: string): Builder
  proc setIssueActionability*(issueActionability: jint): Builder
  proc build*(): SafetySourceIssue

jclass android.safetycenter.Action* of JVMObject:
  proc getId*(): string
  proc getLabel*(): CharSequence
  proc getPendingIntent*(): PendingIntent
  proc willResolve*(): jboolean
  proc getSuccessMessage*(): CharSequence
  proc getConfirmationDialogDetails*(): ConfirmationDialogDetails
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
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
  proc setWillResolve*(willResolve: jboolean): Builder
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
  proc setWillResolve*(willResolve: jboolean): Builder
  proc setSuccessMessage*(successMessage: CharSequence): Builder
  proc setConfirmationDialogDetails*(confirmationDialogDetails: ConfirmationDialogDetails): Builder
  proc build*(): Action

jclass android.safetycenter.Notification* of JVMObject:
  proc getTitle*(): CharSequence
  proc getText*(): CharSequence
  proc getActions*(): List[Action]
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CREATOR*: Creator[Notification] {.`static`.}

jclass android.safetycenter.Notification.Builder* of JVMObject:
  proc addAction*(action: Action): Builder
  proc addActions*(actions: List[Action]): Builder
  proc clearActions*(): Builder
  proc build*(): Notification

jclass android.safetycenter.Builder* of JVMObject:
  proc addAction*(action: Action): Builder
  proc addActions*(actions: List[Action]): Builder
  proc clearActions*(): Builder
  proc build*(): Notification

jclass android.safetycenter.Builder* of JVMObject:
  proc setSubtitle*(subtitle: CharSequence): Builder
  proc setAttributionTitle*(attributionTitle: CharSequence): Builder
  proc setIssueCategory*(issueCategory: jint): Builder
  proc addAction*(actionData: Action): Builder
  proc clearActions*(): Builder
  proc setOnDismissPendingIntent*(onDismissPendingIntent: PendingIntent): Builder
  proc setCustomNotification*(customNotification: Notification): Builder
  proc setNotificationBehavior*(notificationBehavior: jint): Builder
  proc setDeduplicationId*(deduplicationId: string): Builder
  proc setIssueActionability*(issueActionability: jint): Builder
  proc build*(): SafetySourceIssue

