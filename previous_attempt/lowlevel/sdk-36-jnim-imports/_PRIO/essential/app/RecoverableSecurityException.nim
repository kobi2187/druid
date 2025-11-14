import jnim

jclass android.app.RecoverableSecurityException* of SecurityException:
  proc getUserMessage*(): CharSequence
  proc getUserAction*(): RemoteAction
  proc showAsNotification*(context: Context, channelId: string)
  proc showAsDialog*(activity: Activity)
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[RecoverableSecurityException] {.`static`.}

jclass android.app.RecoverableSecurityException.LocalDialog* of JVMObject:
  proc onCreateDialog*(savedInstanceState: Bundle): Dialog

jclass android.app.LocalDialog* of DialogFragment:
  proc onCreateDialog*(savedInstanceState: Bundle): Dialog

