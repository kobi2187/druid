import jnim

jclass android.provider.ContactsInternal* of JVMObject:
  proc startQuickContactWithErrorToast*(context: Context, intent: Intent) {.`static`.}
  proc startQuickContactWithErrorToastForUser*(context: Context, intent: Intent, user: UserHandle) {.`static`.}

