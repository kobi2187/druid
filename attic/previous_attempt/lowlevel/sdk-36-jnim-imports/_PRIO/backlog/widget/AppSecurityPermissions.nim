import jnim

jclass android.widget.AppSecurityPermissions* of JVMObject:
  proc getPermissionItemView*(context: Context, grpName: CharSequence, description: CharSequence, dangerous: jboolean): View {.`static`.}

