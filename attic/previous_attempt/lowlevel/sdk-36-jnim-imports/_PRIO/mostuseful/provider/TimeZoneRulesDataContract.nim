import jnim

jclass android.provider.TimeZoneRulesDataContract* of JVMObject:
  AUTHORITY*: string {.`static`.}

jclass android.provider.Operation* of JVMObject:
  CONTENT_URI*: Uri {.`static`.}
  COLUMN_TYPE*: string {.`static`.}
  TYPE_INSTALL*: string {.`static`.}
  TYPE_UNINSTALL*: string {.`static`.}
  TYPE_NO_OP*: string {.`static`.}
  COLUMN_DISTRO_MAJOR_VERSION*: string {.`static`.}
  COLUMN_DISTRO_MINOR_VERSION*: string {.`static`.}
  COLUMN_RULES_VERSION*: string {.`static`.}
  COLUMN_REVISION*: string {.`static`.}

