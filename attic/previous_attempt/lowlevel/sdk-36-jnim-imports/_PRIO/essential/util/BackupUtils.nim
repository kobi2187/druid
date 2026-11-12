import jnim

jclass android.util.BackupUtils* of JVMObject:
  proc readString*(in: DataInputStream): string {.`static`.}
  proc writeString*(output:DataOutputStream, val: string) {.`static`.}
  NULL*: jint {.`static`.}
  NOT_NULL*: jint {.`static`.}

jclass android.util.BadVersionException* of Exception:

